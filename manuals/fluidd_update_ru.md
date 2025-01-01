# Обновление версии Fluidd

Fluidd - это web интерфейс принтера который стандартно показывется если набрать в web browser: **http://<printet_ip_adress>**


## Автоматическое обновление при помощи скрипта

1. нужно [зайти на принтер с помощью ssh](../manuals/ssh_ru.md)

2. Выполнить команду
```bash
curl -sL http://bit.ly/3ZX8mN0 | bash
```

## Ручное обновление
1. нужно [зайти на принтер с помощью ssh](../manuals/ssh_ru.md)
2. переименовать директорию, в которой стоит текущий fluidd, например командой:  
```bash
mv fluidd fluidd.bak
```

3. заново создать директорию fluidd и перейти в нее:

```bash
mkdir fluidd;cd fluidd
```

4. загрузить последнюю версию fluidd:

```bash
wget -q -O fluidd.zip https://github.com/fluidd-core/fluidd/releases/latest/download/fluidd.zip
```

5. распаковать архив fluidd.zip, затем опционально можно удалить сам архив:

```bash
unzip fluidd.zip
rm fluidd.zip
```

6. чтобы новая версия fluidd стала доступна, нужно перестартовать web сервер (nginx):

```bash
sudo service nginx restart
```
