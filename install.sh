#!/bin/bash

# Script de instalación de agentes personalizados de GitHub Copilot
# Uso: bash ~/my-copilot-agents/install.sh

set -e

# Colores para output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}🤖 Instalador de Agentes Personalizados de GitHub Copilot${NC}"
echo ""

# Verificar que estamos en un proyecto
if [ ! -d ".git" ] && [ ! -f "package.json" ] && [ ! -f "pyproject.toml" ] && [ ! -f "requirements.txt" ]; then
    echo -e "${YELLOW}⚠️  Advertencia: No parece ser un directorio de proyecto.${NC}"
    echo "   Continúa solo si estás seguro de que quieres instalar los agentes aquí."
    read -p "¿Continuar? (s/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Ss]$ ]]; then
        echo "Instalación cancelada."
        exit 1
    fi
fi

# Crear directorio de agentes
echo -e "${BLUE}📁 Creando directorio .github/agents...${NC}"
mkdir -p .github/agents

# Copiar agentes
echo -e "${BLUE}📋 Copiando agentes...${NC}"
AGENTS_SOURCE="$HOME/my-copilot-agents/.github/agents"

if [ ! -d "$AGENTS_SOURCE" ]; then
    echo -e "${YELLOW}❌ Error: No se encuentra el directorio de agentes en $AGENTS_SOURCE${NC}"
    exit 1
fi

# Contar agentes
AGENT_COUNT=$(ls -1 "$AGENTS_SOURCE"/*.md 2>/dev/null | wc -l)

if [ "$AGENT_COUNT" -eq 0 ]; then
    echo -e "${YELLOW}❌ Error: No se encontraron agentes en $AGENTS_SOURCE${NC}"
    exit 1
fi

# Copiar cada agente
for agent in "$AGENTS_SOURCE"/*.md; do
    if [ -f "$agent" ]; then
        agent_name=$(basename "$agent")
        echo -e "  ${GREEN}✓${NC} Instalando $agent_name"
        cp "$agent" .github/agents/
    fi
done

echo ""
echo -e "${GREEN}✅ Instalación completada!${NC}"
echo -e "   Se instalaron $AGENT_COUNT agentes en .github/agents/"
echo ""
echo -e "${BLUE}📝 Agentes disponibles:${NC}"
ls -1 .github/agents/*.md | xargs -n 1 basename | sed 's/\.agent\.md//' | sed 's/^/  @/'
echo ""
echo -e "${BLUE}💡 Uso:${NC} Invoca los agentes en Copilot Chat con @NombreAgente"
echo ""
