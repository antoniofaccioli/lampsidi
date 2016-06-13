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

// Visualizza la tabella Anno Scolastico da utilizzare per il sistema SIDI.

require_once '../php-ini'.$_SESSION['suffisso'].'.php';
require_once '../lib/funzioni.php';
// require_once '../lib/ db / query.php';
$con=mysqli_connect($db_server,$db_user,$db_password,$db_nome) or die ("Errore durante la connessione: ".mysqli_error($con));
    
 
// $lQuery = LQuery::getIstanza();

// istruzioni per tornare alla pagina di login 
////session_start();
$tipoutente = $_SESSION["tipoutente"]; //prende la variabile presente nella sessione

if ($tipoutente == "")
{
    header("location: ../login/login.php?suffisso=".$_SESSION['suffisso']); 
    die;
}	
	
$titolo = "Anno scolastico";
$script = ""; 
stampa_head($titolo,"",$script,"SDMAP");
stampa_testata("<a href='../login/ele_ges.php'>PAGINA PRINCIPALE</a> - $titolo", "", "$nome_scuola", "$comune_scuola");

$rs = mysqli_query($con,inspref("select * from tbl_anno_scolastico_sidi order by anno_scolastico"));

if ($rs) {
    print "<CENTER><TABLE BORDER='1'>";	
    print "<TR class='prima' border=1><TD ALIGN='CENTER'><B>Anno</B></TD><TD ALIGN='CENTER'><B>Inizio</B></TD><TD ALIGN='CENTER'><B>Fine</B></TD><TD ALIGN='CENTER'><B>Ordine scuola</B></TD><TD ALIGN='CENTER'><B>Azioni</B></TD></TR>";
    
    //foreach ($rs as $row) {
    while ($row=mysqli_fetch_array($rs)){
        print "<TR class='oddeven'>";
        print "<TD>". $row['anno_scolastico']. "</TD>";
        print "<TD>". $row['inizio']. "</TD>";
        print "<TD>". $row['fine']. "</TD>";
        print "<TD>". $row['ordine_scuola']. "</TD>";
        print "<TD><A HREF='mod_anno.php?idsez=". 
                $row['anno_scolastico']. "'><img src='../immagini/edit.png' title='Modifica'></A>&nbsp;
                   <A HREF='eli_anno.php?idsez=". 
                $row['anno_scolastico']."'><img src='../immagini/delete.png' title='Elimina'></A>";
        print "</TD>";
        print "</TR>";	
    }
    print "</TABLE></CENTER>";
} else {
    print "Query fallita";
}

print "<br/><CENTER><form name='form2' action='nuo_anno.php' method='POST'>";
print "<input type='submit' name='nuovoanno' value='Nuovo anno scolastico'>";
print "</form></CENTER>";   
mysqli_close($con);
stampa_piede("");

