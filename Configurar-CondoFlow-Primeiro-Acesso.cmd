@echo off
setlocal EnableExtensions DisableDelayedExpansion
title CondoFlow - Assistente de Configuracao
color 0B
mode con: cols=76 lines=34 >nul 2>&1

set "PASTA=%USERPROFILE%\CondoFlowBackups"

cls
echo.
echo   ====================================================================
echo     ____  ___   _   _  ____   ___  _____ _     _____        __
echo    / ___^|/ _ \ ^| \ ^| ^|^|  _ \ / _ \^|  ___^| ^|   / _ \ \      / /
echo   ^| ^|   ^| ^| ^| ^|^|  \^| ^|^| ^| ^| ^| ^| ^| ^| ^|_  ^| ^|  ^| ^| ^| \ \ /\ / /
echo   ^| ^|___^| ^|_^| ^|^| ^|\  ^|^| ^|_^| ^| ^|_^| ^|  _^| ^| ^|__^| ^|_^| ^|\ V  V /
echo    \____^|\___/ ^|_^| \_^|^|____/ \___/^|_^|   ^|_____\___/  \_/\_/
echo.
echo                       CONFIGURACAO INICIAL
echo   ====================================================================
echo.
echo     Preparando seu computador para organizar as copias de seguranca.
echo     Nenhuma instalacao adicional e necessaria neste procedimento.
echo.
echo   [01/04] Identificando o perfil do Windows...
if not defined USERPROFILE goto :erro_perfil
if not exist "%USERPROFILE%\" goto :erro_perfil
echo           [##########------------------------------] 25%%  OK
timeout /t 1 /nobreak >nul
echo.
echo   [02/04] Verificando os componentes locais do Windows...
if not exist "%SystemRoot%\System32\cmd.exe" goto :erro_sistema
if not exist "%SystemRoot%\explorer.exe" goto :erro_sistema
echo           [####################--------------------] 50%%  OK
timeout /t 1 /nobreak >nul
echo.
echo   [03/04] Preparando a pasta de copias de seguranca...
if not exist "%PASTA%\" mkdir "%PASTA%" >nul 2>&1
if not exist "%PASTA%\" goto :erro_pasta
echo           [##############################----------] 75%%  OK
timeout /t 1 /nobreak >nul
echo.
echo   [04/04] Conferindo a pasta e abrindo os arquivos...
if not exist "%PASTA%\" goto :erro_pasta
start "" explorer.exe "%PASTA%"
echo           [########################################] 100%% OK
echo.
echo   ====================================================================
echo                         CONFIGURACAO CONCLUIDA
echo   ====================================================================
echo.
echo     Pasta de copias: "%PASTA%"
echo.
echo     Para guardar os registros, baixe o arquivo ZIP no painel
echo     do CondoFlow e salve-o nesta pasta, diariamente ou semanalmente.
echo.
echo     Este assistente apenas cria e abre a pasta. Nao faz downloads
echo     de registros e nao modifica o funcionamento do CondoFlow.
echo.
pause
exit /b 0

:erro_perfil
echo.
echo     ERRO: Nao foi possivel identificar a pasta do usuario.
goto :erro_final

:erro_sistema
echo.
echo     ERRO: Componente necessario do Windows nao encontrado.
goto :erro_final

:erro_pasta
echo.
echo     ERRO: Nao foi possivel criar ou acessar a pasta de copias.
goto :erro_final

:erro_final
echo     Nenhuma informacao do CondoFlow foi alterada.
echo.
pause
exit /b 1
