from flask import Flask
from flask_restful import Api
from rest import Tarefa as tRest

app = Flask(__name__)
api = Api(app)


@app.after_request
def after_request(response):
   response.headers.add('Access-Control-Allow-Origin', '*')
   response.headers.add('Access-Control-Allow-Headers', 'Content-Type,Authorization')
   response.headers.add('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE')
   return response


api.add_resource(tRest.TarefaRest, '/tarefas', endpoint='tarefas')

if __name__ == '__main__':
   app.run(debug=True)
