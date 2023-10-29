Trigger <h1 align="center"> Biblioteca </h1>

## O objetivo deste exercício é criar um sistema de biblioteca usando SQL Server. O sistema deverá ser capaz de gerenciar empréstimos de livros, incluindo a verificação de disponibilidade, o registro de novos empréstimos, o cálculo de multas e a recuperação de informações sobre empréstimos atuais.
![image](https://github.com/AndreFelipefer/Biblioteca/assets/129207232/a27c901d-8b72-4983-8d16-e7cda1c00000)

<hr>
### Livros: Armazene informações sobre cada livro, incluindo título, ISBN, ano de publicação e um identificador exclusivo.

### Autores: Registre informações sobre os autores, como nome, data de nascimento e nacionalidade.
![image](https://github.com/AndreFelipefer/Biblioteca/assets/129207232/dc538041-28c2-4ff0-9de9-16541973a3ae)

### Editoras: Mantenha detalhes sobre as editoras, como nome e endereço.
![image](https://github.com/AndreFelipefer/Biblioteca/assets/129207232/6e7bef2c-4b5a-4154-8eb3-f0a09fd6424e)

### Clientes: Mantenha detalhes sobre os clientes, como nome, cpf, dataNascimento, endereco.
![image](https://github.com/AndreFelipefer/Biblioteca/assets/129207232/8c0164f8-952f-42bf-8a46-8211a40421b0)

### Empréstimos: Controle os empréstimos de livros, incluindo a data de empréstimo e de devolução, bem como o status do empréstimo (pendente, devolvido, atrasado).
![image](https://github.com/AndreFelipefer/Biblioteca/assets/129207232/64bc8c71-c331-4786-ba29-91e364f5dd3d)

<hr>

## Stored Procedures:

### Crie uma stored procedure para registrar um novo empréstimo, verificando a disponibilidade do livro e atualizando o estoque.
Obs: Adicionado coluna estoque manual pois não consta na aba tabelas esta coluna, conforme enunciado:
```SQL
alter table livro add estoque int;
````

### Crie outra stored procedure para recuperar a lista de livros emprestados por um cliente específico.

### Implemente uma stored procedure que calcule multas para empréstimos atrasados.

<hr>

## Views:

### Crie uma view que mostre os livros disponíveis para empréstimo, excluindo aqueles que já foram emprestados.

### Implemente uma view que forneça uma lista de todos os empréstimos atuais, incluindo os detalhes dos livros emprestados e dos clientes.
