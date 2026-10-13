@echo off
setlocal EnableExtensions
title CondoFlow - Configuracao inicial do computador
color 0B
set "PASTA=%USERPROFILE%\CondoFlowBackups"

cls
echo.
echo ============================================================
echo                  CONDOFLOW - CONFIGURACAO
echo ============================================================
echo.
echo Preparando ambiente de arquivamento no computador...
echo.

echo [1/4] Verificando o armazenamento local...
if not exist "%USERPROFILE%\" (
  echo ERRO: nao foi possivel localizar a pasta do usuario.
  goto :erro
)
timeout /t 1 /nobreak >nul

echo [2/4] Configurando a area de arquivos...
if not exist "%PASTA%\" (
  mkdir "%PASTA%" >nul 2>&1
)
if not exist "%PASTA%\" (
  echo ERRO: nao foi possivel criar a pasta de arquivos.
  goto :erro
)
timeout /t 1 /nobreak >nul

echo [3/4] Conferindo a estrutura de diretorios...
if not exist "%PASTA%\" goto :erro
timeout /t 1 /nobreak >nul

echo [4/4] Finalizando a configuracao do computador...
timeout /t 1 /nobreak >nul

echo.
echo ============================================================
echo            CONFIGURACAO INICIAL CONCLUIDA
echo ============================================================
echo.
echo Pasta de copias:
echo "%PASTA%"
echo.
echo Para manter o historico atualizado, baixe e salve as copias
echo do CondoFlow nesta pasta diariamente ou semanalmente.
echo.
echo O aplicativo nao foi alterado por este procedimento.
echo.
start "" explorer.exe "%PASTA%"
pause
exit /b 0

:erro
echo.
echo Nao foi possivel concluir a configuracao.
echo Verifique a permissao de acesso a pasta do usuario.
pause
exit /b 1
