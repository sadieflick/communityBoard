from flask import Flask, render_template, redirect, session, request, flash, url_for
# import the function connectToMySQL from the file mysqlconnection.py
from flask_bcrypt import Bcrypt
from mySQLconnection import connectToMySQL
import re

app = Flask(__name__)
bcrypt = Bcrypt(app) 

app.secret_key = "keepItSecretKeepItSafe"

EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$')

# invoke the connectToMySQL function and pass it the name of the database we're using
# connectToMySQL returns an instance of MySQLConnection, which we will store in the variable 'mysql'
mysql = connectToMySQL('wall')
# now, we may invoke the query_db method
#print("all the users", mysql.query_db("SELECT * FROM friends;"))

@app.route('/')
def index():

    if "email" in session or "first_name" in session or "last_name" in session:
        return render_template('index.html', email = session["email"], last_name=session["last_name"], first_name=session["first_name"])
    else:
        
        return render_template('index.html')


@app.route('/wall')
def wall():

    if "user_id" not in session:
        flash("You must be logged in to enter site.")
        return redirect('/')

    query = "SELECT messages.message, messages.created_at, users.first_name, users.last_name, messages.id FROM messages JOIN users on users.id = messages.user_id ORDER BY created_at DESC"
    session["messageList"] = mysql.query_db(query)

    query = "SELECT comments.comment, comments.created_at, users.first_name, users.last_name, comments.message_id FROM comments JOIN users on users.id = comments.user_id ORDER BY comments.created_at;"
    session["commentList"] = mysql.query_db(query)


    if "commentList" in session:
        print("in if for comment")
        return render_template('wall.html', messages= session['messageList'], commentList = session["commentList"])
    elif "messageList" in session:
        return render_template('wall.html', messages = session["messageList"])
    
    return render_template('wall.html')


@app.route('/register', methods=['POST'])
def submit():

    session["first_name"] = request.form["first_name"]
    session["last_name"] = request.form["last_name"]
    session["email"] = request.form["email"]
    password = request.form["password"]

    if len(request.form['email']) < 1 or len(request.form['first_name']) < 1 or len(request.form['last_name']) < 1 or len(request.form['password']) < 1:
        flash("All fields required")
        return redirect('/')

    if not request.form['first_name'].isalpha() or not request.form['last_name'].isalpha():
        flash("Name must only contain letters.")
        return redirect('/')
    
    if not EMAIL_REGEX.match(request.form['email']):
        flash("Invalid email address.")
        return redirect('/')
    if request.form['password'] != request.form["password2"]:
        flash("Passwords do not match")
        return redirect('/')
    x = request.form['password']
    if not re.search('\d.*[A-Z]|[A-Z].*\d', x):
        flash("Password must contain at least 1 uppercase letter and 1 number.")
        return redirect('/')
    

    searchQuery = "SELECT email FROM users WHERE email = %(email)s;"
    data = { 'email': request.form['email'] }
    alreadyInDB = mysql.query_db(searchQuery, data)

    if alreadyInDB:
        flash("Sign up unsuccessful. Account already exists.")
        return redirect ('/')
    else:
        print("did not find matching email")

        pw_hash = bcrypt.generate_password_hash(request.form['password'])  
        print(pw_hash)

        query2 = "INSERT INTO users (email, first_name, last_name, password) VALUES (%(email)s, %(first_name)s, %(last_name)s, %(password_hash)s);"
        data = {
                'email': request.form['email'],
                'first_name': request.form['first_name'],
                'last_name': request.form['last_name'],
                'password_hash': pw_hash
            }

        mysql.query_db(query2, data)

        session["successMessage"] = "Welcome "
        idQuery = "SELECT id FROM users WHERE email = %(email)s"
        data = { 'email': request.form['email']}
        userID = mysql.query_db(idQuery, data)[0]["id"]

        session["user_id"] = userID
        return redirect("/wall")

@app.route("/login", methods = ["POST"])
def login():


    searchQuery = "SELECT * FROM users WHERE email = %(email)s;"
    data = { 'email': request.form['email'] }
    emailAlreadyInDB = mysql.query_db(searchQuery, data)

    if emailAlreadyInDB:
        if bcrypt.check_password_hash(emailAlreadyInDB[0]['password'], request.form['password']):

        # Get first name to return in success log in in Session
            query = "SELECT first_name, id, email, last_name FROM users WHERE email = %(email)s;"
            data = { 'email': request.form['email']}
            session["first_name"] = mysql.query_db(query, data)[0]["first_name"]
            session["email"] = mysql.query_db(query, data)[0]["email"]
            session["last_name"] = mysql.query_db(query, data)[0]["last_name"]

            session["user_id"] = mysql.query_db(query, data)[0]["id"]
            session["successMessage"] = "Welcome, "

        return redirect("/wall")
    else:
        flash("Log in unsuccessful")
        return redirect("/")

@app.route("/logout")
def logout():
    
    session.clear()

    flash("You have been logged out.")
    return redirect('/')

@app.route("/post", methods = ["POST"])
def post():
    
    insert = "INSERT INTO messages (message, user_id) VALUES(%(message)s, %(user_id)s);"
    data = { 'message': request.form['message'],
            'user_id': session["user_id"]
    }
    mysql.query_db(insert, data)

    return redirect("/wall")

@app.route("/comment", methods = ["POST"])
def comment():
    print("Entered post method")
    
    insert = "INSERT INTO comments (comment, user_id, message_id) VALUES(%(comment)s, %(user_id)s, %(message_id)s);"
    data = { 'comment': request.form['comment'],
            'user_id': session["user_id"],
            'message_id': request.form["message_id"]
    }

    postcomment = mysql.query_db(insert, data)
    print("Posting comment", postcomment)

    return redirect("/wall")

if __name__ == "__main__":
    app.run(debug=True)
