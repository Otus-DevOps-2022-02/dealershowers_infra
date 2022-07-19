# dealershowers_infra
dealershowers Infra repository
#Подключение к someinternalhost из рабочей машины
# на bastion в /etc/ssh/sshd_config
	AllowTcpForwarding yes
	GatewayPorts yes
# Запускаем на someinternalhost команду ниже, доступа в интернет у неё прошу заметить нет(но обратное туннелирование на локальных адресах подсетки не заработало). И вообще в целом куча геммороя из за непонятного поведения облака яндекс и ната один к одному, на мой взгляд решение так се. Еще и в интерфейсах не видать публичного адреса.
	ssh -fN -R 62.84.124.191:2222:localhost:22 curator@62.84.124.191
#Проверяем на бастионе что туннель запустился
	sudo netstat -nap | grep 2222
#С рабочей машины через команду попадаем сразу на необходимый хост
	ssh -p 2222 curator@62.84.124.191 -i /home/curator/keys/yc
#Дальше дело техники, добавляем в /etc/ssh/ssh_config параметры подключения
#Host someinternalhost
    IdentityFile /home/curator/keys/yc
    port 2222
    HostName 62.84.124.191
    User curator
# и в дальнейшем подключаемся через ssh  someinternalhost
bastion_IP = 51.250.75.108
someinternalhost_IP = 10.128.0.32
#еще неожиданно в момент проверки может отключиться машина в яндексе)
#Данные для подключения
testapp_IP = 62.84.127.56
testapp_port = 9292
