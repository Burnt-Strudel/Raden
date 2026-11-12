@echo off
chcp 65001 >nul
cd /d "%~dp0"

if not exist "tools\cloudflared.exe" (
    echo Не найден tools\cloudflared.exe
    pause
    exit /b 1
)

netstat -ano | findstr ":5025" | findstr "LISTENING" >nul
if errorlevel 1 (
    echo API не запущено. Поднимите контейнеры:
    echo   docker compose -f API\compose.yaml up -d
    pause
    exit /b 1
)

echo Публичный адрес для http://localhost:5025
echo.
echo 1. Дождитесь строки "Your quick Tunnel has been created".
echo 2. Скопируйте адрес вида https://....trycloudflare.com
echo 3. Приложение: Ещё - Сервер API - вставить адрес - Сохранить.
echo 4. Браузер: откройте этот же адрес, веб-версия откроется с него же.
echo.
echo Адрес живёт, пока открыто это окно. Для остановки нажмите Ctrl+C.
echo.

tools\cloudflared.exe tunnel --url http://localhost:5025 --no-autoupdate
pause
