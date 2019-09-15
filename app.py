from flask import Flask

import requests
from flask import Flask
  

app = Flask(__name__) @app.route("/")

@app.route('/')
def ami_id():
    metadataurl = 'www.google.com'
    print('getting url')
    ami = requests.get(metadataurl)
    version = '1'
    ami_id = 'ami_v{}'.format(version)
    return ami_id