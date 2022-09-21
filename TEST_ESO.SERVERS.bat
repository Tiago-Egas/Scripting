@ECHO OFF

:PingStart
SET /p enviroment="Select ESO Server to PING: (NA or EU): "
IF /i "%enviroment%" == "NA" GOTO PingUS
IF /i "%enviroment%" == "EU" GOTO PingEU
ECHO Invalid option. Try Again...
CLS
GOTO PingStart

:PingUS
REM For US
ECHO Testing PATHPING for ESO NA Server now...
pathping 195.122.154.1 >> C:\pathping.txt
ECHO Testing TRACERT for ESO NA Server now...
tracert 195.122.154.1 >> C:\tracert.txt
GOTO EOF

:PingEU
REM For EU
ECHO Testing PATHPING for ESO EU Server now...
pathping 198.20.198.110 >> C:\pathping.txt
ECHO Testing TRACERT for ESO EU Server now...
tracert 198.20.198.110 >> C:\tracert.txt
GOTO EOF

