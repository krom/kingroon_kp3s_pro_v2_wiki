# Настройка wifi на принтере
Вторая ревизия принтера(которая с экранчиком) имеет встроенную wlan карту. У этой карты есть свои ограничения
- К сожалению карта работает только на 2.4 Mhz.
- Антенна очень скромная и наклеена к металлическому корпусу принтера - прием wifi у принтера оставляет желать лучшего...

Настроить linux подключаться к вашей точке доступа очень просто:

1. нужно иметь отформатированный под fat32 usb flash диск ( можно свой, а можно взять комплектный, который шел с принтером)
2. на диске нужно создать файл wpa_supplicant-wlan0.conf со следующим содержимым:

```
country=RU
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
    ssid="Y0UR_P3RF3CT_ACC3SS_P0INT"
    psk="Y0ur_v3ry_s3cure_passw0rd"
    key_mgmt=WPA-PSK
}
```
 
3. отредактировать этот файл, нужно поменять ssid на название вашей точки доступа и psk на пароль к вашей сети wifi
4. вставить эту флэшку в один из usb портов принтера, включить принтер - и вуаля - принтер подключиться к вашей сети
5. на экранчике можно посмотреть какой ip адрес получил принтер, нажав крутилку, а на usb свистке появиться файл ip.txt
c этим же ip адресом
6. если все получилось - флэшка больше не нужна и ее можно убрать

комплектная флэшка уже правильно отформатирована и на ней есть готовый файл wpa_supplicant-wlan0.conf, который достаточно 
просто отредактировать

