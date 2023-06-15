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
### Para rodar o back-end é necessário instalar os pacotes do Flask que estão no 'requirements.txt'
#### Basta rodar o comando no diretório do back-end:
```
pip install -r requirements.txt
```

### Para rodar o front-end é necessário ter o flutter instalado em sua máquina
```
flutter run
```



## Aplicação: Front
![image](https://github.com/Zosin0/aprendendo-flutter/assets/53053622/f348a723-d67d-4869-b666-800df523f3a8)
![image](https://github.com/Zosin0/aprendendo-flutter/assets/53053622/a0ef6ba3-398e-4cda-8057-acb6f9315600)

## Aplicação: Back-End (API dados)
![image](https://github.com/Zosin0/aprendendo-flutter/assets/53053622/5ff38c6a-9fc8-472b-938a-c7c7f981477c)
