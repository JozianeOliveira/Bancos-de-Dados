-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 31/08/2019 às 02:45
-- Versão do servidor: 10.4.6-MariaDB
-- Versão do PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cadastro`
--
CREATE DATABASE IF NOT EXISTS `cadastro` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cadastro`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cursos`
--

CREATE TABLE `cursos` (
  `idcurso` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `descricao` text DEFAULT NULL,
  `carga` int(10) UNSIGNED DEFAULT NULL,
  `totaulas` int(11) DEFAULT NULL,
  `ano` year(4) DEFAULT 2016
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `cursos`
--

INSERT INTO `cursos` (`idcurso`, `nome`, `descricao`, `carga`, `totaulas`, `ano`) VALUES
(1, 'HTML4', 'Curso de HTML5', 40, 37, 2014),
(2, 'Algoritimos', 'Lógica de programação', 20, 15, 2014),
(3, 'Photoshop', 'Dicas de Photoshop CC', 10, 8, 2014),
(4, 'PHP', 'Curso de PHP para iniciantes', 40, 20, 2010),
(5, 'Jarva', 'Introdução a linguagem Java', 10, 29, 2000),
(6, 'MySQL', 'Banco de dados MySQL', 30, 15, 2016),
(7, 'Word', 'Curso completo de Word', 40, 30, 2016);

-- --------------------------------------------------------

--
-- Estrutura para tabela `gafanhotos`
--

CREATE TABLE `gafanhotos` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `profissao` varchar(20) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `sexo` enum('M','F') DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `altura` decimal(3,2) DEFAULT NULL,
  `nacionalidade` varchar(20) DEFAULT 'Brasil'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `gafanhotos`
--

INSERT INTO `gafanhotos` (`id`, `nome`, `profissao`, `nascimento`, `sexo`, `peso`, `altura`, `nacionalidade`) VALUES
(1, 'Godofredo', NULL, '1984-01-02', 'M', '78.50', '1.83', 'Brasil'),
(2, 'Maria', NULL, '1999-12-10', 'F', '55.20', '1.65', 'Portugal'),
(3, 'Creuza', NULL, '1920-12-30', 'F', '50.20', '1.63', 'Brasil'),
(4, 'Adalgiza', NULL, '1930-11-01', 'F', '45.50', '1.69', 'Irlanda'),
(5, 'Cláudio', NULL, '1939-01-18', 'M', '80.20', '1.59', 'Brasil'),
(6, 'Pedro', NULL, '1978-08-06', 'M', '89.20', '1.85', 'Brasil'),
(7, 'Janaína', NULL, '1979-10-29', 'F', '55.20', '1.70', 'EUA');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`idcurso`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices de tabela `gafanhotos`
--
ALTER TABLE `gafanhotos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `gafanhotos`
--
ALTER TABLE `gafanhotos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
