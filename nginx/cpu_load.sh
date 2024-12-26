#!/bin/sh

# Файл, который будет обновляться и доступен через Nginx
OUTPUT_FILE="/var/www/html/cpu_load.html"

while true; do
    # Используем mpstat с указанием пути к данным хоста
    CPU_LOAD=$(mpstat 1 1 | awk '/Average:/ && $2 ~ /all/ {printf "%.1f\n", 100 - $NF}')
    echo "<html><head><meta http-equiv='refresh' content='2'></head><body><h1>CPU Load: ${CPU_LOAD}%</h1></body></html>" > "$OUTPUT_FILE"
    # Задержка перед следующей итерацией
    sleep 1
done

