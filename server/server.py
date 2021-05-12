from flask import Flask

app = Flask(__name__)

# TODO add all routes from the doc here
# TODO Take json replies with according names from json/replies_examples folder


@app.route('/api//test')
def index():
    return {"main_text": "This is a test page"}


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=3000)