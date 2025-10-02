# Django Hello World Project 🚀

This is a minimal **Django Hello World** web application created as part of the **Moringa AI Capstone Project - October 2025**.  
It demonstrates Django fundamentals including project structure, URL routing, views, and running a development server.

***

## 📌 Overview
- **Framework:** Django (Python)  
- **Pattern:** Model-View-Template (MVT)  
- **Goal:** Display "Hello World" in the browser at the root URL (`/`).

***

## ⚙️ Requirements
- Python 3.8+  
- pip (comes with Python)  
- Virtual environment (venv)  
- Browser (Chrome/Firefox)

***

## 🛠 Setup & Installation

### 1. Clone Repository
```bash
git clone https://github.com/toxidity-18/MoringaAICapstoneProject.git
cd Django
```

### 2. Create Virtual Environment
```bash
python -m venv env
```

### 3. Activate Virtual Environment

#### Linux/Mac:
```bash
source env/bin/activate
```

#### Windows (CMD):
```bash
env\Scripts\activate
```

### 4. Install Dependencies
```bash
pip install -r requirements.txt
```

***

## ▶️ Running the Project

Start the development server:
```bash
python manage.py runserver
```

Visit in browser:  
[http://127.0.0.1:8000/](http://127.0.0.1:8000/)  

You should see:  
*Hello World from Django!*

***

## 📂 Project Structure

```
Django/
│
├── env/                     # Virtual environment (excluded from git)
├── Django_Hello_World/      # Main project settings
│   ├── settings.py
│   ├── urls.py
│   └── ...
│
├── hello/                   # App directory
│   ├── views.py
│   ├── urls.py
│   └── ...
│
├── manage.py
├── requirements.txt
├── .gitignore
└── README.md
```

***

## 🐛 Common Issues & Fixes

- **django-admin not found**  
  → Make sure venv is activated, reinstall with `pip install django`.

- **ModuleNotFoundError: No module named 'hello'**  
  → Add `'hello'` to `INSTALLED_APPS` in `settings.py`.

- **Port 8000 already in use**  
  → Run `python manage.py runserver 8080` or kill existing process.

***

## 📚 References

- Django Official Docs  
- Django Tutorial Part 1  
- LearnDjango.com

***

## ✨ Next Steps

- Add templates (HTML rendering)  
- Add static files (CSS/JS)  
- Explore Django Admin  
- Deploy to Heroku/PythonAnywhere