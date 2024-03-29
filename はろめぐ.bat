@echo off

rem 各種パス生成
set path=%~p0
set vbsFile=%path%msgbox.vbs
set wavPath=%path%shutdown.wav

rem 既にvbsが存在した場合に削除する
if exist "%vbsFile%" (
	del /f "%vbsFile%"
)

rem vbs生成
echo Dim answer >> "%vbsFile%"
echo answer = msgbox("シャットダウンする？",vbYesNo + vbInformation,"藤島慈") >> "%vbsFile%"
echo WScript.Quit(answer) >> "%vbsFile%"

rem vbs実行
start /b %wavPath%
"%vbsFile%"

rem vbs実行結果確認
if %ERRORLEVEL% equ 6 (
	start shutdown.exe /s /t 0
)

rem vbs削除
del /f "%vbsFile%"
