from sqlalchemy import create_engine
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import sessionmaker

class TarefaDAO:
    def __init__(self):
        # Ligação com o esquema de banco de dados
        engine = create_engine("mysql+mysqlconnector://root:nome_de_usuario@localhost/test?charset=utf8mb4")

        # Mapeamento Objeto Relacional com o SQLAlchemy
        DB = automap_base()
        DB.prepare(engine, reflect=True)
        self.tb_tarefa = DB.classes.tb_tarefa

        # Trabalho com sessões da base agora Objeto-Relacional
        session_factory = sessionmaker(bind=engine)
        self.ses = session_factory()
        # -------------------------------------------------------------------------------------------------


    def create(self, obj):
        self.ses.add(obj)
        self.ses.commit()


    def readAll(self):
        objs = self.ses.query(self.tb_tarefa).all()
        return objs


    def readByIdt(self, idt):
        obj = self.ses.query(self.tb_tarefa).filter_by(idt_tarefa=idt).first()
        return obj


    def readBySts(self, sts):
        objs = self.ses.query(self.tb_tarefa).filter_by(sts_tarefa=sts).all()
        return objs


    def update(self):
        self.ses.commit()


    def delete(self, obj):
        self.ses.delete(obj)
        self.ses.commit()


    def getSessao(self):
        return self.ses


    def __del__(self):
        self.ses.close()
