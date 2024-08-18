#!/bin/bash

# Создаем директорию для резервного копирования
backup_dir="/backup/$(date +'%Y-%m-%d')"
mkdir -p $backup_dir

# Резервное копирование /home
echo "Резервное копирование директории /home..."
tar -czf $backup_dir/home_backup.tar.gz /home

# Резервное копирование конфигурационных файлов
echo "Резервное копирование конфигурационных файлов..."
tar -czf $backup_dir/config_backup.tar.gz /etc/ssh/sshd_config /etc/ftpusers /etc/xrdp/xrdp.ini

# Резервное копирование /var/log
echo "Резервное копирование директории /var/log..."
tar -czf $backup_dir/log_backup.tar.gz /var/log

# Перемещение бэкапа в директорию /archive
echo "Перемещение бэкапа в директорию /archive..."
mkdir -p /archive
mv $backup_dir/* /archive/

echo "Резервное копирование завершено!"
