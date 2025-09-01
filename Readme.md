# 🐳 Docker - Bancos de Dados e Ferramentas

Este repositório contém configurações Docker para diversos bancos de dados e ferramentas de administração, facilitando o desenvolvimento local.

## 📋 Índice

- [Comandos Básicos](#comandos-básicos)
- [Gerenciamento do Docker](#gerenciamento-do-docker)
- [Solução de Problemas](#solução-de-problemas)
- [Bancos de Dados](#bancos-de-dados)
  - [MySQL](#mysql)
  - [PostgreSQL](#postgresql)
  - [MongoDB](#mongodb)
  - [DynamoDB](#dynamodb)
  - [OpenSearch](#opensearch)

## 🚀 Comandos Básicos

### Iniciar serviços
```bash
# Iniciar todos os serviços
docker-compose up -d

# Iniciar serviço específico
docker-compose -f docker-mysql.yaml up -d
docker-compose -f docker-postgres.yaml up -d
docker-compose -f docker-mongodb.yaml up -d
docker-compose -f docker-dynamodb.yaml up -d
docker-compose -f docker-opensearch.yaml up -d
```

### Parar serviços
```bash
# Parar todos os serviços
docker-compose down

# Parar serviço específico
docker-compose -f docker-mysql.yaml down -v

# Parar e remover volumes
docker-compose down -v
```

### Monitoramento
```bash
# Listar containers em execução
docker ps

# Visualizar logs de um container
docker logs <container_id>
```

## ⚙️ Gerenciamento do Docker

### Habilitar/Desabilitar Docker
```bash
# Habilitar e iniciar Docker
sudo systemctl enable --now docker

# Desabilitar Docker
sudo systemctl disable docker

# Parar Docker
sudo systemctl stop docker
```

### Configurar usuário no grupo Docker
```bash
# Adicionar usuário ao grupo docker
sudo groupadd docker
sudo usermod -aG docker $USER
sudo usermod -aG docker $(whoami)

# Aplicar mudanças na sessão atual
newgrp docker
```

### Desabilitar Firewall (Fedora)
```bash
sudo systemctl disable firewalld
```

## 🔧 Solução de Problemas

### Problemas de Memória - MongoDB e OpenSearch (Fedora)

#### Ajustar limite de memória virtual
```bash
# Aplicar temporariamente
sudo sysctl -w vm.max_map_count=262144

# Aplicar permanentemente
sudo echo vm.max_map_count=262144 >> /etc/sysctl.conf
sudo sysctl -p
```

#### Ajustar limites de memória para OpenSearch
```bash
# Editar arquivo de limites
sudo nano /etc/security/limits.conf

# Adicionar as seguintes linhas:
* soft memlock unlimited
* hard memlock unlimited

# Salvar (Ctrl+O) e sair (Ctrl+X)
# Reiniciar o computador para aplicar as mudanças
```

## 🗄️ Bancos de Dados

### MySQL

#### Acesso via phpMyAdmin
- **URL**: http://localhost:8080/
- **Servidor**: mysqlproduct
- **Usuário**: root
- **Senha**: root
- **Base de dados**: product_db

#### Acesso via Adminer
- **URL**: http://localhost:8082
- **Usuário**: root
- **Senha**: root

### PostgreSQL

#### Acesso via pgAdmin
- **URL**: http://localhost:16543
- **Email**: postgresteste@yahoo.com.br
- **Senha**: root
- **Servidor**: postgresproduct
- **Usuário**: root
- **Senha**: root
- **Base de dados**: product_db

### MongoDB

#### Acesso via Mongo Express
- **URL**: http://localhost:8081

### DynamoDB

#### Acesso via DynamoDB Local
- **Endpoint**: http://localhost:8000
- **Região**: us-east-1
- **Credenciais**: 
  - Access Key ID: dummy
  - Secret Access Key: dummy

#### Interface Web - DynamoDB Admin
- **URL**: http://localhost:8001
- **Configuração**: Conecta automaticamente ao DynamoDB Local

#### Estrutura do Projeto
```
dynamodb/
├── init-db.sh          # Script de inicialização
├── tables/             # Definições das tabelas
│   └── componentesAws.json
└── items/              # Dados para inserção
    └── componentesAws.json
```

#### Funcionalidades
- **Inicialização Automática**: Cria tabelas e insere dados automaticamente
- **Health Check**: Verifica se o serviço está funcionando
- **Persistência**: Dados são mantidos em volume Docker
- **AWS CLI**: Utiliza AWS CLI para operações no banco

#### Comandos AWS CLI para DynamoDB Local
```bash
# Listar tabelas
aws dynamodb list-tables --endpoint-url http://localhost:8000

# Descrever tabela
aws dynamodb describe-table --table-name ComponentesAws --endpoint-url http://localhost:8000

# Inserir item
aws dynamodb put-item \
  --table-name ComponentesAws \
  --item '{"id": {"S": "exemplo"}, "nome": {"S": "Teste"}}' \
  --endpoint-url http://localhost:8000

# Consultar itens
aws dynamodb scan --table-name ComponentesAws --endpoint-url http://localhost:8000
```

### OpenSearch

#### Acesso via OpenSearch
- **URL**: http://localhost:9200

#### Acesso via OpenSearch Dashboards
- **URL**: http://localhost:5601

## 📁 Estrutura do Projeto

```
Docker/
├── docker-dynamodb.yaml
├── docker-mongodb.yaml
├── docker-mysql.yaml
├── docker-opensearch.yaml
├── docker-postgres.yaml
├── dynamodb/
│   ├── init-db.sh
│   ├── items/
│   │   └── componentesAws.json
│   └── tables/
│       └── componentesAws.json
└── README.md
```

## 🚀 Início Rápido

1. **Clone o repositório**
2. **Escolha o banco de dados desejado**
3. **Execute o comando correspondente**:
   ```bash
   docker-compose -f docker-{banco}.yaml up -d
   ```
4. **Para parar**: `docker-compose -f docker-{banco}.yaml down`

## 📝 Notas

- Todos os serviços incluem health checks para garantir inicialização adequada
- Volumes são configurados para persistir dados entre reinicializações
- Portas padrão são utilizadas para evitar conflitos
- Credenciais são simplificadas para desenvolvimento local

## 🤝 Contribuição

Sinta-se à vontade para contribuir com melhorias, correções ou novos bancos de dados!