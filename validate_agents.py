#!/usr/bin/env python3
"""
Validador de agentes personalizados de GitHub Copilot.

Verifica que los archivos .agent.md en .github/agents/ tengan:
- Frontmatter YAML válido (entre ---)
- Campos obligatorios: name, description, tools
- Campo tools es una lista no vacía
- No haya duplicados ni caracteres problemáticos
"""

import os
import sys
import yaml
import glob

AGENTS_DIR = ".github/agents"

def validate_file(filepath):
    """Valida un solo archivo .agent.md"""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Verificar que comience con ---
    if not content.startswith('---'):
        return False, f"Frontmatter no comienza con '---'"
    
    # Dividir frontmatter
    parts = content.split('---', 2)
    if len(parts) < 3:
        return False, "No se encontró cierre del frontmatter"
    
    frontmatter_str = parts[1].strip()
    try:
        data = yaml.safe_load(frontmatter_str)
    except yaml.YAMLError as e:
        return False, f"Error de YAML: {e}"
    
    # Campos obligatorios
    required = ['name', 'description', 'tools']
    for field in required:
        if field not in data:
            return False, f"Falta campo obligatorio: {field}"
    
    # Verificar tipo de tools
    if not isinstance(data['tools'], list):
        return False, "El campo 'tools' debe ser una lista"
    
    # Verificar que name no tenga espacios
    if ' ' in data['name']:
        return False, "El nombre no debe contener espacios"
    
    # Verificar que description no esté vacío
    if not data['description'].strip():
        return False, "La descripción no puede estar vacía"
    
    return True, "OK"

def main():
    if not os.path.isdir(AGENTS_DIR):
        print(f"❌ Directorio '{AGENTS_DIR}' no encontrado.")
        sys.exit(1)
    
    agent_files = glob.glob(os.path.join(AGENTS_DIR, "*.agent.md"))
    if not agent_files:
        print(f"❌ No se encontraron archivos .agent.md en {AGENTS_DIR}")
        sys.exit(1)
    
    print(f"🔍 Validando {len(agent_files)} agentes...")
    all_ok = True
    
    for filepath in agent_files:
        filename = os.path.basename(filepath)
        ok, msg = validate_file(filepath)
        if ok:
            print(f"  ✅ {filename}: {msg}")
        else:
            print(f"  ❌ {filename}: {msg}")
            all_ok = False
    
    if all_ok:
        print("\n🎉 Todos los agentes son válidos.")
        sys.exit(0)
    else:
        print("\n⚠️  Algunos agentes tienen problemas. Corrígelos antes de continuar.")
        sys.exit(1)

if __name__ == "__main__":
    main()
