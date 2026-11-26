-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 26/11/2026 às 16:35
-- Versão do servidor: 10.6.18-MariaDB-0ubuntu0.22.04.1
-- Versão do PHP: 8.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_rpg`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `Arma`
--

CREATE TABLE `Arma` (
  `id` int(11) NOT NULL,
  `dano` int(11) NOT NULL,
  `tipoDano` varchar(30) NOT NULL,
  `bonus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Arma`
--

INSERT INTO `Arma` (`id`, `dano`, `tipoDano`, `bonus`) VALUES
(1, 10, 'Cortante', 1),
(2, 8, 'Perfurante', 2),
(3, 15, 'Contundente', 0),
(4, 25, 'Fogo', 3),
(5, 18, 'Gelo', 2),
(6, 30, 'Elétrico', 4),
(7, 12, 'Veneno', 1),
(8, 40, 'Sagrado', 5),
(9, 35, 'Sombrio', 4),
(10, 5, 'Arcano', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Armadura`
--

CREATE TABLE `Armadura` (
  `id` int(11) NOT NULL,
  `defesa` int(11) NOT NULL,
  `material` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Armadura`
--

INSERT INTO `Armadura` (`id`, `defesa`, `material`) VALUES
(1, 5, 'Tecido'),
(2, 10, 'Couro'),
(3, 15, 'Couro Batido'),
(4, 22, 'Cota de Malha'),
(5, 28, 'Bronze'),
(6, 35, 'Ferro'),
(7, 45, 'Aço'),
(8, 55, 'Escamas de Dragão'),
(9, 65, 'Mithril'),
(10, 75, 'Obsidiana');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Inventario`
--

CREATE TABLE `Inventario` (
  `id` int(11) NOT NULL,
  `id_personagem` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL DEFAULT 1 COMMENT 'Utilizar clausula [ ON DUPLICATE UPDATE quantidade = quantidade + value ] quando realizar Insert para indicar quantidade empilhável'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Item`
--

CREATE TABLE `Item` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `descricao` varchar(60) NOT NULL,
  `peso` float NOT NULL,
  `preco` float NOT NULL,
  `tipo` varchar(1) NOT NULL DEFAULT 'F',
  `id_arma` int(11) DEFAULT NULL,
  `id_armadura` int(11) DEFAULT NULL,
  `id_pocao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Item`
--

INSERT INTO `Item` (`id`, `nome`, `descricao`, `peso`, `preco`, `tipo`, `id_arma`, `id_armadura`, `id_pocao`) VALUES
(1, 'Espada Curta', 'Lâmina simples e ágil para combate próximo.', 3, 50, 'A', 1, NULL, NULL),
(2, 'Adaga de Caça', 'Lâmina leve ideal para ataques rápidos.', 1, 35, 'A', 2, NULL, NULL),
(3, 'Maça de Madeira', 'Arma pesada capaz de esmagar defesas.', 5, 45, 'A', 3, NULL, NULL),
(4, 'Espada Flamejante', 'Lâmina encantada que queima ao tocar.', 4, 350, 'A', 4, NULL, NULL),
(5, 'Lança Gélida', 'Ponta congelante que retarda os inimigos.', 4, 280, 'A', 5, NULL, NULL),
(6, 'Martelo Trovejante', 'Libera descargas elétricas no impacto.', 7, 500, 'A', 6, NULL, NULL),
(7, 'Adaga Envenenada', 'Lâmina banhada em toxina mortal.', 1, 150, 'A', 7, NULL, NULL),
(8, 'Espada Sagrada', 'Abençoada com luz pura contra criaturas.', 4, 900, 'A', 8, NULL, NULL),
(9, 'Foice Sombria', 'Arma amaldiçoada forjada nas trevas.', 5, 750, 'A', 9, NULL, NULL),
(10, 'Cajado Arcano', 'Canaliza energia mágica pura.', 2, 200, 'A', 10, NULL, NULL),
(11, 'Túnica de Pano', 'Veste simples que oferece pouca proteção.', 2, 15, 'D', NULL, 1, NULL),
(12, 'Colete de Couro', 'Proteção leve para exploradores.', 4, 60, 'D', NULL, 2, NULL),
(13, 'Armadura de Couro Batido', 'Couro reforçado com rebites metálicos.', 6, 120, 'D', NULL, 3, NULL),
(14, 'Cota de Malha', 'Anéis de metal entrelaçados.', 10, 250, 'D', NULL, 4, NULL),
(15, 'Peitoral de Bronze', 'Armadura rígida forjada em bronze.', 12, 320, 'D', NULL, 5, NULL),
(16, 'Armadura de Ferro', 'Proteção pesada e resistente.', 15, 480, 'D', NULL, 6, NULL),
(17, 'Armadura de Aço', 'Forjada com aço temperado de alta qualidade.', 16, 700, 'D', NULL, 7, NULL),
(18, 'Armadura de Dragão', 'Feita com escamas quase impenetráveis.', 14, 1500, 'D', NULL, 8, NULL),
(19, 'Cota de Mithril', 'Extremamente leve e mais forte que o aço.', 5, 2200, 'D', NULL, 9, NULL),
(20, 'Armadura de Obsidiana', 'Forjada com pedra vulcânica sombria.', 18, 3000, 'D', NULL, 10, NULL),
(21, 'Poção de Cura Menor', 'Restaura uma pequena quantidade de vida.', 1, 25, 'P', NULL, NULL, 1),
(22, 'Poção de Cura Maior', 'Restaura uma grande quantidade de vida.', 1, 75, 'P', NULL, NULL, 2),
(23, 'Poção de Mana Menor', 'Recupera um pouco de energia mágica.', 1, 30, 'P', NULL, NULL, 3),
(24, 'Poção de Mana Maior', 'Recupera bastante energia mágica.', 1, 85, 'P', NULL, NULL, 4),
(25, 'Tônico de Stamina', 'Restaura o fôlego rapidamente.', 1, 40, 'P', NULL, NULL, 5),
(26, 'Elixir de Força', 'Aumenta o poder físico temporariamente.', 1, 110, 'P', NULL, NULL, 6),
(27, 'Elixir de Agilidade', 'Aumenta os reflexos e velocidade.', 1, 110, 'P', NULL, NULL, 7),
(28, 'Poção de Pele de Pedra', 'Aumenta a resistência física.', 1, 120, 'P', NULL, NULL, 8),
(29, 'Poção Ignífuga', 'Concede resistência contra ataques de fogo.', 1, 150, 'P', NULL, NULL, 9),
(30, 'Antídoto Puro', 'Cura imediatamente qualquer envenenamento.', 1, 50, 'P', NULL, NULL, 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Personagem`
--

CREATE TABLE `Personagem` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `forca` int(11) NOT NULL,
  `agilidade` int(11) NOT NULL,
  `mental` int(11) NOT NULL,
  `genero` varchar(1) NOT NULL,
  `id_raca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Personagem`
--

INSERT INTO `Personagem` (`id`, `nome`, `forca`, `agilidade`, `mental`, `genero`, `id_raca`) VALUES
(1, 'Arthur Pendragon', 14, 12, 10, 'M', 1),
(2, 'Bruna Forjaferro', 16, 9, 11, 'F', 2),
(3, 'Grommash', 18, 11, 7, 'M', 3),
(4, 'Kaelen', 15, 13, 9, 'U', 4),
(5, 'Thorgar Montanha', 19, 9, 8, 'M', 5),
(6, 'Lyra Folhaverde', 9, 14, 16, 'F', 6),
(7, 'Aelar Estrelaluz', 8, 13, 18, 'M', 7),
(8, 'Zook Engrenagem', 8, 13, 16, 'U', 8),
(9, 'Lilith Cinzas', 10, 12, 17, 'F', 9),
(10, 'Balerion', 14, 10, 15, 'M', 10),
(11, 'Pippin Pé-Leve', 9, 17, 11, 'M', 11),
(12, 'Sylvanas', 11, 17, 13, 'F', 12),
(13, 'Snikt', 10, 16, 9, 'U', 13),
(14, 'Nala Garra-Veloz', 11, 18, 11, 'F', 14),
(15, 'Vaxildan', 12, 15, 13, 'M', 15);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Pocao`
--

CREATE TABLE `Pocao` (
  `id` int(11) NOT NULL,
  `efeito` varchar(30) NOT NULL,
  `bonus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Pocao`
--

INSERT INTO `Pocao` (`id`, `efeito`, `bonus`) VALUES
(1, 'Cura', 20),
(2, 'Cura Maior', 50),
(3, 'Mana', 15),
(4, 'Mana Maior', 40),
(5, 'Stamina', 30),
(6, 'Força', 5),
(7, 'Agilidade', 5),
(8, 'Defesa', 10),
(9, 'Resistência ao Fogo', 25),
(10, 'Antídoto', 100);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Raca`
--

CREATE TABLE `Raca` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `carater` varchar(1) NOT NULL,
  `bonus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Raca`
--

INSERT INTO `Raca` (`id`, `nome`, `carater`, `bonus`) VALUES
(1, 'Humano', 'F', 2),
(2, 'Anão', 'F', 4),
(3, 'Orc', 'F', 5),
(4, 'Meio-Orc', 'F', 3),
(5, 'Golias', 'F', 5),
(6, 'Elfo', 'M', 4),
(7, 'Alto Elfo', 'M', 5),
(8, 'Gnomo', 'M', 3),
(9, 'Tiefling', 'M', 4),
(10, 'Draconato', 'M', 3),
(11, 'Halfling', 'A', 4),
(12, 'Elfo da Floresta', 'A', 4),
(13, 'Goblin', 'A', 3),
(14, 'Tabaxi', 'A', 5),
(15, 'Meio-Elfo', 'A', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Usuario`
--

CREATE TABLE `Usuario` (
  `id` int(11) NOT NULL,
  `login` varchar(8) NOT NULL,
  `senha` varchar(8) NOT NULL,
  `id_personagem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Usuario`
--

INSERT INTO `Usuario` (`id`, `login`, `senha`, `id_personagem`) VALUES
(1, 'arthur01', 'pass1234', 1),
(2, 'bruna_f', 'forja999', 2),
(3, 'grom_orc', 'horda123', 3),
(4, 'kaelen_u', 'kln2026!', 4),
(5, 'thorgar', 'pedra777', 5),
(6, 'lyra_elf', 'floresta', 6),
(7, 'aelar_m', 'estrela1', 7),
(8, 'zook_gnm', 'engrena8', 8),
(9, 'lilith_t', 'cinzas66', 9),
(10, 'balerion', 'fogo2026', 10),
(11, 'pippin_h', 'pe_leve9', 11),
(12, 'sylvanas', 'arqueira', 12),
(13, 'snikt_gb', 'ouro1234', 13),
(14, 'nala_tbx', 'garra888', 14),
(15, 'vaxildan', 'sombra55', 15);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `Arma`
--
ALTER TABLE `Arma`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `Armadura`
--
ALTER TABLE `Armadura`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `Inventario`
--
ALTER TABLE `Inventario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_personagem` (`id_personagem`),
  ADD KEY `id_item` (`id_item`);

--
-- Índices de tabela `Item`
--
ALTER TABLE `Item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_arma` (`id_arma`),
  ADD KEY `id_armadura` (`id_armadura`),
  ADD KEY `id_pocao` (`id_pocao`);

--
-- Índices de tabela `Personagem`
--
ALTER TABLE `Personagem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_raca` (`id_raca`);

--
-- Índices de tabela `Pocao`
--
ALTER TABLE `Pocao`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `Raca`
--
ALTER TABLE `Raca`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_personagem` (`id_personagem`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Arma`
--
ALTER TABLE `Arma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `Armadura`
--
ALTER TABLE `Armadura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `Inventario`
--
ALTER TABLE `Inventario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Item`
--
ALTER TABLE `Item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `Personagem`
--
ALTER TABLE `Personagem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `Pocao`
--
ALTER TABLE `Pocao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `Raca`
--
ALTER TABLE `Raca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `Usuario`
--
ALTER TABLE `Usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `Inventario`
--
ALTER TABLE `Inventario`
  ADD CONSTRAINT `Inventario_ibfk_1` FOREIGN KEY (`id_personagem`) REFERENCES `Personagem` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Inventario_ibfk_2` FOREIGN KEY (`id_item`) REFERENCES `Item` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `Item`
--
ALTER TABLE `Item`
  ADD CONSTRAINT `Item_ibfk_1` FOREIGN KEY (`id_arma`) REFERENCES `Arma` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Item_ibfk_2` FOREIGN KEY (`id_armadura`) REFERENCES `Armadura` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Item_ibfk_3` FOREIGN KEY (`id_pocao`) REFERENCES `Pocao` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `Personagem`
--
ALTER TABLE `Personagem`
  ADD CONSTRAINT `Personagem_ibfk_1` FOREIGN KEY (`id_raca`) REFERENCES `Raca` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `Usuario`
--
ALTER TABLE `Usuario`
  ADD CONSTRAINT `Usuario_ibfk_1` FOREIGN KEY (`id_personagem`) REFERENCES `Personagem` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
