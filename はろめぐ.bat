@echo off

rem �e��p�X����
set path=%~p0
set vbsFile=%path%msgbox.vbs
set wavPath=%path%shutdown.wav
set playTime=5000

rem ����vbs�����݂����ꍇ�ɍ폜����
if exist "%vbsFile%" (
	del /f "%vbsFile%"
)

rem vbs����
echo Dim answer >> %vbsFile%
echo answer = msgbox("�V���b�g�_�E������H",vbYesNo + vbInformation,"������") >> "%vbsFile%"
echo WScript.Quit(answer) >> "%vbsFile%"

rem vbs���s
start /b %wavPath%
"%vbsFile%"

rem vbs���s���ʊm�F
if %errorlevel% == 1 (
	shutdown.exe /s /t 0
)

rem vbs�폜
del /f "%vbsFile%"
