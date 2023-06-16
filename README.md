# *Aprendendo Flutter*
Projeto de Programação para Dispositivos Móveis para aprender flutter com Back-End e Frontend

### É necessário criar uma database no MySQL Workbench para conseguir transferir os dados pelo Back-End
```sql
CREATE DATABASE pdm;

USE pdm;

CREATE TABLE tb_exercicio(
  idt_exercicio INT AUTO_INCREMENT PRIMARY KEY,
  nme_exercicio VARCHAR(50) NOT NULL,
  dsc_exercicio TEXT NOT NULL,
  num_repeticao_exercicio INT NOT NULL,
  num_gasto_calorico_exercicio INT NOT NULL);

SELECT * FROM tb_exercicio;
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
![image](https://github.com/Zosin0/aprendendo-flutter/assets/53053622/405c90b0-504f-4050-a03d-1ef7ab08f7da)
![image](https://github.com/Zosin0/aprendendo-flutter/assets/53053622/836958d4-e4cc-40ed-935b-efe881a05d30)


## Aplicação: Back-End (API dados)
![image](https://github.com/Zosin0/aprendendo-flutter/assets/53053622/7edfdec6-3605-401e-b6b1-95655be8f992)
![image](https://github.com/Zosin0/aprendendo-flutter/assets/53053622/d37ffd7b-833f-4a61-8801-23815f9563b9)
![image](https://github.com/Zosin0/aprendendo-flutter/assets/53053622/02183051-d1c8-494d-ad95-90254be8d36b)

