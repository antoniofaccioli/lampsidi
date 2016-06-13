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

// Programma per la visualizzazione dell'elenco delle tbl_classi.

require_once '../php-ini'.$_SESSION['suffisso'].'.php';
require_once '../lib/funzioni.php';
$con=mysqli_connect($db_server,$db_user,$db_password,$db_nome) or die ("Errore durante la connessione: ".mysqli_error($con));
    
 
// require_once '../lib/ db /query.php';

// $lQuery = LQuery::getIstanza();

// istruzioni per tornare alla pagina di login 
////session_start();
$tipoutente = $_SESSION["tipoutente"]; //prende la variabile presente nella sessione

if ($tipoutente == "")
{
    header("location: ../login/login.php?suffisso=".$_SESSION['suffisso']); 
    die;
}	
	
$titolo = "Conferma cancellazione anno scolastico";
$script = ""; 
stampa_head($titolo,"",$script,"SDMAP");
stampa_testata("<a href='../login/ele_ges.php'>PAGINA PRINCIPALE</a> - <a href='vis_sez.php'>Elenco sezioni</a> - $titolo", "", "$nome_scuola", "$comune_scuola");
 
// Esecuzione query
$anno = stringa_html('anno_scolastico');
$rs = mysqli_query($con,inspref("select * from tbl_anno_scolastico_sidi where anno_scolastico=$anno"));

if ($rs) {
    $row = mysqli_fetch_array($rs);
    //Costruzione tabella di riepilogo
    print "\n<CENTER><TABLE BORDER='0'>";
    print "\n<TR><TD COLSPAN='2' ALIGN='CENTER'><B>VUOI ELIMINARE I SEGUENTI DATI?</B></TD></TR>";	

    print "<TR><TD ALIGN='CENTER'>ANNO SCOLASTICO:</TD><TD ALIGN='CENTER'>".$row['anno_scolastico']."</TD></TR>";
    print "<TR><TD ALIGN='CENTER'><FORM ACTION='del_anno.php' method='POST'>";
    print "<input type='hidden' name='anno_scolastico' value='$anno'>"; 
    print "<INPUT TYPE='SUBMIT' VALUE='SI'>";
    print "</FORM></TD>";

    print "<TD ALIGN='CENTER'><FORM ACTION='vis_anno.php' method='POST'>";
    print "<INPUT TYPE='SUBMIT' VALUE='NO'>";
    print "</FORM>";
    print "\n</TD></TR>";
    print "\n</TABLE></CENTER>";
} 
mysqli_close($con);	
stampa_piede("");

