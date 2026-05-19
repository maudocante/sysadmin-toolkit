#!/bin/bash
HOST="8.8.8.8"
echo "Testando conectividade..."
echo "🌐 Testando conectividade com $HOST..."
ping -c 4 $HOST
if [ $? -eq 0 ]; then
    echo "✅ Conexão OK"
else
    echo "❌ Falha na conexão"
    exit 1
fi
