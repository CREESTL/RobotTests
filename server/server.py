from flask import Flask
import json
import os


app = Flask(__name__)
path = os.path.dirname(os.path.abspath(__file__))

# TODO  do everything according to the scheme

@app.route('/api/qEnableService.json', methods=["POST"])
def qEnableService():
    return json.load(open(path + "/_json/replies_examples/qEnableService.json", 'r'))


@app.route('/api/qConsumersList.json', methods=["POST"])
def qConsumersList():
    return json.load(open(path + "/_json/replies_examples/qConsumersList.json", 'r'))


@app.route('/api/qConsumerRegistration.json', methods=["POST"])
def qConsumerRegistration():
    return json.load(open(path + "/_json/replies_examples/qConsumerRegistration.json", 'r'))


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=3000)