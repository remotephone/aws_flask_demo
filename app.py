from flask import Flask

import requests
from flask import Flask
  

app = Flask(__name__)

@app.route('/')
def ami_id():
    metadataurl = 'http://169.254.169.254/latest/meta-data/ami-id'
    ami = requests.get(metadataurl)
    version = '1'
    ami_id = 'ami_v{}'.format(version)
    return ami_id


if __name__ == '__main__':
  app.run(host='0.0.0.0', port=80)