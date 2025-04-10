from flask import     # From the flask package imprt the Flask class
# OPP class is a blueprint for creating web applications.
# class  consists of methods and attributes that define the behavior of the application.

app = Flask(__name__) # Create an instance of the Flask class (app is now a object)
# All properties and methods of the Flask class are now available to the app object.
# The __name__ variable is a special(thunder or magic)  built-in variable in Python that represents the name of 
# Python module that is currently being executed. It is a directory with Python files.
# A package is a collection of Python modules organized in a directory hierarchy.

@app.get("/")          # Flask decorator that maps HTTP methods and resources (routes) to view functions
# The @app.get("/") decorator is used to define a route for the root URL ("/") of the application.
# It is a wrapper function that takes a function as an argument and returns a new function.
# The function is called a view function and is responsible for handling requests to that URL.
def profile():        # View Function
    me= {             # Python Dictionary to represent the profile
        "first_name": "Koiree",
        "last_name": "Descoteaux",
        "hobbies": "reading", "cooking", "hiking",
        "is_online": True,
    }
    return me # Return the dictionary automatically converts it to as a JSON response. 