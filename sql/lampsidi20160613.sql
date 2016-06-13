-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Creato il: Giu 13, 2016 alle 21:35
-- Versione del server: 5.7.12-0ubuntu1.1
-- Versione PHP: 7.0.4-7ubuntu2.1

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
-- Struttura della tabella `tbl_alunno_sidi`
--

CREATE TABLE `tbl_alunno_sidi` (
  `data_aggiornamento_sogei` char(10) DEFAULT NULL COMMENT 'yyyy-mm-dd',
  `data_nascita` char(10) NOT NULL COMMENT 'yyyy-mm-dd',
  `codice_alunno_ministeriale` int(22) DEFAULT NULL COMMENT 'vuoto per prima iscrizione in anagrafe',
  `flag_codice_fiscale_fittizio` int(22) NOT NULL,
  `flag_s2f` int(22) DEFAULT NULL,
  `anni_scuola_materna` int(22) DEFAULT NULL,
  `codice_cap` char(5) DEFAULT NULL,
  `codice_fiscale_alunno` char(16) NOT NULL,
  `codice_stato_prima` char(9) NOT NULL COMMENT 'tbl_trascodifica_stato_sidi',
  `codice_stato_seconda` char(9) DEFAULT NULL COMMENT 'tbl_trascodifica_stato_sidi',
  `codice_comune` char(21) NOT NULL COMMENT 'obbligatorio se stato nascita non è valorizzato',
  `cognome_alunno` char(40) NOT NULL,
  `codice_comune_residenza` char(21) NOT NULL COMMENT 'tbl_trascodifica_comune_sidi',
  `distretto` char(4) DEFAULT NULL,
  `flag_minore_straniero` char(1) DEFAULT NULL,
  `frazione` char(9) DEFAULT NULL,
  `codice_gruppo_nomade` char(4) DEFAULT NULL COMMENT 'A Altri gruppi R Rom S Sinti',
  `identificativo_alunno` char(21) NOT NULL COMMENT 'identificativo locale',
  `indirizzo_residenza` char(50) DEFAULT NULL,
  `matricola` char(16) DEFAULT NULL,
  `nome` char(40) NOT NULL,
  `identificativo_scuola` char(21) DEFAULT NULL COMMENT 'tbl_scuola_sidi',
  `sesso` char(1) NOT NULL,
  `indicatore_frequenza_scuola_materna` char(1) DEFAULT NULL,
  `stato_civile` char(1) DEFAULT NULL COMMENT '0, 1, 2, 3, 4',
  `stato_nascita` char(9) DEFAULT NULL COMMENT 'se non valorizzato comune di nascita',
  `codice_stato_sogei` char(2) DEFAULT NULL,
  `Luogo_nascita_estero` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `tbl_anagrafica_classe_sidi`
--

CREATE TABLE `tbl_anagrafica_classe_sidi` (
  `id_anagrafica_classe` int(11) NOT NULL,
  `anno_corso` int(22) NOT NULL,
  `anno_cronologico` int(22) NOT NULL,
  `anno_scolastico` char(4) NOT NULL COMMENT 'tbl_anno_scolastico_sidi',
  `identificativo_scuola` char(21) NOT NULL COMMENT 'tbl_scuola_sidi',
  `identificativo_sede` char(9) NOT NULL COMMENT 'tbl_sede_sidi',
  `sezione` char(8) NOT NULL,
  `identificativo_funzionamento` char(9) DEFAULT NULL COMMENT 'obbligatorio per primaria e secondaria I grado',
  `descrizione_pluriclasse` char(25) DEFAULT NULL COMMENT 'obbligatorio per pluriclasse'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `tbl_anno_scolastico_sidi`
--

CREATE TABLE `tbl_anno_scolastico_sidi` (
  `fine` char(10) NOT NULL,
  `inizio` char(10) NOT NULL,
  `anno_scolastico` char(4) NOT NULL,
  `ordine_scuola` char(7) NOT NULL COMMENT 'AA, EE, MM, SS'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `tbl_corsi_indirizzi_sidi`
--

CREATE TABLE `tbl_corsi_indirizzi_sidi` (
  `durata_anni` int(22) DEFAULT NULL,
  `anno_inizio_validita` int(22) DEFAULT NULL,
  `codice_ministeriale_corso_esami_stato` char(16) DEFAULT NULL,
  `identificativo_corso_successivo` char(9) DEFAULT NULL,
  `descrizione` char(50) NOT NULL,
  `descrizione_titolo_studio` char(50) DEFAULT NULL,
  `flag_corso_terminale` char(1) DEFAULT NULL,
  `identificativo_corso` char(9) NOT NULL,
  `identificativo_corso_ministeriale` char(4) DEFAULT NULL COMMENT 'obbligatorio solo per MM e SS',
  `identificativo_classificazione_corso_ministeriale` char(2) DEFAULT NULL COMMENT 'obbligatorio solo per MM e SS'
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
-- Struttura della tabella `tbl_flusso_esiti_finali_sidi`
--

CREATE TABLE `tbl_flusso_esiti_finali_sidi` (
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
-- Struttura della tabella `tbl_flusso_scrutini_sidi`
--

CREATE TABLE `tbl_flusso_scrutini_sidi` (
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
-- Struttura della tabella `tbl_scuola_sidi`
--

CREATE TABLE `tbl_scuola_sidi` (
  `codice_cap` char(5) DEFAULT NULL,
  `codice_fiscale_scuola` char(16) DEFAULT NULL,
  `codice_meccanografico_forte` char(16) DEFAULT NULL,
  `codice_meccanografico_debole` char(16) NOT NULL,
  `codice_comune` char(21) NOT NULL,
  `descrizione_indirizzo_posta_elettronica` char(50) DEFAULT NULL,
  `secondo_indirizzo_posta_elettronica` char(50) DEFAULT NULL,
  `identificativo_scuola` char(21) NOT NULL,
  `descrizione_indirizzo_scuola` char(50) DEFAULT NULL,
  `descrizione_nome_scuola` char(80) DEFAULT NULL,
  `codice_ordine_scuola_utente` char(2) DEFAULT NULL,
  `flag_persona_giuridica` char(1) DEFAULT NULL,
  `descrizione_sigla_scuola` char(16) DEFAULT NULL,
  `descrizione_indirizzosito_internet` char(50) DEFAULT NULL,
  `numero_telefonico` char(20) DEFAULT NULL,
  `secondo_numero_telefonico` char(20) DEFAULT NULL,
  `descrizione_tipo_scuola` char(80) DEFAULT NULL,
  `decreto_ministeriale` char(4) DEFAULT NULL,
  `tipo` char(4) DEFAULT NULL,
  `flag_istituto_dichiarante` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `tbl_sede_sidi`
--

CREATE TABLE `tbl_sede_sidi` (
  `cap` char(5) DEFAULT NULL,
  `codice_comune` char(21) NOT NULL,
  `denominazione_sede` char(50) NOT NULL,
  `fax` char(20) DEFAULT NULL,
  `identificativo_sede` char(9) NOT NULL,
  `indirizzo_sede` char(50) DEFAULT NULL,
  `identificativo_scuola` char(21) NOT NULL,
  `telefono` char(20) DEFAULT NULL
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

-- --------------------------------------------------------

--
-- Struttura della tabella `tbl_trascodifica_comune_sidi`
--

CREATE TABLE `tbl_trascodifica_comune_sidi` (
  `codice_comune_sidi` varchar(5) NOT NULL,
  `codice_comune_pacchetto` char(21) NOT NULL,
  `codice_provincia_sidi` char(2) NOT NULL,
  `codice_provincia_pacchetto` char(2) DEFAULT NULL,
  `codice_regione_sidi` char(4) NOT NULL,
  `codice_regione_pacchetto` char(4) DEFAULT NULL,
  `descrizione_comune_sidi` char(50) NOT NULL,
  `descrizione_comune_pacchetto` char(50) NOT NULL,
  `descrizione_provincia_sidi` char(50) NOT NULL,
  `descrizione_provincia_pacchetto` char(50) DEFAULT NULL,
  `descrizione_regione_sidi` char(50) NOT NULL,
  `descrizione_regione_pacchetto` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `tbl_trascodifica_stato_sidi`
--

CREATE TABLE `tbl_trascodifica_stato_sidi` (
  `codice_stato_sidi` char(4) NOT NULL,
  `codice_stato_locale` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `tbl_alunno_sidi`
--
ALTER TABLE `tbl_alunno_sidi`
  ADD PRIMARY KEY (`codice_fiscale_alunno`);

--
-- Indici per le tabelle `tbl_anagrafica_classe_sidi`
--
ALTER TABLE `tbl_anagrafica_classe_sidi`
  ADD PRIMARY KEY (`id_anagrafica_classe`);

--
-- Indici per le tabelle `tbl_anno_scolastico_sidi`
--
ALTER TABLE `tbl_anno_scolastico_sidi`
  ADD PRIMARY KEY (`anno_scolastico`);

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
-- Indici per le tabelle `tbl_scuola_sidi`
--
ALTER TABLE `tbl_scuola_sidi`
  ADD PRIMARY KEY (`codice_meccanografico_debole`);

--
-- Indici per le tabelle `tbl_sede_sidi`
--
ALTER TABLE `tbl_sede_sidi`
  ADD PRIMARY KEY (`identificativo_sede`);

--
-- Indici per le tabelle `tbl_tipi_esiti_sidi`
--
ALTER TABLE `tbl_tipi_esiti_sidi`
  ADD PRIMARY KEY (`id_tipo_esito`);

--
-- Indici per le tabelle `tbl_trascodifica_comune_sidi`
--
ALTER TABLE `tbl_trascodifica_comune_sidi`
  ADD PRIMARY KEY (`codice_comune_sidi`);

--
-- Indici per le tabelle `tbl_trascodifica_stato_sidi`
--
ALTER TABLE `tbl_trascodifica_stato_sidi`
  ADD PRIMARY KEY (`codice_stato_sidi`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `tbl_anagrafica_classe_sidi`
--
ALTER TABLE `tbl_anagrafica_classe_sidi`
  MODIFY `id_anagrafica_classe` int(11) NOT NULL AUTO_INCREMENT;
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
