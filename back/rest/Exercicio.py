from flask_restful import Resource, request
from flask import jsonify
from marshmallow_sqlalchemy import SQLAlchemyAutoSchema

from dao import Exercicio as exer

dados = exer.ExercicioDAO()


class ExercicioSchema(SQLAlchemyAutoSchema):
  class Meta:
      model = dados.tb_exercicio


class ExercicioRest (Resource):
  def __init__(self):
      self.campos = ['idt_exercicio', 'nme_exercicio', 'dsc_exercicio', 'num_repeticao_exercicio', 'num_gasto_calorico_exercicio']

  def get(self):
      if request.args.get(self.campos[0]) is not None:
          obj = dados.readByIdt(request.args.get(self.campos[0]))
          sch = ExercicioSchema()
          return jsonify(sch.dump(obj))
      elif request.args.get("nme_exercicio") is not None:
          lista = dados.readBySts(request.args.get("nme_exercicio"))
          sch = ExercicioSchema(many=True)
          return jsonify(sch.dump(lista))
      else:
          lista = dados.readAll()
          sch = ExercicioSchema(many=True)
          return jsonify(sch.dump(lista))

  def post(self):
      obj = dados.tb_exercicio()
      for c in self.campos:
          exec('obj.{}=request.args.get("{}")'.format(c, c))
      dados.create(obj)
      return jsonify({'insert': obj.idt_exercicio})

  def put(self):
      obj = dados.readByIdt(request.args.get(self.campos[0]))
      if obj is None:
          return jsonify({'update': 0})
      else:
          for c in self.campos:
              if request.args.get(c) is not None:
                  exec('obj.{}=request.args.get("{}")'.format(c, c))
          dados.update()
          return jsonify({'update': obj.idt_exercicio})

  def delete(self):
      idt = request.args.get(self.campos[0])
      obj = dados.readByIdt(idt)
      if obj is None:
          return jsonify({'delete': 0})
      else:
          dados.delete(obj)
          return jsonify({'delete': idt})
