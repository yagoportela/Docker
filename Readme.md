# Docker

### **`Comando básicos`**

* docker-compose -f {file_docker} up -d
* docker-compose up
* docker-compose -f {file_docker} down -v
* docker-compose down
* docker ps
* docker logs id

### **`Iniciar ou desligar docker`**

* sudo systemctl enable --now docker
* sudo systemctl disable docker
* sudo systemctl stop docker

### **`Desabiltar firewal`**
---

* sudo systemctl disable firewalld

### **`Problemas solucionados`**
---

**Falta de memória mongoDB e opensearch (Fedora)**
* sudo sysctl -w vm.max_map_count=262144 ou
* sudo echo vm.max_map_count=262144 >> /etc/sysctl.conf
* sudo sysctl -p

**Mais falta de memória Opensearch (Fedora)**
* Ir no caminho /etc/security/limits.conf
* digitar em um terminal: 'sudo nano limits.conf'
* Adicionar linhas

```bash
* soft memlock unlimited
* hard memlock unlimited
```

* CTRL + 0
* CTRL + x
* reiniciar computador

### **`Adicionar docker no group root`**
---

* sudo groupadd docker
* sudo usermod -aG docker $USER
* sudo usermod -aG docker $(whoami)
* newgrp docker

# MySql

### **`Acessos Mysql`**

phpmyadmin

```bash
Link: http://localhost:8080/
Servidor: mysqlproduct
Usuário: root
Senha: root
Base de dados: product_db
```

adminer

```bash
Link: http://localhost:8082
Utilizador: root
Palavra-passe: root
```

# Postgres

### **`Acessos Postgres`**

postgresadmin

```bash
Link: http://localhost:16543
Email: postgresteste@yahoo.com.br
Password: root
Servidor: postgresproduct
Usuário: root
Senha: root
Base de dados: product_db
```
# Postgres

### **`Acessos Postgres`**

mongo-express

```bash
Link: http://localhost:8081
```

opensearch-dashboards

```bash
Link: http://localhost:9200
Link-dashboard: http://localhost:5601
```