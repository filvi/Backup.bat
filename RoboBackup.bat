@Echo off
title RoboBackup ~ Filippo Vicari ~ info@filippovicari.com

rem ----------------------------------------------------------------------------------
rem introduzione
rem ----------------------------------------------------------------------------------

echo. --------------------------------------
echo Programma: RoboBackup
echo. --------------------------------------
echo Descrizione: Backup con Windows Robocopy
echo. --------------------------------------
echo Autore: Filippo Vicari
echo. --------------------------------------
echo Bug report info@filippovicari.com
echo. --------------------------------------
echo Attenzione questo programma copia tutti i file nelle seguenti cartelle
echo. 
echo Desktop
echo Documenti
echo Download
echo Immagini
echo Musica
echo Video
echo.
echo In queste cartelle vengono salvati quasi tutti i files
echo.
echo Per files in altre cartelle e' consigliata la copia manuale 
pause
cls
echo. ----------------------------------------------------------------------------
echo. ----------------------------------------------------------------------------
echo L'autore non si ritiene responsabile di eventuali danni o perdite a files o cartelle dettate dall'utilizzo improprio o parziale del programma.
echo. ----------------------------------------------------------------------------
echo. ----------------------------------------------------------------------------
pause
cls

rem ----------------------------------------------------------------------------------
rem Parte 1 Presentazioni
rem ----------------------------------------------------------------------------------

set des=%userprofile%\Desktop
set doc=%userprofile%\Documents
set dow=%userprofile%\Download
set imm=%userprofile%\Pictures
set mus=%userprofile%\Music
set vid=%userprofile%\Video

echo. 
set /p user_name= Prima di iniziare come posso chiamarti? 

echo. 
echo Benvenuto nel programma di Backup di FV.
echo. 

:user_choice
echo. 
set /p scelta= Ciao %user_name% vuoi dare un occhiata alla guida? [0] o iniziare subito [1]: 

if %scelta% == 0 goto guida
if %scelta% == 1 goto backup

echo. 
echo [!!!] ATTENZIONE PARAMETRO DI SCELTA SCORRETTO [!!!]
echo. 
goto user_choice


rem ----------------------------------------------------------------------------------
rem Guida
rem ----------------------------------------------------------------------------------

:guida
cls
echo Guida:
echo Benvenuto nella guida [breve] per l'utilizzo di quessto programma 
echo. 
echo Per un corretto funzionamento del programma sono necessarie informazioni basilari
echo. 
echo 0. So tutto iniziamo a fare il backup
echo. 
echo 1. Conoscere la lettera associata all'Hard Disk
echo 2. Conoscere la distinzione tra copia / sposta
echo 3. Conoscere le buone norme per un backup
echo. 
echo Argomenti avanzati (non indispensabili per utilizzare il programma nella modalita base)
echo. 
echo 4. (Avanzato) Effettuare il Mirroring e cosa questo comporta
echo 5. (Avanzato) Multithreading 
echo 6. (Avanzato) Escludere directory 
echo 7. (Avanzato) Escludere files piu' vecchi/nuovi
echo 8. (Avanzato) Backup con data ON/OFF
echo 9. (Avanzato) Punti di Giunzione NTFS



echo. 
set /p risposta= Che argomento ti interesserebbe approfondire? 

if %risposta% == 1 goto uno
if %risposta% == 2 goto due
if %risposta% == 3 goto tre
if %risposta% == 4 goto quattro
if %risposta% == 5 goto cinque
if %risposta% == 6 goto sei
if %risposta% == 7 goto sette
if %risposta% == 8 goto otto
if %risposta% == 9 goto nove
if %risposta% == 0 goto backup

echo. 
echo [!!!] ATTENZIONE PARAMETRO DI SCELTA SCORRETTO [!!!]
echo. 
goto guida


:uno
cls
echo. 
echo 1. Conoscere la lettera associata all'Hard Disk
echo. 
echo Su Windows ad ogni disco e' associata una lettera, C: e' il disco principale su cui e' installato Windows, a noi serve scoprire a che lettera e' associato il tuo HDD
echo.
echo Dobbiamo accedere alla cartella chiamata "Risorse del Computer" o "Questo computer"
echo. 

