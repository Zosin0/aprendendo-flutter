# *Aprendendo Flutter*
Projeto de Programação para Dispositivos Móveis para aprender flutter com Back-End e Frontend

### É necessário criar uma database no MySQL Workbench para conseguir transferir os dados pelo Back-End
```sql
CREATE DATABASE IF NOT EXISTS test;

USE test;

CREATE TABLE tb_tarefa(
   idt_tarefa INT AUTO_INCREMENT PRIMARY KEY,
   tit_tarefa VARCHAR(30) NOT NULL,
   dsc_tarefa TEXT NOT NULL,
   sts_tarefa ENUM('B', 'M', 'A') NOT NULL);

SELECT * FROM tb_tarefa;
```
### Para rodar é necessário alterar o usuário da database no back-end em sua máquina
```bash
flutter run
```
