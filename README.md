Делаем мод исполняемым:
chmod +x /usr/local/bin/monitor_test.sh


Create monitor_test.service
# Перезагружаем systemd для применения изменений
sudo systemctl daemon-reload

# Включаем автозапуск сервиса при старте системы
sudo systemctl enable monitor_test.service

# Запускаем сервис
sudo systemctl start monitor_test.service
