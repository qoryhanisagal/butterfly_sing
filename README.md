# 🦋 Flask App + Git + SSH: Class 1 Notes

---

### 📝 Overview

This project is part of **111: Class 1** in the Full Stack Development Immersion program. It introduces foundational concepts in Flask, Git, and SSH through the creation of a simple web application. The app is designed to demonstrate how to:

- Structure a Flask project using best practices
- Create and test HTTP GET routes
- Return data using Python dictionaries formatted as JSON
- Use Git to track and commit changes
- Generate and add an SSH key to GitHub for secure version control

The application includes two routes:
- `/` – A welcome message with guidance
- `/aboutme` – A profile dictionary returned as a JSON response

---

## 🚀 Flask Basics: Starting a Web Application

### 1. Importing from Flask
```python
from flask import Flask
```
- `Flask` is a **class** from the `flask` package.
- Flask is a **micro web framework** used to build web applications in Python.
- Importing it gives us access to the tools needed to create routes and manage requests.

### 2. Creating the Flask App
```python
app = Flask(__name__)
```

- This line **creates an instance** of the `Flask` class.
- `app` is now an **object** representing your web application.
- `__name__` is a special built-in Python variable that represents the **name of the current module**.
  - If running directly, `__name__` becomes `'__main__'`.
  - It helps Flask know where to find resources like templates and static files.

### 3. Defining a Route and View Function
```python
@app.get("/")
def profile():
    me = {
        "first_name": "Koiree",
        "last_name": "Descoteaux",
        "hobbies": ["reading", "cooking", "hiking"],
        "is_online": True,
    }
    return me
```
- This returns the dictionary to the client.
- Flask automatically converts it into a **JSON response**.

---

### 📌 Routes

#### 🔗 `/` (Root Route)
- **Method**: `GET`
- **Description**: Returns a welcome message and provides guidance on where to go next.
- **Example Response**:
```json
{
  "message": "Welcome to my Flask app ✨",
  "try": "/aboutme to view my profile"
}
```

#### 🔗 `/aboutme`
- **Method**: `GET`
- **Description**: Returns a JSON representation of my profile using a Python dictionary.
- **Example Response**:
```json
{
  "first_name": "Koiree",
  "last_name": "Descoteaux",
  "hobbies": ["reading", "cooking", "hiking"],
  "is_online": true
}
```

---

### 🪀 Notes on Python Dictionary:

---

### 🧠 Python Dictionary Refresher

In Python, a **dictionary** is a collection of **key-value pairs**, written like this:
```python
dictionary = {
    "key1": value1,
    "key2": value2,
}
```
- Each **key** must be **unique** and is usually written as a **string (in quotes)**.
- Each **value** can be of any data type: string, number, list, boolean, dictionary, etc.

### 🗒️ Breakdown of the `me` Dictionary:

| Key (in quotes)   | Value                                 | Data Type        |
|------------------|----------------------------------------|------------------|
| `"first_name"`   | `"Koiree"`                             | String           |
| `"last_name"`    | `"Descoteaux"`                         | String           |
| `"hobbies"`      | `["reading", "cooking", "hiking"]`      | List of Strings  |
| `"is_online"`    | `True`                                 | Boolean          |

### ✅ Key Points to Remember:
- The **quotes around the keys** like `"first_name"` are **required** because Python expects dictionary keys to be strings (or another hashable type).
- The **values** can be diverse: string, list, boolean, another dictionary, etc.
- This data structure is commonly used to represent **structured data** (like a user profile, configuration, etc.)

### 🧠 Quick Analogy:
Think of a Python dictionary like a real-life form:

| Label (Key)       | Information (Value)        |
|------------------|----------------------------|
| First Name        | Koiree                     |
| Last Name         | Descoteaux                 |
| Hobbies           | reading, cooking, hiking   |
| Online Status     | True (yes)                 |

---

Each label is always in **quotes** in Python because it’s treated as a **string key**.

---

## 🔑 macOS: Create & Add SSH Key to GitHub

### 1. Check if you have an SSH key already
```bash
ls -al ~/.ssh
```
Look for files like `id_rsa` and `id_rsa.pub` or `id_ed25519` and `id_ed25519.pub`.

### 2. Generate a New SSH Key (if needed)
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```
- Press `Enter` to accept default location
- Use a passphrase if desired (for extra security)

### 3. Add Key to SSH Agent
```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

### 4. Copy Public Key and Add to GitHub
```bash
pbcopy < ~/.ssh/id_ed25519.pub
```
Then:
- Go to GitHub > Settings > SSH and GPG Keys
- Click **New SSH Key**
- Paste the key and give it a label (e.g., "Koiree MacBook")

---

## 📂 Set Up .gitignore for Python Projects
Create a `.gitignore` file at the root of your project and add:
```gitignore
venv/
__pycache__/
```
- `venv/`: ignore virtual environment files
- `__pycache__/`: ignore Python bytecode and compiled files

---

## 📖 Git: Version Control Essentials

### 1. Initialize a Git Repo
```bash
git init
```
- Starts a **new local git repository** in the current folder
- Creates a `.git/` directory that tracks changes and stores commit history

### 2. Staging Files
```bash
git add .     # Adds all tracked and untracked files in the current directory

git add -A    # Adds all changes (including file deletions)
```

### 3. Check the Status
```bash
git status
```
- Shows which files are **staged**, **unstaged**, or **untracked**

### 4. Unstage Files
```bash
git reset     # Removes files from staging area (but keeps changes in working directory)
```

---

## 📃 Create and Push to GitHub Repo

### 1. Create a new repository on GitHub
- Name it (e.g., `butterfly_sing`)
- Choose SSH as the method

### 2. Connect Local Repo to GitHub (via SSH)
```bash
git remote add origin git@github.com:qoryhanisagal/butterfly_sing.git
```

### 3. Set Main Branch
```bash
git branch -M main
```

### 4. Push to GitHub
```bash
git push -u origin main
```
- `-u` sets `origin main` as the **default upstream**, so next time you can just use `git push`

---

### 💬 My Reflection

In this first class project, I focused on building a foundational understanding of how Flask works and how to structure a real-world web application from the ground up. I learned how to:

- Create a Flask app using object-oriented principles by initializing the app inside an `__init__.py` file and importing route logic from a separate module. This taught me how scalable projects are built using clean, modular code.
- Define HTTP GET routes using `@app.get()` and return responses using Python dictionaries. Flask automatically converted the dictionary to a JSON response, which helped me understand how back-end APIs serve data to clients.
- Organize files using a project structure that mirrors professional applications, including separating logic across `run.py`, `__init__.py`, and `routes.py`.
- Use Git confidently by initializing a repository, staging files, writing clear commit messages, and pushing my work to GitHub. I also learned how to commit changes incrementally to show progress and intentionality — instead of lumping everything into one commit.
- Set up SSH for GitHub so I can push securely without entering my username and password every time. This step was challenging at first but taught me about the value of developer automation and security.

What stood out most to me was how everything connects — setting up routes in Flask required me to think in Python, but organizing the project and pushing it to GitHub made me think like a developer working in the real world. Every file, command, and decision became part of a bigger picture.

This project gave me a strong sense of ownership and clarity. I’m proud of how I structured the code, documented my learning, and brought everything together using Git. It’s a great foundation to build on for future classes.
