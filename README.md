# DEBIAN MARIADB MYSQLD RSYNC

## 1.- Configurar tus maquinas (EJEMPLO): 
	### Host1	
	IP:192.168.1.100
	NETMASK:255.255.255.0
	GATEWAY:192.168.1.1

	/etc/hostname : galera1
	/etc/hosts : 192.168.1.100 galera1

	### Host2
	
	** IP:192.168.1.101
	NETMASK:255.255.255.0
	GATEWAY:192.168.1.1 

	/etc/hostname : galera2
	/etc/Hosts: 192.168.1.101 galera2
	**
## 2.- Generar imagen de docker:
  	### Host1
	docker build -t mi-galera .
	### Host2
	docker build -t mi-galera .

## 3.- Crear volumenes:
	### Host1
	docker volume create db
	### Host2
	docker volume create db

## 4.- Correr imagenes:
	### Host1
	docker run -d --net host -v db:/var/lib/mysql --name galera mi-galera
	### Host2
	docker run -d --net hist -v db:/var/lib/mysql --name galera mi-galera
