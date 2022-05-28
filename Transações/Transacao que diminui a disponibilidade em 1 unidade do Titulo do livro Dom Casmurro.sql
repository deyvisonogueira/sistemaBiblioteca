#Transação que diminui a disponibilidade em 1 unidade do Titulo do livro "Dom Casmurro";
BEGIN;
SELECT * FROM livro;
UPDATE livro SET disponibilidade = disponibilidade - 1 WHERE tituloLivro = "Dom Casmurro";
SELECT * FROM livro;
#ROLLBACK;
COMMIT;


