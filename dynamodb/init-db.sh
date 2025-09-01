#!/bin/sh
# Aguarda um pouco mais para garantir que está totalmente inicializado
sleep 5

for json_file in /tmp/tables/*.json; do
  table_name=$(jq -r '.TableName' "$json_file")
  echo "Criando a tabela: $table_name ..."
  aws dynamodb create-table \
    --endpoint-url http://dynamodb-local:8000 \
    --cli-input-json file://"$json_file"

  echo "Aguardando tabela $table_name ser criada..."
  aws dynamodb wait table-exists \
    --endpoint-url http://dynamodb-local:8000 \
    --table-name "$table_name"

  echo "Tabela $table_name criada com sucesso!"
done

# Insere dados dos serviços AWS
echo "Inserindo dados dos serviços AWS..."

for json_file in /tmp/items/*.json; do
  echo "Processando arquivo: $json_file"
  jq -c '.[]' "$json_file" | while read -r item_json; do
    echo "Inserindo item: $item_json"
    aws dynamodb put-item \
      --endpoint-url http://dynamodb-local:8000 \
      --table-name ComponentesAws \
      --item "$item_json"
  done
done

echo "Inicialização do banco de dados concluída!"