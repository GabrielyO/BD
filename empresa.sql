insert into Territories values(1, 'Espirito Santo',1);
insert into Territories values(2, 'Bahia',2);
insert into Territories values(3, 'Rio de Janeiro',3);
insert into Territories values(4, 'S�o Paulo',4);

insert into Employees values(1, 'Dias', 'Davi', 'contrata��o', 'Rio de Janeiro');
insert into Employees values(2, 'Figueiredo', 'Bruna', 'modelo', 'Rio de Janeiro');
insert into Employees values(3, 'Dutra', 'Paula', 'diretora', 'Rio de Janeiro');
insert into Employees values(4, 'Mendes', 'Thamires', 'contrata��o', 'Salvador');
insert into Employees values(5, 'Oliveira', 'Gabriely', 'diretora', 'Salvador');

insert into EmployeeTerritories values(1,3);
insert into EmployeeTerritories values(2,3);
insert into EmployeeTerritories values(3,3);
insert into EmployeeTerritories values(4,2);
insert into EmployeeTerritories values(5,2);

-- A) RETORNAR O NOME E A CIDADE DE TODOS OS EMPREGADOS:
	SELECT E.FirstName, E.City FROM Employees E;

-- B) RETORNAR A DESCRI��O TERRITORIAL DOS EMPREGADOS ID = 1, 2, 3 :
	SELECT T.TerritoryDescription FROM Employees E, Territories T, EmployeeTerritories ET
	WHERE E.EmployeeID = ET.EmployeeID AND ET.TerritoryID = T.TerritoryID AND E.EmployeeID IN (1,2,3);

-- C) RETORNAR O C�DIGO DOS TERRITORIOS OCUPADOS POR MAIS DE 2 EMPREGADOS:
	SELECT T.TerritoryID FROM Territories T, Employees E, EmployeeTerritories ET
	WHERE E.EmployeeID = ET.EmployeeID AND ET.TerritoryID = T.TerritoryID GROUP BY T.TerritoryID HAVING COUNT(*) > 2;

-- D) RETORNAR O MENOR C�DIGO DE TERRIT�RIO:
	SELECT MIN(T.TerritoryID) FROM Territories T;

-- E) INSERIR UM NOVO REGISTRO NA TABELA TERRIT�RIO:
	INSERT INTO Territories VALUES (5, 'Pernambuco', 2);

-- F) DELETAR UM REGISTRO NA TABELA EMPREGADOTERRIT�RIOS:
	DELETE FROM EmployeeTerritories WHERE EmployeeID = 5;

-- G) RETORNAR O C�DIGO, O NOME E A CIDADE DOS EMPREGADOS LOCALIZADOS NO TERRIT�RIO 
	SELECT EmployeeID, FirstName, City FROM Employees WHERE EmployeeID IN (SELECT EmployeeID FROM EmployeeTerritories WHERE TerritoryID = 2);