-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.35-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para sistemabiblioteca
CREATE DATABASE IF NOT EXISTS `sistemabiblioteca` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sistemabiblioteca`;

-- Copiando estrutura para tabela sistemabiblioteca.atendente
CREATE TABLE IF NOT EXISTS `atendente` (
  `idATENDENTE` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idATENDENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela sistemabiblioteca.atendente: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `atendente` DISABLE KEYS */;
INSERT INTO `atendente` (`idATENDENTE`, `nome`, `cpf`, `endereco`) VALUES
	(1, 'Maria Prado', '111.111.111-11', 'RUA A'),
	(2, 'Cleiton Almeira', '222.222.222-22', 'RUA B'),
	(3, 'Marcia Correa', '333.333.333-33', 'RUA C');
/*!40000 ALTER TABLE `atendente` ENABLE KEYS */;

-- Copiando estrutura para tabela sistemabiblioteca.emprestimo
CREATE TABLE IF NOT EXISTS `emprestimo` (
  `LEITOR_idLEITOR` int(11) NOT NULL,
  `LIVRO_idLIVRO` int(11) NOT NULL,
  `ATENDENTE_idATENDENTE` int(11) NOT NULL,
  `dataEmprestimo` date NOT NULL,
  `dataPrevistaDev` date NOT NULL,
  `dataRealDev` date NOT NULL,
  PRIMARY KEY (`LEITOR_idLEITOR`,`LIVRO_idLIVRO`,`ATENDENTE_idATENDENTE`),
  KEY `fk_LEITOR_has_LIVRO_LIVRO1_idx` (`LIVRO_idLIVRO`),
  KEY `fk_LEITOR_has_LIVRO_LEITOR_idx` (`LEITOR_idLEITOR`),
  KEY `fk_EMPRESTIMO_ATENDENTE1_idx` (`ATENDENTE_idATENDENTE`),
  CONSTRAINT `fk_EMPRESTIMO_ATENDENTE1` FOREIGN KEY (`ATENDENTE_idATENDENTE`) REFERENCES `atendente` (`idATENDENTE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_LEITOR_has_LIVRO_LEITOR` FOREIGN KEY (`LEITOR_idLEITOR`) REFERENCES `leitor` (`idLEITOR`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_LEITOR_has_LIVRO_LIVRO1` FOREIGN KEY (`LIVRO_idLIVRO`) REFERENCES `livro` (`idLIVRO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela sistemabiblioteca.emprestimo: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `emprestimo` DISABLE KEYS */;
INSERT INTO `emprestimo` (`LEITOR_idLEITOR`, `LIVRO_idLIVRO`, `ATENDENTE_idATENDENTE`, `dataEmprestimo`, `dataPrevistaDev`, `dataRealDev`) VALUES
	(1, 1, 2, '2022-05-06', '2022-07-06', '2022-07-10'),
	(2, 5, 3, '2022-05-06', '2022-06-06', '2022-06-10'),
	(4, 7, 2, '2022-05-06', '2022-08-06', '2022-08-10');
/*!40000 ALTER TABLE `emprestimo` ENABLE KEYS */;

-- Copiando estrutura para tabela sistemabiblioteca.genero
CREATE TABLE IF NOT EXISTS `genero` (
  `idGENERO` int(11) NOT NULL AUTO_INCREMENT,
  `nomeGenero` varchar(45) NOT NULL,
  `faixaEtaria` int(11) NOT NULL,
  PRIMARY KEY (`idGENERO`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela sistemabiblioteca.genero: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` (`idGENERO`, `nomeGenero`, `faixaEtaria`) VALUES
	(1, 'Romance', 12),
	(2, 'Terror', 16),
	(3, 'Drama', 12),
	(4, 'Clássico ', 8),
	(5, 'Suspense', 16),
	(6, 'Ficção', 13);
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;

-- Copiando estrutura para tabela sistemabiblioteca.leitor
CREATE TABLE IF NOT EXISTS `leitor` (
  `idLEITOR` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `endereco` varchar(45) NOT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idLEITOR`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela sistemabiblioteca.leitor: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `leitor` DISABLE KEYS */;
INSERT INTO `leitor` (`idLEITOR`, `nome`, `cpf`, `endereco`, `telefone`) VALUES
	(1, 'Deyvison Nogueira', '111.111.222-22', 'RUA ALMEIDA', NULL),
	(2, 'Maria Fernanda Gonçalves', '222.222.111-11', 'RUA BARROCA', '(11) 91111-1111'),
	(3, 'Carlos Albertos Maia', '333.333.222-11', 'RUA CARVALHO', '(31) 92222-2222'),
	(4, 'Daniel Santos', '444.444.444-44', 'RUA DAMASCO', NULL);
/*!40000 ALTER TABLE `leitor` ENABLE KEYS */;

-- Copiando estrutura para tabela sistemabiblioteca.livro
CREATE TABLE IF NOT EXISTS `livro` (
  `idLIVRO` int(11) NOT NULL AUTO_INCREMENT,
  `tituloLivro` varchar(45) NOT NULL,
  `autor` varchar(45) NOT NULL,
  `editora` varchar(45) NOT NULL,
  `disponibilidade` tinyint(1) NOT NULL,
  `GENERO_idGENERO` int(11) NOT NULL,
  PRIMARY KEY (`idLIVRO`,`GENERO_idGENERO`),
  KEY `fk_LIVRO_GENERO1_idx` (`GENERO_idGENERO`),
  CONSTRAINT `fk_LIVRO_GENERO1` FOREIGN KEY (`GENERO_idGENERO`) REFERENCES `genero` (`idGENERO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela sistemabiblioteca.livro: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` (`idLIVRO`, `tituloLivro`, `autor`, `editora`, `disponibilidade`, `GENERO_idGENERO`) VALUES
	(1, 'Harry Potter e a Pedra Filosofal', 'J.K. rowling', 'Rocco', 4, 6),
	(2, 'Como Eu Era Antes de Você ', 'Jojo Moyes', 'Intrísceca', 2, 1),
	(5, 'Depois De Você', 'Jojo Moyes', 'Intrísceca', 1, 1),
	(6, 'Vampiros do Deserto', 'Frank Owen', 'Horror', 3, 2),
	(7, 'Dom Casmurro ', 'Machado de Assis', 'Moderna', 8, 4);
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
