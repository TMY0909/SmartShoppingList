@echo off
echo   Levantando el proyecto TFG en Docker...

docker compose --env-file ./backend/core/.env up -d

:bucle_espera
    curl -s http://localhost:5173 > nul

    if %errorlevel% neq 0 (
        timeout /t 3 /nobreak > nul
        goto bucle_espera
    )

echo Abriendo navegador...
start http://localhost:5173

pause