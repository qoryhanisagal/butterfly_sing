from flask import Flask  # ✅ Correct: Import the Flask class from the lowercase 'flask' package

# 🧠 OOP Reminder:
# A class is a blueprint for creating web applications.
# The Flask class has methods and attributes that define the behavior of your app.

app = Flask(__name__)  # ✅ Create an instance of the Flask class (app is now an object)
# All properties and methods of the Flask class are now available to the 'app' object.
# __name__ is a special (magic/thunder) built-in variable in Python that represents the name of 
# the current module being executed. If the script is run directly, __name__ == '__main__'

@app.get("/")  # ✅ Flask decorator that maps HTTP GET requests for the root URL ("/") to the view function below
# The @app.get("/") decorator is a wrapper function that takes 'profile' as input and returns a new wrapped function.
# This route handles the homepage or base URL of your web application.

def profile():  # ✅ This is a view function — it gets called when someone visits the root URL
    me = {  # ✅ Python dictionary representing a user profile
        "first_name": "Koiree",
        "last_name": "Descoteaux",
        "hobbies": ["reading", "cooking", "hiking"],
        "is_online": True,
    }

    # ✅ Flask automatically converts dictionaries to JSON responses when returned from a view function
    return me