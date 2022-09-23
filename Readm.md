### **`Comando básicos`**

* docker-compose up -d
* docker-compose up
* docker-compose down -v
* docker-compose down
* docker ps
* docker logs id

### **`Iniciar docker`**

* sudo systemctl enable --now docker

### **`Desabiltar firewal`**
---

* sudo systemctl disable firewalld

### **`Aumentar memória`**
---

* sudo sysctl -w vm.max_map_count=262144 ou
* sudo echo vm.max_map_count=262144 >> /etc/sysctl.conf

### **`Adicionar docker no group root`**
---

* sudo groupadd docker
* sudo usermod -aG docker $USER
* sudo usermod -aG docker $(whoami)
* newgrp docker
