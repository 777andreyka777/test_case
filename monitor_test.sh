#!/bin/bash

LOG_FILE="/var/log/monitoring.log"

MONITORING_URL="https://test.com/monitoring/test/api"

PROCESS_NAME="test"

log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> $LOG_FILE
}

if pgrep -x "$PROCESS_NAME" > /dev/null; then
    if curl -s -o /dev/null --connect-timeout 10 "$MONITORING_URL"; then
        log_message "Процесс $PROCESS_NAME запущен. Успешный запрос к $MONITORING_URL."
    else
        log_message "Процесс $PROCESS_NAME запущен, но сервер мониторинга недоступен."
    fi
else
    log_message "Процесс $PROCESS_NAME не запущен."
fi
