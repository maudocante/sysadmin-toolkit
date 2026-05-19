#!/bin/bash
# Script de deploy executado pelo GitHub Actions

echo "🚀 Iniciando deploy automático..."
echo "📦 Deploy ID: $(date +%Y%m%d-%H%M%S)"

# Verificar scripts
for script in scripts/*.sh; do
    if [ -f "$script" ]; then
        echo "✅ Validando $script..."
        bash -n "$script"  # Syntax check
    fi
done

# Simular deploy
echo "📂 Criando backup..."
mkdir -p backups
tar -czf "backups/backup-$(date +%Y%m%d).tar.gz" scripts/

echo "🔧 Executando verificações pós-deploy..."
./scripts/ping_monitor.sh
./scripts/ram-monitor.sh
./scripts/disk-monitor.sh

echo "✅ Deploy concluído com sucesso!"
