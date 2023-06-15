from flask_restful import Resource, request
from flask import jsonify
from marshmallow_sqlalchemy import SQLAlchemyAutoSchema

from dao import Tarefa as tdao

dados = tdao.TarefaDAO()


class TarefaSchema(SQLAlchemyAutoSchema):
  class Meta:
      model = dados.tb_tarefa


class TarefaRest (Resource):
  def __init__(self):
      self.campos = ['idt_tarefa', 'tit_tarefa', 'dsc_tarefa', 'sts_tarefa']

  def get(self):
      if request.args.get(self.campos[0]) is not None:
          obj = dados.readByIdt(request.args.get(self.campos[0]))
          sch = TarefaSchema()
          return jsonify(sch.dump(obj))
      elif request.args.get("sts_tarefa") is not None:
          lista = dados.readBySts(request.args.get("sts_tarefa"))
          sch = TarefaSchema(many=True)
          return jsonify(sch.dump(lista))
      else:
          lista = dados.readAll()
          sch = TarefaSchema(many=True)
          return jsonify(sch.dump(lista))

  def post(self):
      obj = dados.tb_tarefa()
      for c in self.campos:
          exec('obj.{}=request.args.get("{}")'.format(c, c))
      dados.create(obj)
      return jsonify({'insert': obj.idt_tarefa})

  def put(self):
      obj = dados.readByIdt(request.args.get(self.campos[0]))
      if obj is None:
          return jsonify({'update': 0})
      else:
          for c in self.campos:
              if request.args.get(c) is not None:
                  exec('obj.{}=request.args.get("{}")'.format(c, c))
          dados.update()
          return jsonify({'update': obj.idt_tarefa})

  def delete(self):
      idt = request.args.get(self.campos[0])
      obj = dados.readByIdt(idt)
      if obj is None:
          return jsonify({'delete': 0})
      else:
          dados.delete(obj)
          return jsonify({'delete': idt})
