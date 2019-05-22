-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 17-Maio-2019 às 06:09
-- Versão do servidor: 10.1.38-MariaDB
-- versão do PHP: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `transturco`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `caminhao`
--

CREATE TABLE `caminhao` (
  `idCaminhao` int(10) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `dataCadastro` datetime DEFAULT NULL,
  `dataAlteracao` datetime DEFAULT NULL,
  `gasolina` float(10,4) DEFAULT NULL,
  `custoPorKm` float(10,2) DEFAULT NULL,
  `pesoSuportado` float(10,3) NOT NULL,
  `manuntencao` int(1) NOT NULL DEFAULT '0',
  `idEntrega` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `caminhao`
--

INSERT INTO `caminhao` (`idCaminhao`, `marca`, `modelo`, `dataCadastro`, `dataAlteracao`, `gasolina`, `custoPorKm`, `pesoSuportado`, `manuntencao`, `idEntrega`) VALUES
(5, 'testa', 'teste', '2019-05-13 23:37:59', '2019-05-16 20:29:52', 99.7000, 5.00, 10.000, 0, 14),
(7, 'a', 'a', '2019-05-13 23:58:10', '2019-05-16 21:34:45', 94.0000, 5.00, 10.000, 0, 21),
(10, 'teste', 't', '2019-05-15 22:24:36', '2019-05-16 20:16:25', 99.8000, 5.00, 10.000, 0, 15),
(11, 'Volvo', 'FH16', '2019-05-16 20:19:42', '2019-05-16 22:20:53', 700.0000, 5.00, 25.000, 0, 18),
(12, 'de', 'de', '2019-05-16 23:38:46', '2019-05-16 23:38:57', 700.0000, 5.00, 20.000, 0, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `entrega`
--

CREATE TABLE `entrega` (
  `idEntrega` int(11) NOT NULL,
  `nomeEntrega` varchar(60) NOT NULL,
  `descEntrega` varchar(200) NOT NULL,
  `dataCadastro` datetime DEFAULT NULL,
  `dataAlteracao` datetime DEFAULT NULL,
  `valorEntrega` float(10,3) NOT NULL,
  `distancia` float(10,3) NOT NULL,
  `pesoEntrega` float(10,3) NOT NULL,
  `situacaoEntrega` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `entrega`
--

INSERT INTO `entrega` (`idEntrega`, `nomeEntrega`, `descEntrega`, `dataCadastro`, `dataAlteracao`, `valorEntrega`, `distancia`, `pesoEntrega`, `situacaoEntrega`) VALUES
(1, 't', '1', '2019-05-12 22:17:26', '2019-05-13 00:30:40', 1.000, 10.000, 1.000, 1),
(2, '2', '2', '2019-05-12 22:26:56', '2019-05-12 22:26:56', 2.000, 1.000, 2.000, 0),
(3, '3', '3', '2019-05-12 22:30:17', '2019-05-12 22:30:17', 3.000, 1.000, 3.000, 0),
(4, '4', '4', '2019-05-12 22:31:24', '2019-05-12 22:31:24', 4.000, 1.000, 4.000, 0),
(5, 'XAXA', 'asd', '2019-05-12 22:32:32', '2019-05-16 23:38:24', 5.000, 1500.000, 5.000, 2),
(6, 'paç', 'teset', '2019-05-13 00:00:00', '2019-05-13 01:00:02', 1.000, 1.000, 1.000, 3),
(7, 'teste', 'teset', '2019-05-13 00:00:00', '2019-05-13 00:00:00', 1.000, 1.000, 1.000, 1),
(8, 'arroz', 'teset', '2019-05-13 00:00:00', '2019-05-13 00:00:00', 1.000, 1.000, 1.000, 2),
(9, 'teste', 'teset', '2019-05-13 00:00:00', '2019-05-13 00:00:00', 1.000, 1.000, 1.000, 1),
(10, 'teste', 'teset', '2019-05-13 00:00:00', '2019-05-13 00:00:00', 1.000, 1.000, 1.000, 1),
(11, 'teste', 'teset', '2019-05-13 00:00:00', '2019-05-13 00:00:00', 1.000, 1.000, 1.000, 1),
(12, 'teste', 'teset', '2019-05-13 00:00:00', '2019-05-13 00:00:00', 1.000, 1.000, 1.000, 1),
(13, 'teste', 'teset', '2019-05-13 00:00:00', '2019-05-13 00:00:00', 1.000, 1.000, 1.000, 1),
(14, 'teste', 'teset', '2019-05-13 00:00:00', '2019-05-13 00:00:00', 1.000, 1.000, 1.000, 2),
(15, 'teste', 'teset', '2019-05-13 00:00:00', '2019-05-13 00:00:00', 1.000, 1.000, 1.000, 2),
(16, 'teste', 'teset', '2019-05-13 00:00:00', '2019-05-13 00:00:00', 1.000, 1.000, 1.000, 3),
(18, 'APAPPA', 'te', '2019-05-13 00:31:57', '2019-05-16 21:35:47', 100.000, 1500.000, 22.000, 2),
(19, 'entrega teste 666', '655', '2019-05-13 00:36:51', '2019-05-13 00:59:38', 150.000, 1.000, 12.000, 4),
(20, '666', '666', '2019-05-13 00:38:15', '2019-05-13 00:59:51', 10.000, 2.500, 11.000, 3),
(21, 'pao de forma', 'aa', '2019-05-15 00:00:52', '2019-05-16 21:33:41', 10.000, 1.200, 12.000, 2),
(22, 'Entrega de pao', 'teste', '2019-05-16 20:18:43', '2019-05-16 20:18:59', 10.000, 1.500, 22.000, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `log`
--

CREATE TABLE `log` (
  `idLog` int(11) NOT NULL,
  `descricaoLog` varchar(200) NOT NULL,
  `idEntrega` int(11) DEFAULT NULL,
  `idCaminhao` int(11) DEFAULT NULL,
  `idManuntencao` int(11) DEFAULT NULL,
  `dataLog` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `log`
--

INSERT INTO `log` (`idLog`, `descricaoLog`, `idEntrega`, `idCaminhao`, `idManuntencao`, `dataLog`) VALUES
(1, 'Update no Caminhao de ID = 7', 0, 7, 0, '2019-05-14 23:29:00'),
(2, 'Caminhao de novo adicionado com sucesso!', 0, 0, 0, '2019-05-14 23:55:20'),
(3, 'Update no Caminhao de ID = 9', 0, 9, 0, '2019-05-14 23:59:25'),
(4, 'Nova Entrega Criada com sucesso', 0, 0, 0, '2019-05-15 00:00:52'),
(5, 'Entrega de id = 21 foi atualizada com sucesso', 21, 0, 0, '2019-05-15 00:01:09'),
(6, 'Entrega de id = 20 Concluida com sucesso', 20, 0, 0, '2019-05-15 22:19:36'),
(7, 'Entrega de id = 16 Concluida com sucesso', 16, 0, 0, '2019-05-15 22:21:27'),
(8, 'Caminhao de novo adicionado com sucesso!', 0, 0, 0, '2019-05-15 22:24:36'),
(9, 'Update no Caminhao de ID = 10', 0, 10, 0, '2019-05-16 20:16:16'),
(10, 'Nova Entrega Criada com sucesso', 0, 0, 0, '2019-05-16 20:18:43'),
(11, 'Entrega de id = 22 foi atualizada com sucesso', 22, 0, 0, '2019-05-16 20:18:59'),
(12, 'Caminhao de novo adicionado com sucesso!', 0, 0, 0, '2019-05-16 20:19:42'),
(13, 'Update no Caminhao de ID = 7', 0, 7, 0, '2019-05-16 20:32:32'),
(14, 'Entrega de id = 22 Concluida com sucesso', 22, 0, 0, '2019-05-16 21:33:21'),
(15, 'Entrega de id = 21 foi atualizada com sucesso', 21, 0, 0, '2019-05-16 21:33:41'),
(16, 'Entrega de id = 18 foi atualizada com sucesso', 18, 0, 0, '2019-05-16 21:35:28'),
(17, 'Entrega de id = 18 foi atualizada com sucesso', 18, 0, 0, '2019-05-16 21:35:47'),
(18, 'Entrega de id = 5 foi atualizada com sucesso', 5, 0, 0, '2019-05-16 23:38:24'),
(19, 'Caminhao de novo adicionado com sucesso!', 0, 0, 0, '2019-05-16 23:38:46'),
(20, 'Caminhao de id = 9 Foi excluido com sucesso!', 0, 9, 0, '2019-05-16 23:39:43');

-- --------------------------------------------------------

--
-- Estrutura da tabela `manuntencao`
--

CREATE TABLE `manuntencao` (
  `idManuntencao` int(11) NOT NULL,
  `descricaoManuntencao` varchar(200) NOT NULL,
  `valorManuntecao` float(4,3) DEFAULT NULL,
  `dataCadastro` datetime DEFAULT NULL,
  `idCaminhao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `caminhao`
--
ALTER TABLE `caminhao`
  ADD PRIMARY KEY (`idCaminhao`);

--
-- Indexes for table `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`idEntrega`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`idLog`),
  ADD KEY `fkEntrega` (`idEntrega`),
  ADD KEY `fkCaminhao` (`idCaminhao`),
  ADD KEY `fkManuntencao` (`idManuntencao`);

--
-- Indexes for table `manuntencao`
--
ALTER TABLE `manuntencao`
  ADD PRIMARY KEY (`idManuntencao`),
  ADD KEY `fkCaminhao` (`idCaminhao`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `caminhao`
--
ALTER TABLE `caminhao`
  MODIFY `idCaminhao` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `entrega`
--
ALTER TABLE `entrega`
  MODIFY `idEntrega` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `idLog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `manuntencao`
--
ALTER TABLE `manuntencao`
  MODIFY `idManuntencao` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
