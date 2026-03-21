#!/bin/bash

# Script de instalación de agentes personalizados de GitHub Copilot
# Uso: bash [ruta/]install.sh [directorio_fuente]

set -e

# Colores para output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}🤖 Instalador de Agentes Personalizados de GitHub Copilot${NC}"
echo ""

# Determinar directorio fuente
if [ -n "$1" ]; then
    AGENTS_SOURCE="$1"
    echo -e "${BLUE}📂 Usando directorio fuente proporcionado: $AGENTS_SOURCE${NC}"
else
    # Intentar detectar si este script está dentro del repositorio de agentes
    SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    if [ -d "$SCRIPT_DIR/.github/agents" ]; then
        AGENTS_SOURCE="$SCRIPT_DIR"
        echo -e "${BLUE}📂 Detectado repositorio local en $AGENTS_SOURCE${NC}"
    else
        # Directorio por defecto
        AGENTS_SOURCE="$HOME/my-copilot-agents"
        echo -e "${BLUE}📂 Usando directorio fuente por defecto: $AGENTS_SOURCE${NC}"
    fi
fi

# Verificar que el directorio fuente existe
if [ ! -d "$AGENTS_SOURCE" ]; then
    echo -e "${RED}❌ Error: El directorio fuente '$AGENTS_SOURCE' no existe.${NC}"
    echo "   Crea el repositorio de agentes o proporciona una ruta válida."
    exit 1
fi

# Verificar subdirectorio de agentes
if [ ! -d "$AGENTS_SOURCE/.github/agents" ]; then
    echo -e "${RED}❌ Error: No se encuentra el directorio de agentes en $AGENTS_SOURCE/.github/agents${NC}"
    exit 1
fi

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

# Contar agentes
AGENT_COUNT=$(ls -1 "$AGENTS_SOURCE/.github/agents"/*.md 2>/dev/null | wc -l)

if [ "$AGENT_COUNT" -eq 0 ]; then
    echo -e "${RED}❌ Error: No se encontraron agentes en $AGENTS_SOURCE/.github/agents${NC}"
    exit 1
fi

# Copiar cada agente
COPIED=0
for agent in "$AGENTS_SOURCE/.github/agents"/*.md; do
    if [ -f "$agent" ]; then
        agent_name=$(basename "$agent")
        echo -e "  ${GREEN}✓${NC} Instalando $agent_name"
        cp "$agent" .github/agents/
        ((COPIED++))
    fi
done

echo ""
echo -e "${GREEN}✅ Instalación completada!${NC}"
echo -e "   Se instalaron $COPIED agentes en .github/agents/"
echo ""
echo -e "${BLUE}📝 Agentes disponibles:${NC}"
ls -1 .github/agents/*.md | xargs -n 1 basename | sed 's/\.agent\.md//' | sed 's/^/  @/'
echo ""
echo -e "${BLUE}💡 Uso:${NC} Invoca los agentes en Copilot Chat con @NombreAgente"
echo ""
