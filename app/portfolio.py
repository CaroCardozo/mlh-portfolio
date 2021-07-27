from flask import Blueprint, render_template, request
from dotenv import load_dotenv
from werkzeug.security import check_password_hash, generate_password_hash
#from __init__.py import UserModel, db
#from app.db import get_db

load_dotenv()

portfolio = Blueprint("portfolio", __name__, template_folder="templates")


@portfolio.route("/")
def index():
    title = "Carolina"
    description = "About Me"
    return render_template(
        "index.html",
        title=title,
        description=description,
    )


@portfolio.route("/projects/")
def projects():
    title = "Projects"
    description = "Project"
    return render_template(
        "projects.html",
        title=title,
        description=description,
    )


@portfolio.route("/contact/")
def contact():
    title = "Contact"
    description = "contact"
    return render_template(
        "contact.html",
        title=title,
        description=description,
    )


@portfolio.route("/resume/")
def resume():
    title = "Resume"
    description = "Resume"
    return render_template(
        "resume.html",
        title=title,
        description=description,
    )





