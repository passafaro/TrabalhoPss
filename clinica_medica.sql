-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 11/09/2015 às 02h59min
-- Versão do Servidor: 5.5.16
-- Versão do PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `clinica_medica`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `consulta`
--

CREATE TABLE IF NOT EXISTS `consulta` (
  `id_consulta` int(6) NOT NULL AUTO_INCREMENT,
  `id_paciente` int(6) NOT NULL,
  `id_medico` int(6) NOT NULL,
  `data_consulta` datetime NOT NULL,
  `tipo_consulta` enum('consulta','reconsulta') NOT NULL,
  `sintomas` varchar(250) NOT NULL,
  `diagnostico` varchar(250) NOT NULL,
  `receita` varchar(250) NOT NULL,
  PRIMARY KEY (`id_consulta`),
  KEY `id_medico` (`id_medico`),
  KEY `id_paciente` (`id_paciente`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Extraindo dados da tabela `consulta`
--

INSERT INTO `consulta` (`id_consulta`, `id_paciente`, `id_medico`, `data_consulta`, `tipo_consulta`, `sintomas`, `diagnostico`, `receita`) VALUES
(2, 15, 18, '2015-08-31 08:45:00', 'consulta', '', '', ''),
(9, 17, 18, '2015-08-14 10:09:00', 'consulta', '', '', ''),
(10, 17, 5, '2015-03-03 10:45:00', 'consulta', '', '', ''),
(11, 17, 5, '0000-00-00 00:00:00', 'consulta', '', '', ''),
(12, 19, 5, '0000-00-00 00:00:00', 'consulta', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `medico_secretaria`
--

CREATE TABLE IF NOT EXISTS `medico_secretaria` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `id_pessoa` int(6) NOT NULL,
  `login` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `id_pessoa` (`id_pessoa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `medico_secretaria`
--

INSERT INTO `medico_secretaria` (`id`, `id_pessoa`, `login`, `senha`) VALUES
(1, 6, 'stefanny', '81d577e792c91d845744925ea6dfbfb6'),
(3, 5, 'alessandro', '51af78a02435124ebc225e570e533ac9'),
(4, 18, 'vitorio', '20f5abf36fd5bfaf4d3d4bfbe34c373d');

-- --------------------------------------------------------

--
-- Estrutura da tabela `paciente`
--

CREATE TABLE IF NOT EXISTS `paciente` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `id_pessoa` int(6) NOT NULL,
  `fuma` varchar(100) NOT NULL,
  `bebe` varchar(100) NOT NULL,
  `colesterol` varchar(100) NOT NULL,
  `doenca_cardiaca` varchar(100) NOT NULL,
  `cirurgias` varchar(100) NOT NULL,
  `alergias` varchar(100) NOT NULL,
  `convenio` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pessoa` (`id_pessoa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Extraindo dados da tabela `paciente`
--

INSERT INTO `paciente` (`id`, `id_pessoa`, `fuma`, `bebe`, `colesterol`, `doenca_cardiaca`, `cirurgias`, `alergias`, `convenio`) VALUES
(8, 15, '', '', '', '', '', '', 'Santa Rita'),
(10, 17, '', '', '', '', '', '', 'Santa Rita'),
(11, 19, '', '', '', '', '', '', 'Santa Casa');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoas`
--

CREATE TABLE IF NOT EXISTS `pessoas` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `tipo` enum('paciente','medico','secretaria') NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `celular` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `data_nascimento` date NOT NULL,
  `sexo` enum('homem','mulher') NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Extraindo dados da tabela `pessoas`
--

INSERT INTO `pessoas` (`id`, `tipo`, `nome`, `email`, `celular`, `telefone`, `data_nascimento`, `sexo`, `cpf`, `endereco`) VALUES
(5, 'medico', 'alessandro', 'contato@alessandropassafaro.com.br', '44 9993-3625', '44 3267-6303', '1984-09-03', 'homem', '047.219.149-70', 'Rua Pioneiro HÃ©lio dos Reis Fiigueiredo, 643'),
(6, 'secretaria', 'Stefanny Silveira', 'stefanny@live.com', '44 9952-2549', '44 3034-4940', '1990-09-29', 'mulher', '057.025.548-70', 'Rua Pioneiro HÃ©lio dos Reis Fiigueiredo, 643'),
(15, 'paciente', 'Pedro', 'contato@pedro.com.br', '44 9999-3333', '99933625', '1987-05-12', 'homem', '084.672.219-41', 'contato@pedro.com.br'),
(17, 'paciente', 'Maria', 'maria@gmail.com', '44 9999-3333', '99933625', '1987-05-12', 'homem', '123456', 'maria@gmail.com'),
(18, 'medico', 'Vitorio Domingos', 'domingos@gmail.com', '44 9999-8745', '', '1971-08-11', 'homem', '025.356.958-98', 'Rua Mascarenhas, 1331'),
(19, 'paciente', 'Florentina franco', 'flora@gmail.com', '4499996666', '4466663333', '0000-00-00', 'mulher', '123', 'flora@gmail.com');

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_pessoa`);

--
-- Restrições para a tabela `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoas` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