set /p uno_quest= Sei capace di accedere alla cartella? No[0] / Si[1] 
if /i %uno_quest% == 1 goto uno_due


echo. 
echo Nella maggior parte dei casi esiste un icona nel Desktop che permette di accedere alla cartella cliccando due volte con il tasto sinistro e' possibile accedervi.
echo. 
echo Qualora l'icona non fosse presente la procedura piu' rapida e' la seguente: premere contemporaneamente il tasto "WINDOWS" + "E"
echo [?] Il tasto WINDOWS e' tra i tasti CTRL e ALT in basso a sinistra nella tastiera[?]
echo. 
echo Una volta premuta la combinazione di tasti ci troviamo in una finestra con delle icone ora dobbiamo cercare l'icona chiamata "Questo Computer" oppure "Risorse del computer" facciamo doppio click con il mouse su questa e ci troviamo in un'altra schermata.
echo. 
pause

:uno_due
echo Ora davanti a noi sono disponibili molteplici icone con lettere associate troviamo C: il disco principale e a seconda del nostro PC altre lettere come D: E: F: G: ognuno con l'icona e descrizione propria.
echo Se non l'abbiamo fatto in precedenza colleghiamo il nostro Hard Disk e vedimo a che lettera e' associato
echo [!!!] ATTENZIONE la lettera associata sara' richiesta nei passaggi successivi [!!!]
echo.pause 
goto guida

:due
cls
echo. 
echo 2. Conoscere la distinzione tra copia / sposta
echo. 
echo Con il commando COPIA si intende effettuare una copia pari pari dei files in questione in questo modo saranno presenti una volta finito il procedimento sia nel PC sia nel HDD
echo. 
echo Con il commando SPOSTA invece i file vengono spostati dalla posizione di origine verso l' HDD in questo modo i file non saranno piu' accessibili nella posizione originale al termine  dell'operazione.
echo [!!!] ATTENZIONE tutti i file saranno unicamente nel Hard Disk
echo. 
pause 
goto guida

:tre
cls
echo. 
echo 3. Conoscere le buone norme per un backup
echo. 
echo Come detto in anticipo questo programma copia i file presenti nelle seguenti cartelle
echo. 
echo Desktop
echo Documenti
echo Download
echo Immagini
echo Musica
echo Video
echo. 
echo Sebbene siano principalmente queste le cartelle utilizzate per salvare i file nel nostro PC e' bene controllare che non ci siano altre cartelle con dei files sa salvare che risiedono a di fuori di queste sopra citate. Una buona norma inoltre resta quella di controllare brevemente l'eventuale buona riuscita del backup dei files accedendo all Hard Disk e controllando in maniera sistematica o casuale la presenza di file. Specialmente prima di formattare il dispositivo. In ogni caso alla fine dell'operazione sara' possibile controllare eventuali errori dal contenuto del file "LOG.txt" che sara' generato alla fine del procedimento.

echo. 
pause 
goto guida

:quattro
cls
echo. 
echo 4. (Avanzato) Effettuare il Mirroring e cosa questo comporta
echo (non si applica per Backup con data nel nome)
echo. 
echo Con l'opzione Mirroring attiva il programma eseguira' una copia pari pari delle cartelle e file di origine  cancellando eventuali cartelle o file presenti nella destinazione se non presenti nell'origine. In pratica sostituisce la cartella di destinazione con una copia della cartella di origine. Questa opzione apporta dei cambiamenti (al di fuori del Backup) solamente nel caso in cui sia stato gia' effettuato un Backup in precedenza. 
echo. 
pause

cls
echo. 
echo Facciamo un esempio per capirci meglio: La cartella di ORIGINE contiene presenta la seguente struttura
echo. 
echo CARTELLA DI ORIGINE
echo. 
echo.  CARTELLA 1
echo. -- file1 
echo. -- file2 
echo. -- file3 
echo. 
echo.  CARTELLA 2
echo. -- file1 
echo. -- file2 
echo. -- file3 
echo. 
echo.  CARTELLA 3
echo. -- file1 
echo. -- file2 
echo. -- file3 
echo. 
pause

