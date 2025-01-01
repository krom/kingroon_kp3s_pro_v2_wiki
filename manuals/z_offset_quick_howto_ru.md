## Небольшая шпаргалка по последовательности настройки уровня стола
Перед тем, как запускать калибровку сетки уровня стола необходимо провести калибровку Z_offset.
# небольшая теоретическая часть:

**fluid** - это веб интерфейс (web UI) на 80 tcp порту принтера. на него можно попасть настроив сеть на принтере. 

**Z_offset** - это расстояние от сопла до стола, когда срабатывает датчик автоуровня.

В Pro V2 используется индуктивный датчик уровня стола. Этот датчик срабатывает в 2 мм от поверхности металла.
В случае с принтером Kingroon KP3S Pro V2 поверхность металла это стальная пластина PEI.

**Внимание:** Очень важно всегда класть лист PEI перед любой калибровкой оси Z! Именно датчик выступает как концевик остановки
головы принтера по оси Z!

# Сама последовательность:
1. Проверяем что датчик автоуровня находится по оси Z выше сопла, но не более 2 мм. **Если эта величина окажется больше 2 мм - сопло будет при 
   калибровке давить в стол и перекосит балку оси X!!!**
   Идеально 1.5 - 1.8 мм - если нет - поправляем ослабляя винт крепления датчика. Делается это на отключенном принтере. 
3. Убеждаемся, что балка оси Y стоит параллельно столу. Это можно сделать сдвинув голову и стол, так чтобы голова была где-то посредине стола.
   Далее простой линейкой замеряем расстояние от балки до стола в начале и конце балки - это расстояние должно быть одинаковым.
   Если это не так - путем небольшого ослабления винтов крепления балки можно ее подровнять. Это тоже делается на отключенном принтере.
4. Настраиваем сеть на принтере (если это еще не сделано)
5. Заходим на принтер по сети на web интерфейс и прогреваем стол до температуры, на которой обычно идет печать(допустим 60 градусов)
   Можно прогреть стол на +5 градусов больше. Сопло должно быть чистым - никаких остатков пластика на нем не должно быть.
6. Выбираем на FLUID web ui в макросах “calibrate Z_OFFSET”  кнопку и жмем (там вместо слова 'calibrate' могут быть китайские иероглифы и это не шутка)
   Принтер переводит голову в центр стола и по оси Z выше стола где-то на мм 10-15 и на на web интерфейсе появляется новое окошко с диалогом 
   калибровки.
7. Берем лист офисной бумаги  и кладем под соплом.
8. Кнопками в диалоговом окне _медленно_ опускаем сопло до тех пор, пока сопло не прижмет лист бумаги.
   При этом лист должен быть прижат, но с небольшим усилием можно будет двигать под соплом.
   Хотя присутствуют кнопки опускания и поднимания головы на разные величины, желательно, чтобы голова только опускалась до прижатия соплом листа 
   бумаги
9. В диалоговом окне жмем 'save Z_offset - принтер перегружает процессы клиппер и сохраняет значение Z_offset.
10. значение z_offset сохраняется в файле printer.cfg
 ближе к концу примерно так:
```
#*# [probe]
#*# z_offset = 0.325
```
11. Далее можно совершенно спокойно идти в web ui на раздел tune и проводить  bed mesh calibrate -
    **не забудьте** сохранить полученный результат в профиле default. Опять-таки эта сетка сохраняется в файле printer.cfg в конце.