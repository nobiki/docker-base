from flask import Flask, render_template
app = Flask(__name__)

import os

@app.route("/")
def hello():
    name = os.environ.get("FOO")
    return render_template("hello.html", title="flask test", name=name)

if __name__ == "__main__":
    app.run(debug=True)