echo. Mentre la cartella di DESTINAZIONE: (da notare CARTELLA 0000, e file4 in CARTELLA3)
echo CARTELLA DI DESTINAZIONE
echo. 
echo.  CARTELLA 1
echo. -- file1 
echo. -- file2 
echo. -- file3 
echo. 
echo [!!!] ATTENZIONE cartella e contenuto rimossi durante il MIRRORING: non presenti nella cartella di ORIGINE
echo.  CARTELLA 0000  
echo. -- file1 
echo. -- file2 
echo. -- file3 
echo. 
echo.  CARTELLA 3
echo. -- file1 
echo. -- file2 
echo. -- file3 
echo. -- file4 [!!!] ATTENZIONE file4 rimosso durante il MIRRORING: non presente nella cartella di ORIGINE
echo. 
echo [!!!] ATTENZIONE L'autore non si assume responsabilita' alcuna per l'eventuale perdita dei file tramite l'utilizzo  
echo di questa modalita', procedi con questa opzione solamente se sai cosa stai facendo. 

echo. 
pause
goto guida

:cinque
cls
echo. 
echo 5. (Avanzato) Multithreading 
echo. 
echo Wikipedia: In informatica il multithreading indica il supporto hardware da parte di un processore di eseguire piu' thread. Un thread in informatica, e' una suddivisione di un processo in due o piu' sottoprocessi, che vengono eseguiti concorrentemente. Il numero di thread utilizzabili in questo programma varia da 1 a 128 (default 8) piu' il numero di thread e' alto e meno tempo occorrera' al PC per esegure l'operazione. E' altresi' vero anche che piu' thread sono usati e piu' il PC ne risentira' in performance pertanto e' consigliabile lasciare operare il PC indisturbato fino al completamento dell'operazione specialmente nei casi in cui si imposta un valore alto di multithreading.
echo. 
pause 
goto guida

:sei
cls
echo. 
echo 6. (Avanzato) Escludere directory 
echo. 
echo In questo programma e' possibile ESCLUDERE directory durante il Backup.
echo. 
echo.  6.1 Escludere una directory dal Backup
echo. 
echo Per escludere una directory e' necessario conoscere il percorso di questa per esempio se durante il Backup voglio escludere da backup la cartella nel Desktop chiamata "CARTELLA DA ESCLUDERE" che risiede all'interno della cartella "CARTELLA SUPERIORE" dobbiamo digitare il percorso completo per evitare che il programma interpreti come DA NON COPIARE cartelle con lo stesso nome all'interno di altre cartelle (es. Documenti Musica ecc)
echo. 
echo Il percorso completo in questo caso e' "%userprofile%\Desktop\CARTELLA SUPERIORE\CARTELLA DA ESCLUDERE" da notare l'utilizzo delle virgolette (obbligatorio in caso di nomi con spazi) altrimenti il programma interpreta lo spazio come un'ulteriore cartella da escludere infatti
echo. 
pause
echo. 
echo.  6.2 Escludere piu' directory dal Backup (da modificare)
echo. 
echo Per escludere pu' cartelle dal Backup basta semplicemente inserirle assieme separate da uno spazio, nel caso come sopra in cui si vogliono escludere le cartelle "CARTELLA DA ESCLUDERE" e "ALTRA CARTELLA DA ESCLUDERE" situate nel Desktop all'interno della "CARTELLA SUPERIORE" basta indicare "%userprofile%\Desktop\CARTELLA SUPERIORE\CARTELLA DA ESCLUDERE" "%userprofile%\Desktop\CARTELLA SUPERIORE\ALTRA CARTELLA DA ESCLUDERE"
echo. 
pause
echo. 
echo.  6.3 Scorciatoia per Digitare il Percorso completo in Windows
echo. 
echo Esiste una scorciatoia per evitare di digitare tutte le volte "%userprofile%" basta inserire la seguente riga di testo: "%%userprofile%%" il simbolo %% prima e dopo una parola indica che questa parola e' una variabile pertanto possiamo richiamarla qualora ci fosse necessario, e' importante ricordare che dopo %userprofile% va aggiunta \ (backslash) e poi la cartella di riferimento per poterla utilizzare. Per esempio per selezionare la cartella: "%userprofile%\Desktop\CARTELLA SUPERIORE" sara' sufficiente digitare "%%userprofile%%\Desktop\CARTELLA SUPERIORE".
echo. 
pause
echo. 
echo.  6.4 Scorciatoie ancora piu' rapide (solo per questo programma)
echo. 
echo Per la semplicita' di utilizzo di questo programma ho creato le seguenti variabili rispettivamente
echo. 
echo %%des%% per %userprofile%\Desktop
echo %%doc%% per %userprofile%\Documenti
echo %%dow%% per %userprofile%\Download
echo %%imm%% per %userprofile%\Immagini
echo %%mus%% per %userprofile%\Musica
echo %%vid%% per %userprofile%\Video
echo.
echo Le variabli sono accessibili in questo modo: per escludere alla "CARTELLA SUPERIORE" in Desktop basta digitare "%des%\CARTELLA SUPERIORE" 
echo. 
pause 
goto guida



