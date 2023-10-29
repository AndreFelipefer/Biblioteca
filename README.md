




<h1 align="center"> Biblioteca </h1>

## O objetivo deste exercício é criar um sistema de biblioteca usando SQL Server. O sistema deverá ser capaz de gerenciar empréstimos de livros, incluindo a verificação de disponibilidade, o registro de novos empréstimos, o cálculo de multas e a recuperação de informações sobre empréstimos atuais.
![image](https://github.com/AndreFelipefer/Biblioteca/assets/129207232/4a41120e-1fdc-4dc5-b5c8-e9232d1840c9)

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
[RegistrarEmprestimos.txt](https://github.com/AndreFelipefer/Biblioteca/files/13198740/RegistrarEmprestimos.txt)
<hr>

```SQL
CALL RegistrarEmprestimo(1, 1, '2023-10-29', '2023-11-29');

````
### Crie outra stored procedure para recuperar a lista de livros emprestados por um cliente específico.
```SQL
CALL ListaLivrosEmprestadosPorCliente(1);
```
[ListaLivros.txt](https://github.com/AndreFelipefer/Biblioteca/files/13198739/ListaLivros.txt)

### Implemente uma stored procedure que calcule multas para empréstimos atrasados.
```SQL
CALL CalcularMultas();
```
[CalcularMultas.txt](https://github.com/AndreFelipefer/Biblioteca/files/13198738/CalcularMultas.txt)

<hr>

## Views:

### Crie uma view que mostre os livros disponíveis para empréstimo, excluindo aqueles que já foram emprestados.
```SQL
SELECT * FROM LivrosDisponiveis;
```
[CREATE VIEW LivrosDisponiveis AS.txt](https://github.com/AndreFelipefer/Biblioteca/files/13198736/CREATE.VIEW.LivrosDisponiveis.AS.txt)

### Implemente uma view que forneça uma lista de todos os empréstimos atuais, incluindo os detalhes dos livros emprestados e dos clientes.
```SQL
SELECT * FROM EmpréstimosAtuais;
```
[CREATE VIEW EmpréstimosAtuais AS.txt](https://github.com/AndreFelipefer/Biblioteca/files/13198734/CREATE.VIEW.EmprestimosAtuais.AS.txt)

## FIM 
