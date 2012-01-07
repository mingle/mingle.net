@echo off
attrib -r ..\vscon\lib\*.*
copy /Y .\build\thoughtworksminglelib.dll ..\vscon\lib\"
copy /Y .\build\thoughtworksminglelib.pdb ..\vscon\lib\"
copy /Y .\build\thoughtworkscorelib.dll ..\vscon\lib\"
copy /Y .\build\thoughtworkscorelib.pdb ..\vscon\lib\"
copy /Y .\build\thoughtworksminglelib.dll ..\excel\lib\"
copy /Y .\build\thoughtworksminglelib.pdb ..\excel\lib\"
copy /Y .\build\thoughtworkscorelib.dll ..\excel\lib\"
copy /Y .\build\thoughtworkscorelib.pdb ..\excel\lib\"