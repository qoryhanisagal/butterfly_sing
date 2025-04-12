from app import app  
# I'm importing the 'app' object that I created in __init__.py.
# This gives me access to use decorators like @app.get() to define routes.

@app.get("/")  
# I'm creating a route for the base URL ("/") of my web app.
# When someone visits the root of my site, this function will run and return a simple welcome message.

def home():
    # This is the view function for the root route.
    # I'm returning a dictionary with a greeting and a hint about using the /aboutme route.
    return {
        "message": "Welcome to my Flask app ✨",
        "try": "/aboutme to view my profile"
    }

@app.get("/aboutme")  
# I'm creating a route that listens for GET requests at the URL '/aboutme'.
# This means when someone visits /aboutme in the browser, the function below will run.

def profile():  
    # This is my view function — it handles what should happen when someone visits /aboutme.
    # In this case, I'm returning a dictionary with my basic profile info.

    me = {
        "first_name": "Koiree",
        "last_name": "Descoteaux",
        "hobbies": ["Reading", "cooking", "hiking"],
        "is_online": True,
    }

    return me  
    # Flask automatically converts this dictionary to JSON and sends it as the HTTP response.