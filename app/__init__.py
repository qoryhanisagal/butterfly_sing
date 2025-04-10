from flask import Flask

# I'm importing the Flask class from the flask package.
# This will let me create the main app object for my project.

app = Flask(__name__)  
# Here, I'm creating an instance of the Flask class and naming it 'app'.
# This object will be the core of my web application — it holds all the routes and settings.
# The variable '__name__' helps Flask determine where to find templates, static files, etc.
# If I run this file directly, '__name__' becomes '__main__'. Otherwise, it reflects the module name.

from app import routes  
# I’m importing my routes from the 'routes.py' file inside the 'app' folder.
# This is important because it registers the route functions to the app object.
# I placed this at the bottom to avoid circular import errors since routes.py also imports 'app'.