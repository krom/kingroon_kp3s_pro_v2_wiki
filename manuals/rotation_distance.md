# Настройка шагов экструдера (Rotation distance setup)
В настройках с фабрики стоит неправильное количество шагов - 43.7
Это неправильная настройка! 
Реально нужно поставить 53.6 
Неправильное кол-во шагов ведет к переэкструзии - филамента давится  +23% к потоку (давилось заместо 100мм прутка 123мм). 
Данные настройки нужно сделать в printer.cfg в разделе extruder:
```
[extruder]
rotation_distance: 53.6
```