:sette
cls
echo. 
echo 7. (Avanzato) Escludere files piu' vecchi/nuovi 
echo (non si applica per Backup con data nel nome)
echo. 7.1 Escludere un file piu' vecchio
echo Esiste la possibilita' in questo programma di ESCLUDERE i file piu' vecchi/nuovi. Poniamo il caso che nel PC dal quale vuoi fare il backup esiste un file1 nel Desktop e lo stesso file e' presente anche nella cartella Desktop del tuo HDD (a seguito di un backup precedente). Hai modificato il file da un altro PC e hai salvato nell' HDD. A questo punto devi decidere se fare vuoi fare il Backup nella stessa cartella del file devi decidere quale file ESCLUDERE dal Backup. Devi decidere quindi se sovrascrivere il file in questione (di norma non e' quello che si vuole) con uno piu' VECCHIO pertanto si decide di ESCLUDERE il file. 
echo. 7.2 Escludere un file piu' nuovo
echo Qualora invece avessi modificato accidentalmente o provvisoriamente un file nel PC e non vuoi rischiare di sovrascrivere accidentalmente il file "corretto" nell HDDallora devi ESCLUDERE il file NUOVO dal Backup
echo [!!!] ATTENZIONE L'autore non si assume responsabilita' alcuna per l'eventuale perdita dei file tramite l'utilizzo di questa modalita', procedi con questa opzione solamente se sai cosa stai facendo. 
echo.
echo. 
pause
goto guida



:otto
echo. 
echo 8. (Avanzato) Backup con data ON/OFF
echo. 
echo Il Backup con data serve principalmente per avere un indicatore di quando e' stato effettuato per l'ultima volta
echo il backup. Nel tuo HDD verra' creata una cartella dal nome:
echo "Backup %user_name% %date:~-10,2%.%date:~-7,2%.%date:~-4,4%"
echo. 
echo Attivando questa opzione si rende inutile il comando di ESCLUDERE i files piu VECCHI/NUOVI e il MIRRORING in quanto a meno che piu' Backup vengano effettuati nello stesso giorno per giorni diversi vengono create cartelle diverse e l'opzione MIRRORING e di ESCLUSIONE vengono applicate nella cartella di destinazione nella quale e' gia' stato effettuato il backup in precedenza ma salvando la cartella con la data per giorni diversi si hanno cartelle differenti.

echo. 
pause
goto guida

:nove
cls
echo. 
echo 9. (Avanzato) Punti di Giunzione NTFS
echo. 
echo I punti di Giunzione sono un argomento un po tosto da spiegare in due righe in maniera efficace se non ne hai mai sentito parlare probabimente non ne hai mai impostato uno. Servono generalmente per poter assegnare nomi a percorsi con una lunghezza maggiore  di quella massima di sistema oppure per lierare dello spazio nel disco facendo puntare la cartella di interesse in un altra posizione In ogni caso se non ne hai mai sentito parlare utilizza le impostazioni di default.
echo. 
echo Default: Punti di Giunzione NTFS esclusi
echo. 


echo. 
pause
goto guida

rem ----------------------------------------------------------------------------------
rem Backup
rem ----------------------------------------------------------------------------------

:backup
cls
echo Backup:
echo. 
echo Inizia la procedura di backup vero e proprio, e' caldamente consigliato di attaccare il PC alla presa di corrente e lasciarlo operare indisturbato finche' non finisce la procedura pena l'eventuale copia errata di file definiti come corrotti e percio' inutilizzabili. 
echo. 
echo Sono state predisposte due opzioni per il backup a seconda del grado di personalizzazione che si desidera ottenere entrambe sono complete variano solamente nelle impostazioni che sono preimpostate nel caso del BACKUP TIPICO vs da definire nel BACKUP PERSONALIZZATO

echo.
if not defined backup_mode set /p backup_mode= Sono interessato in un backup di tipo TIPICO [0], PERSONALIZZATO[1] 
if %backup_mode% == 1 goto custom_backup else goto typical_backup

rem ----------------------------------------------------------------------------------
rem Backup tipico
rem ----------------------------------------------------------------------------------

:typical_backup
echo. 
echo Qualche domanda preliminare:

echo. 
if not defined move_or_not set /p move_or_not=- Vorresi COPIARE[0] oppure SPOSTARE[1] i files? Non so [2]: 
if %move_or_not% == 1 set op_move= /move
if %move_or_not% == 2 goto due

echo. 
if not defined my_letter set /p my_letter= -Inserisci (solo) la lettera alla quale e' associato l'Hard Disk 
set DEST=%my_letter%:\

echo. 
echo I files verranno copiati in %DEST%
echo. 
pause
cls


echo. 
echo Inizio copia files, meglio lasciare collegare il pc alla presa di corrente
echo.
echo Inizio la copia di Desktop
echo. 
echo Copia in corso, attendere prego... 
robocopy %des% "%DEST%Backup %user_name% %date:~-10,2%.%date:~-7,2%.%date:~-4,4%\Desktop" *.* /E /J /V /log+:LOG.txt %op_move% /mt:64
echo. 
echo Copia di Desktop completata maggiori dettagli disponibili nel file LOG.txt. 
echo. 
echo Inizio la copia di Documenti
echo. 
echo Copia in corso, attendere prego... 
robocopy %doc% "%DEST%Backup %user_name% %date:~-10,2%.%date:~-7,2%.%date:~-4,4%\Documents" *.* /E /J /V /log+:LOG.txt %op_move% /mt:64
echo. 
echo Copia di Documenti completata maggiori dettagli disponibili nel file LOG.txt. 
echo. 
echo Inizio la copia di Download
echo. 
echo Copia in corso, attendere prego... 
robocopy %dow% "%DEST%Backup %user_name% %date:~-10,2%.%date:~-7,2%.%date:~-4,4%\Download" *.* /E /J /V /log+:LOG.txt %op_move% /mt:64
echo. 
echo Copia di Download completata maggiori dettagli disponibili nel file LOG.txt. 
echo. 
echo Inizio la copia di Immagini
echo. 
echo Copia in corso, attendere prego... 
robocopy %imm% "%DEST%Backup %user_name% %date:~-10,2%.%date:~-7,2%.%date:~-4,4%\Pictures" *.* /E /J /V /log+:LOG.txt %op_move% /mt:64
echo. 
echo Copia di Immagini completata maggiori dettagli disponibili nel file LOG.txt. 
echo. 
echo Inizio la copia di Musica
echo. 
echo Copia in corso, attendere prego... 
robocopy %mus% "%DEST%Backup %user_name% %date:~-10,2%.%date:~-7,2%.%date:~-4,4%\Music" *.* /E /J /V /log+:LOG.txt %op_move% /mt:64
echo. 
echo Copia di Musica completata maggiori dettagli disponibili nel file LOG.txt. 
echo. 
echo Inizio la copia di Video
echo. 
echo Copia in corso, attendere prego... 
robocopy %vid% "%DEST%Backup %user_name% %date:~-10,2%.%date:~-7,2%.%date:~-4,4%\Video" *.* /E /J /V /log+:LOG.txt %op_move% /mt:64
echo. 
echo Copia di Video completata maggiori dettagli disponibili nel file LOG.txt. 
echo. 
echo Backup completato. Ciao %user_name%, ci vediamo al prossimo Backup
echo. 
pause
goto eof



goto eof

rem ----------------------------------------------------------------------------------
rem Backup custom
rem ----------------------------------------------------------------------------------

:custom_backup

echo. 
echo Prima di iniziare mi serve qualche informazione preliminare, %user_name%:

echo. 
if not defined my_letter set /p my_letter= -Inserisci (solo) la lettera alla quale e' associato l'Hard Disk 
set DEST=%my_letter%:\

echo. 
if not defined move_or_not set /p move_or_not=- Vorresi COPIARE[0] oppure SPOSTARE[1] i files? Non so [2]: 
if %move_or_not% == 1 set op_move= /move
if %move_or_not% == 2 goto due

echo. 
echo I files verranno copiati nell'HDD collegato alla lettera %DEST%
echo. 
pause
cls


echo. 
echo Vuoi aggiungere la data del Backup al nome della cartella nella quale vengono copiati i files? 
echo [!!!] Aggiungendo la data si escludono le opzioni MIRRORING ed ESCLUDI file piu' VECCHI/NUOVI

echo. 
if not defined date_switch set /p date_switch= No non aggiungere la data [0] Si aggiungi la data [1] 
if %date_switch% == 0 goto date_off 
if %date_switch% == 1 goto date_on



rem ----------------------------------------------------------------------------------
rem Date off
rem ----------------------------------------------------------------------------------

:date_off
cls

:exclusion
echo. 
echo Vuoi ESCLUDERE dei files o cartelle?
echo. 
echo 0. Nessun file o cartella da escludere
echo. 
echo 1. Escludere files piu' VECCHI
echo 2. Escludere files piu' NUOVI
echo 3. Escludere CARTELLE

echo. 
if not defined no_date_esclusion set /p no_date_esclusion=Inserire il numero corrispondente: 

if %no_date_esclusion% == 0 goto no_date_mirroring
if %no_date_esclusion% == 1 set file_excl=/XO
if %no_date_esclusion% == 2 set file_excl=/XN
if %no_date_esclusion% == 3 goto dir_exclude
echo.
echo Ottimo!
goto exclusion

:dir_exclude
cls
echo. 
if not defined dir_choice set /p dir_choice= Vuoi riguardare la guida e le scorciatoie premi il tasto [1] altrimenti [0] 
if %dir_choice% == 1 goto sei
if %dir_choice% == 0 goto xcl_no_date 

:xcl_no_date
echo.
set /p dir_look= Vuoi dare un occhiata alle cartelle? No [0] Si [1]
if %dir_look% == 0 goto xcls 
if %dir_look% == 1 goto dir_look_yes

:dir_look_yes

cls
echo.
echo Di quale raccolta vuoi vedere le cartelle da escludere?
echo.
echo [0] Continua
echo.
echo [1] %userprofile%\Desktop
echo [2] %userprofile%\Documenti
echo [3] %userprofile%\Download
echo [4] %userprofile%\Immagini
echo [5] %userprofile%\Musica
echo [6] %userprofile%\Video
echo.

set /p choice_dir= Inserisci il numero corrispondente 

if %choice_dirk% == 0 goto xcls 
if %choice_dir% == 1 set choice_dir_set=%des%
if %choice_dir% == 2 set choice_dir_set=%doc%
if %choice_dir% == 3 set choice_dir_set=%dow%
if %choice_dir% == 4 set choice_dir_set=%imm%
if %choice_dir% == 5 set choice_dir_set=%mus%
if %choice_dir% == 6 set choice_dir_set=%vid%

cd %choice_dir_set%
dir /B /P /AD

echo.
set /p return_choice=Vuoi dare un occhiata alle altre raccolte [0] oppure continuare [1] 

if %return_choice% == 0 goto dir_look_yes
if %return_choice% == 1 goto xclsn

:xclsn

echo.
echo Elenca il percorso delle cartelle da escludere dal Backup tra "" e separate da uno spazio se piu' di una

echo. 
if not defined directory_excl set /p directory_excl=- Voglio escludere: 
set my_directory_excl= /XD %directory_excl%
goto no_date_mirroring

:no_date_mirroring
cls
echo. 
if not defined mirroring set /p mirroring= Voglio eseguire il MIRRORING della cartella [0] Voglio ricontrollare quali sono i rischi nella guida [1] no grazie [2]   
if %mirroring% == 0 set enable_mirr=/MIR
if %mirroring% == 1 goto quattro
goto no_date_multithread

:no_date_multithread
cls

echo. 
set /p multithread_enable= Voglio impostare il numero di Thread [0] No va bene lasciarlo di default [1] Voglio riguardare la guida sull'argomento[2] 

if %multithread_enable% == 0 goto thread_set
if %multithread_enable% == 1 goto default_thread
if %multithread_enable% == 2 goto cinque

:thread_set
echo. 
if not defined custom_thread set /p custom_thread= Voglio dedicare un totale di thread uguale a (valore numerico MIN 1 MAX 128):  
set my_thread=/mt:%custom_thread%

rem .....................................................
rem No date backup
rem .....................................................

:default_thread
echo.
echo Inizio la copia di Desktop
echo.
echo Copia in corso, attendere prego... 
robocopy %des% "%DEST%Backup %user_name%\Desktop" *.* /E /J /V /log+:LOG.txt %op_move% %file_excl% %my_directory_excl% %my_thread% %enable_mirr%
echo. 
echo Copia di Desktop completata maggiori dettagli disponibili nel file LOG.txt. 
echo. 
echo Inizio la copia di Documenti
echo. 
echo Copia in corso, attendere prego... 
robocopy %doc% "%DEST%Backup %user_name%\Documents" *.* /E /J /V /log+:LOG.txt %op_move% %file_excl% %my_directory_excl% %my_thread% %enable_mirr%
echo. 
echo Copia di Documenti completata maggiori dettagli disponibili nel file LOG.txt. 
echo. 
echo Inizio la copia di Download
echo. 
echo Copia in corso, attendere prego... 
robocopy %dow% "%DEST%Backup %user_name%\Download" *.* /E /J /V /log+:LOG.txt %op_move% %file_excl% %my_directory_excl% %my_thread% %enable_mirr%
echo. 
echo Copia di Download completata maggiori dettagli disponibili nel file LOG.txt. 
echo. 
echo Inizio la copia di Immagini
echo. 
echo Copia in corso, attendere prego... 
robocopy %imm% "%DEST%Backup %user_name%\Pictures" *.* /E /J /V /log+:LOG.txt %op_move% %file_excl% %my_directory_excl% %my_thread% %enable_mirr%
echo. 
echo Copia di Immagini completata maggiori dettagli disponibili nel file LOG.txt. 
echo. 
echo Inizio la copia di Musica
echo. 
echo Copia in corso, attendere prego... 
robocopy %mus% "%DEST%Backup\Music" *.* /E /J /V /log+:LOG.txt %op_move% %file_excl% %my_directory_excl% %my_thread% %enable_mirr%
echo. 
echo Copia di Musica completata maggiori dettagli disponibili nel file LOG.txt. 
echo. 
echo Inizio la copia di Video
echo. 
echo Copia in corso, attendere prego... 
robocopy %vid% "%DEST%Backup\Video" *.* /E /J /V /log+:LOG.txt %op_move% %file_excl% %my_directory_excl% %my_thread% %enable_mirr%
echo. 
echo Copia di Video completata maggiori dettagli disponibili nel file LOG.txt. 
echo. 
echo Backup completato. Arrivederci %user_name%, ci vediamo al prossimo Backup
echo. 
pause
goto eof





rem ----------------------------------------------------------------------------------
rem Date on
rem ----------------------------------------------------------------------------------

:date_on
cls
echo. 
echo Vuoi ESCLUDERE delle cartelle?
echo. 
if not defined date_esclusion set /p date_esclusion= Nessuna cartella da escludere [0], escludi cartelle [1] 

if %date_esclusion% == 0 goto date_multithread
if %date_esclusion% == 1 goto date_dir_exclude


:date_dir_exclude
cls
echo.
set /p dir_look= Vuoi dare un occhiata alle cartelle? No [0] Si [1]
if %dir_look% == 0 goto xcls 
if %dir_look% == 1 goto dir_look_yes

:dir_look_yes

cls
echo.
echo Di quale raccolta vuoi vedere le cartelle da escludere?
echo.
echo [0] Continua
echo.
echo [1] %userprofile%\Desktop
echo [2] %userprofile%\Documenti
echo [3] %userprofile%\Download
echo [4] %userprofile%\Immagini
echo [5] %userprofile%\Musica
echo [6] %userprofile%\Video
echo.

set /p choice_dir= Inserisci il numero corrispondente 

if %choice_dirk% == 0 goto xcls 
if %choice_dir% == 1 set choice_dir_set=%des%
if %choice_dir% == 2 set choice_dir_set=%doc%
if %choice_dir% == 3 set choice_dir_set=%dow%
if %choice_dir% == 4 set choice_dir_set=%imm%
if %choice_dir% == 5 set choice_dir_set=%mus%
if %choice_dir% == 6 set choice_dir_set=%vid%

cd %choice_dir_set%
dir /B /P /AD

echo.
set /p return_choice=Vuoi dare un occhiata alle altre raccolte [0] oppure continuare [1] 

if %return_choice% == 0 goto dir_look_yes
if %return_choice% == 1 goto xcl

:xcl

echo.
echo Elenca il percorso delle cartelle da escludere dal Backup tra "" e separate da uno spazio se piu' di una


echo. 
if not defined directory_excl set /p directory_excl=- Voglio escludere: 
set my_directory_excl= /XD %directory_excl%
goto date_multithread

:date_multithread
cls

echo. 
set /p multithread_enable= Voglio impostare il numero di Thread [0] No va bene lasciarlo di default [1] Voglio riguardare la guida sull'argomento[2] 

if %multithread_enable% == 0 goto date_thread_set
if %multithread_enable% == 1 goto date_default_thread
if %multithread_enable% == 2 goto cinque

:date_thread_set
echo. 
if not defined custom_thread set /p custom_thread= Voglio dedicare un totale di thread uguale a (valore numerico MIN 1 MAX 128):  
set my_thread=/mt:%custom_thread%

rem .....................................................
rem Date backup
rem .....................................................

:date_default_thread
echo.
echo Inizio copia files, meglio lasciare collegare il pc alla presa di corrente
echo.
echo Inizio la copia di Desktop
echo. 
echo Copia in corso, attendere prego... 
robocopy %des% "%DEST%Backup %user_name%\Desktop" *.* /E /J /V /log+:LOG.txt %op_move% %file_excl% %my_directory_excl% %my_thread% 
echo. 
echo Copia di Desktop completata maggiori dettagli disponibili nel file LOG.txt. 
echo. 
echo Inizio la copia di Documenti
echo. 
echo Copia in corso, attendere prego... 
robocopy %doc% "%DEST%Backup %user_name%\Documents" *.* /E /J /V /log+:LOG.txt %op_move% %file_excl% %my_directory_excl% %my_thread% 
echo. 
echo Copia di Documenti completata maggiori dettagli disponibili nel file LOG.txt. 
echo. 
echo Inizio la copia di Download
echo. 
echo Copia in corso, attendere prego... 
robocopy %dow% "%DEST%Backup %user_name%\Download" *.* /E /J /V /log+:LOG.txt %op_move% %file_excl% %my_directory_excl% %my_thread% 
echo. 
echo Copia di Download completata maggiori dettagli disponibili nel file LOG.txt. 
echo. 
echo Inizio la copia di Immagini
echo. 
echo Copia in corso, attendere prego... 
robocopy %imm% "%DEST%Backup %user_name%\Pictures" *.* /E /J /V /log+:LOG.txt %op_move% %file_excl% %my_directory_excl% %my_thread% 
echo. 
echo Copia di Immagini completata maggiori dettagli disponibili nel file LOG.txt. 
echo. 
echo Inizio la copia di Musica
echo. 
echo Copia in corso, attendere prego... 
robocopy %mus% "%DEST%Backup\Music" *.* /E /J /V /log+:LOG.txt %op_move% %file_excl% %my_directory_excl% %my_thread% 
echo. 
echo Copia di Musica completata maggiori dettagli disponibili nel file LOG.txt. 
echo. 
echo Inizio la copia di Video
echo. 
echo Copia in corso, attendere prego... 
robocopy %vid% "%DEST%Backup\Video" *.* /E /J /V /log+:LOG.txt %op_move% %file_excl% %my_directory_excl% %my_thread% 
echo. 
echo Copia di Video completata maggiori dettagli disponibili nel file LOG.txt. 
echo. 
echo Backup completato. Arrivederci %user_name%, ci vediamo al prossimo Backup
echo. 
pause
goto eof
