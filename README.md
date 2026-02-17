# 🤖 Mis Agentes Personalizados de GitHub Copilot

Repositorio de plantillas con agentes personalizados de GitHub Copilot para reutilizar en cualquier proyecto.

## 📋 Agentes Disponibles

### 1. **ExpertSQL** 
Experto en bases de datos: diseño, consultas, optimización, migraciones y diagnóstico de rendimiento.

### 2. **CyberSecurity**
Especialista en seguridad: análisis de vulnerabilidades, mejores prácticas, auditoría de código y arquitectura segura.

### 3. **ManagerProject**
Gestor de proyectos: análisis de documentación, verificación de consistencia, detección de inconsistencias.

### 4. **QA**
Aseguramiento de calidad: diseño de pruebas, validación, identificación de defectos y automatización.

### 5. **Ventas_software**
Especialista en ventas: pitches, páginas de ventas, cálculo de precios, modelos comerciales SaaS.

## 🚀 Instalación

### Opción 1: Script automático

```bash
# Desde la raíz de tu proyecto
bash ~/my-copilot-agents/install.sh
```

### Opción 2: Manual

```bash
# Copiar agentes a tu proyecto
mkdir -p .github/agents
cp ~/my-copilot-agents/.github/agents/*.md .github/agents/
```

### Opción 3: Git (recomendado para sincronización)

```bash
# 1. Inicializar el repositorio de plantillas (solo una vez)
cd ~/my-copilot-agents
git init
git add .
git commit -m "Initial commit with custom agents"

# 2. Subir a GitHub (crea un repo llamado 'copilot-agents' en GitHub)
git remote add origin git@github.com:TU_USUARIO/copilot-agents.git
git push -u origin main

# 3. En cualquier proyecto nuevo
cd /ruta/tu/proyecto
git submodule add git@github.com:TU_USUARIO/copilot-agents.git .github/agents
# O simplemente clonar en la carpeta correcta:
rm -rf .github/agents
git clone git@github.com:TU_USUARIO/copilot-agents.git .github/agents-temp
mv .github/agents-temp/.github/agents .github/agents
rm -rf .github/agents-temp
```

## 📦 Sincronización entre Computadoras

### Usando Git (Recomendado)

1. **Primera vez**: Crear repositorio en GitHub y subir los agentes
   ```bash
   cd ~/my-copilot-agents
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin git@github.com:TU_USUARIO/copilot-agents.git
   git push -u origin main
   ```

2. **En la otra computadora**: Clonar el repositorio
   ```bash
   git clone git@github.com:TU_USUARIO/copilot-agents.git ~/my-copilot-agents
   ```

3. **Actualizar cambios**: Cuando modifiques un agente
   ```bash
   cd ~/my-copilot-agents
   git add .
   git commit -m "Update agents"
   git push
   
   # En la otra computadora
   cd ~/my-copilot-agents
   git pull
   ```

## 🔄 Actualizar Agentes en Proyecto Existente

Si modificas un agente en el repositorio de plantillas:

```bash
# Desde la raíz de tu proyecto
bash ~/my-copilot-agents/install.sh
```

## ✏️ Crear Nuevo Agente

1. Crea un archivo `.agent.md` en `~/my-copilot-agents/.github/agents/`
2. Usa esta plantilla:

```markdown
---
name: NombreAgente
description: Descripción breve del agente
argument-hint: Qué tipo de entrada espera el agente
tools: ['vscode', 'execute', 'read', 'edit', 'search', 'web', 'todo']
---

# Instrucciones del agente

Define el comportamiento, capacidades y responsabilidades del agente aquí.
```

3. Commit y push:
```bash
cd ~/my-copilot-agents
git add .
git commit -m "Add new agent"
git push
```

## 📝 Estructura

```
my-copilot-agents/
├── README.md
├── install.sh
└── .github/
    └── agents/
        ├── ExpertSQL.agent.md
        ├── CyberSecurity.agent.md
        ├── ManagerProject.agent.md
        ├── QA.agent.md
        └── Ventas_software.agent.md
```

## 🎯 Uso en VS Code

Una vez instalados en tu proyecto, puedes invocarlos en el chat de Copilot:

```
@ExpertSQL ayúdame a optimizar esta consulta
@CyberSecurity revisa este código de autenticación
@ManagerProject verifica la documentación del proyecto
@QA genera casos de prueba para este componente
@Ventas_software crea un pitch para este producto
```

## 🔐 Notas de Seguridad

- Los agentes no se sincronizan automáticamente con Settings Sync de VS Code
- Están atados al proyecto (carpeta `.github/agents/`)
- Usa Git para mantenerlos actualizados entre computadoras
- No incluyas información sensible en las definiciones de agentes

## 📚 Recursos

- [Documentación oficial de Agentes Personalizados](https://docs.github.com/en/copilot/customizing-copilot/creating-custom-agents)
- [Best Practices para Agentes](https://github.blog/changelog/2024-05-21-github-copilot-extensions-now-in-public-beta/)

---

**Última actualización**: Febrero 2026
