-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Creato il: Mag 16, 2016 alle 23:27
-- Versione del server: 5.7.12-0ubuntu1
-- Versione PHP: 7.0.4-7ubuntu2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lampsidi`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `tbl_anno_scolastico`
--

CREATE TABLE `tbl_anno_scolastico` (
  `fine` char(10) NOT NULL,
  `inizio` char(10) NOT NULL,
  `anno_scolastico` char(4) NOT NULL,
  `ordine_scuola` char(7) NOT NULL COMMENT 'AA, EE, MM, SS'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `tbl_decodifica_anno_scolastico_sidi`
--

CREATE TABLE `tbl_decodifica_anno_scolastico_sidi` (
  `id_decodifica_anno_scolastico` int(11) NOT NULL,
  `descrizione_decodifica` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `tbl_decodifica_voto_sidi`
--

CREATE TABLE `tbl_decodifica_voto_sidi` (
  `id_decodifica_voto` int(11) NOT NULL,
  `descrizione_numerica` int(11) NOT NULL,
  `descrizioe_letterale` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `tbl_flussi_sidi`
--

CREATE TABLE `tbl_flussi_sidi` (
  `id_flussi_sidi` int(11) NOT NULL,
  `descrizione_flussso` varchar(255) NOT NULL,
  `codice_versione_flusso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `tbl_flusso_esiti_finali`
--

CREATE TABLE `tbl_flusso_esiti_finali` (
  `codice_ministeriale` char(10) NOT NULL COMMENT 'Valore unico a livello di flusso',
  `anno_scolastico` int(4) NOT NULL COMMENT 'Valore unico a livello di flusso',
  `codice_alunno_sidi` int(12) NOT NULL,
  `anno_di_corso` int(1) NOT NULL,
  `validita_anno_scolastico` char(1) NOT NULL DEFAULT '0' COMMENT '0,1,2',
  `codice_esito_finale` int(4) NOT NULL,
  `codice_esito_integrazione` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `tbl_flusso_scrutini`
--

CREATE TABLE `tbl_flusso_scrutini` (
  `codice_ministeriale_scuola` char(10) NOT NULL COMMENT 'Valore unico a livello di flusso',
  `anno_scolastico` int(6) NOT NULL COMMENT 'Valore unico a livello di flusso',
  `codice_FT_sidi` int(3) NOT NULL COMMENT 'Valore unico a livello flusso - id_frazioni_temporali_sidi',
  `codice_alunno_sidi` int(12) NOT NULL,
  `anno_di_corso` int(1) NOT NULL,
  `codice_indirizzo_ministeriale` varchar(4) NOT NULL COMMENT 'Valore unico a livello di alunno',
  `validita_anno_scolastico` varchar(1) NOT NULL DEFAULT '0' COMMENT '0,1,2 unico a livello di alunno',
  `codice_esito_finale_sidi` int(4) NOT NULL COMMENT 'Valore unico a livello di alunno',
  `codice_materia_ministeriale` char(4) DEFAULT NULL COMMENT 'Null solo se non ammesso',
  `codice_materia_locale` char(4) DEFAULT NULL COMMENT 'Null solo se non ammesso',
  `descrizione_materia_locale` varchar(120) DEFAULT NULL COMMENT 'Null solo se non ammesso',
  `descrizione_voto` varchar(255) DEFAULT NULL COMMENT 'Null solo se non ammesso',
  `numero_assenze` int(5) NOT NULL DEFAULT '0',
  `codice_esito_integrazione` int(4) DEFAULT NULL COMMENT 'Valore unico a livello di alunno'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `tbl_frazioni_temporali_sidi`
--

CREATE TABLE `tbl_frazioni_temporali_sidi` (
  `id_frazioni_temporali` int(11) NOT NULL,
  `descrizione_frazioni_temporali` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `tbl_tipi_esiti_sidi`
--

CREATE TABLE `tbl_tipi_esiti_sidi` (
  `id_tipo_esito` int(11) NOT NULL,
  `descrizione_tipo_esito` varchar(100) NOT NULL,
  `passaggio` tinyint(1) NOT NULL,
  `id_tipo_esito_lamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `tbl_decodifica_anno_scolastico_sidi`
--
ALTER TABLE `tbl_decodifica_anno_scolastico_sidi`
  ADD PRIMARY KEY (`id_decodifica_anno_scolastico`);

--
-- Indici per le tabelle `tbl_decodifica_voto_sidi`
--
ALTER TABLE `tbl_decodifica_voto_sidi`
  ADD PRIMARY KEY (`id_decodifica_voto`);

--
-- Indici per le tabelle `tbl_flussi_sidi`
--
ALTER TABLE `tbl_flussi_sidi`
  ADD PRIMARY KEY (`id_flussi_sidi`);

--
-- Indici per le tabelle `tbl_frazioni_temporali_sidi`
--
ALTER TABLE `tbl_frazioni_temporali_sidi`
  ADD PRIMARY KEY (`id_frazioni_temporali`);

--
-- Indici per le tabelle `tbl_tipi_esiti_sidi`
--
ALTER TABLE `tbl_tipi_esiti_sidi`
  ADD PRIMARY KEY (`id_tipo_esito`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `tbl_decodifica_anno_scolastico_sidi`
--
ALTER TABLE `tbl_decodifica_anno_scolastico_sidi`
  MODIFY `id_decodifica_anno_scolastico` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `tbl_flussi_sidi`
--
ALTER TABLE `tbl_flussi_sidi`
  MODIFY `id_flussi_sidi` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `tbl_frazioni_temporali_sidi`
--
ALTER TABLE `tbl_frazioni_temporali_sidi`
  MODIFY `id_frazioni_temporali` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
