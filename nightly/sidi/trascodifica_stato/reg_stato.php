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

//Registra un nuovo stato

require_once '../php-ini'.$_SESSION['suffisso'].'.php';
require_once '../lib/funzioni.php';
$con=mysqli_connect($db_server,$db_user,$db_password,$db_nome) or die ("Errore durante la connessione: ".mysqli_error($con));
    
 
// require_once '../lib/db /query.php';

//$lQuery = LQuery::getIstanza();

// istruzioni per tornare alla pagina di login 
////session_start();
$tipoutente = $_SESSION["tipoutente"]; //prende la variabile presente nella sessione

if ($tipoutente == "")
{
    header("location: ../login/login.php?suffisso=".$_SESSION['suffisso']); 
    die;
}

$titolo="Inserimento stato";
$script=""; 
stampa_head($titolo,"",$script,"SDMAP");
stampa_testata("<a href='../login/ele_ges.php'>PAGINA PRINCIPALE</a> - <a href='vis_stato.php'>Elenco trascodifica stati</a> - $titolo", "", "$nome_scuola", "$comune_scuola");
 
$codice_sidi = stringa_html('codice_stato_sidi');
$codice_locale = stringa_html('codice_stato_locale');
$rs = mysqli_query($con,inspref("insert into tbl_trascodifica_statoo_sidi(codice_stato_sidi,codice_stato_locale) values ('$codice_sidi','$codice_locale')"));

if ($rs) {
   // print("<FONT SIZE='+2'> <CENTER>Inserimento eseguito</CENTER> </FONT>");
   print "
                 <form method='post' id='formdoc' action='../trascodifica_stato/vis_stato.php'>
                 
                 </form> 
                 <SCRIPT language='JavaScript'>
                 {
                     document.getElementById('formdoc').submit();
                 }
                 </SCRIPT>";
} else {
    print "<FORM ACTION='nuo_stato.php' method='POST'>";
    print("<CENTER><FONT SIZE='+2'> Inserimento non eseguito<BR/>\n");
    print "<INPUT TYPE='SUBMIT' VALUE='<< Indietro'>";
    print "</CENTER></FORM>";
}
mysqli_close($con);
stampa_piede("");

