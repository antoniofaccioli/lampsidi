<?php session_start();

/*
Copyright (C) 2016 Antonio Faccioli - antonio.faccioli@soluzioniopen.com
Questo programma è un software libero; potete redistribuirlo e/o modificarlo secondo i termini della 
GNU Affero General Public License come pubblicata 
dalla Free Software Foundation; sia la versione 3, 
sia (a vostra scelta) ogni versione successiva.

Questo programma è distribuito nella speranza che sia utile 
ma SENZA ALCUNA GARANZIA; senza anche l'implicita garanzia di 
POTER ESSERE VENDUTO o di IDONEITA' A UN PROPOSITO PARTICOLARE. 
Vedere la GNU Affero General Public License per ulteriori dettagli.

Dovreste aver ricevuto una copia della GNU Affero General Public License
in questo programma; se non l'avete ricevuta, vedete http://www.gnu.org/licenses/
*/

// Inserisce un nuovo stato per il sistema SIDI

require_once '../php-ini'.$_SESSION['suffisso'].'.php';
require_once '../lib/funzioni.php';
	
// istruzioni per tornare alla pagina di login 
////session_start();
$tipoutente = $_SESSION["tipoutente"]; //prende la variabile presente nella sessione

if ($tipoutente == "")
{
    header("location: ../login/login.php?suffisso=".$_SESSION['suffisso']);
    die;
}

$titolo = "Nuovo stato";
$script = "";
stampa_head($titolo,"",$script,"SDMAP");
stampa_testata("<a href='../login/ele_ges.php'>PAGINA PRINCIPALE</a> - <a href='vis_stato.php'>Elenco trascodifica stati</a> - $titolo", "", "$nome_scuola", "$comune_scuola");
 
//Esecuzione query
print "<form name='form1' action='reg_stato.php' method='POST'>";
print "<CENTER><table border ='0'>";
print "<tr>";
print "<td><input type='text' name ='codice_stato_sidi' size=1></td>";
print "<td><input type='text' name ='codice_stato_locale' size=1></td>";
print "<td>";
print "</tr>";
print "<tr><td COLSPAN='2'><CENTER><br/>";
print "<input type='submit' name='registra' value='Registra'>";
print "</CENTER></td></TR>";

print "</table></CENTER>";
print "</form>";

stampa_piede("");			

