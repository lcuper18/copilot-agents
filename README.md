# 🤖 Mis Agentes Personalizados de GitHub Copilot

Repositorio de plantillas con agentes personalizados de GitHub Copilot para reutilizar en cualquier proyecto.

## 📋 Agentes Disponibles

### 1. **ExpertSQL** 
Experto en bases de datos: diseño, consultas complejas, optimización, migraciones y diagnóstico de rendimiento. Incluye mejores prácticas para PostgreSQL, MySQL, SQL Server, SQLite.

### 2. **CyberSecurity**
Especialista en seguridad: análisis de vulnerabilidades (OWASP Top 10), auditoría de código, arquitectura segura, threat modeling, compliance (GDPR, HIPAA, PCI-DSS).

### 3. **ManagerProject**
Gestor de proyectos: análisis de documentación, verificación de consistencia, detección de inconsistencias, propuesta de correcciones con autorización del usuario.

### 4. **QA**
Aseguramiento de calidad: diseño de planes de prueba, automatización, reporte de defectos, revisión de código, integración CI/CD, métricas de calidad.

### 5. **Ventas_software**
Especialista en ventas de software SaaS: creación de pitches, estrategias de precios, páginas de ventas, modelos comerciales, investigación de mercado.

### 6. **FrontendDev**
Especialista en desarrollo frontend: frameworks modernos (React, Vue, Angular), diseño responsive, accesibilidad, optimización de rendimiento.

### 7. **DevOps**
Especialista en DevOps: CI/CD, contenedores (Docker, Kubernetes), cloud (AWS, Azure, GCP), infraestructura como código, monitorización.

### 8. **DataScience**
Especialista en ciencia de datos: análisis, visualización, machine learning, estadística, despliegue de modelos.

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
git remote add origin https://github.com/lcuper18/copilot-agents.git
git push -u origin main

# 3. En cualquier proyecto nuevo
cd /ruta/tu/proyecto
git submodule add https://github.com/lcuper18/copilot-agents.git .github/agents
# O simplemente clonar en la carpeta correcta:
rm -rf .github/agents
git clone https://github.com/lcuper18/copilot-agents.git .github/agents-temp
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
   git remote add origin https://github.com/lcuper18/copilot-agents.git
   git push -u origin main
   ```

2. **En la otra computadora**: Clonar el repositorio
   ```bash
   git clone https://github.com/lcuper18/copilot-agents.git ~/my-copilot-agents
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
tools: ['vscode', 'execute', 'read', 'agent', 'edit', 'search', 'web', 'todo']
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

## 🏗️ Estructura de un Agente

Cada agente es un archivo Markdown con un frontmatter YAML seguido de instrucciones.

**Frontmatter obligatorio**:
```yaml
---
name: NombreAgente
description: Descripción clara del propósito del agente
argument-hint: Qué tipo de entrada espera el agente (opcional pero recomendado)
tools: ['vscode', 'execute', 'read', 'agent', 'edit', 'search', 'web', 'todo']
---
```

**Secciones de contenido**:
- **Scope**: Áreas de expertise y responsabilidades.
- **Working Rules**: Reglas de interacción, preguntas de contexto, formatos de respuesta.
- **Methodologies/Templates**: Metodologías específicas, plantillas reutilizables.
- **Best Practices**: Recomendaciones clave para el dominio.

Consulta los agentes existentes como referencia.

## 📝 Convenciones de Escritura

- **Claridad**: Instrucciones específicas y no ambiguas.
- **Ejemplos**: Incluir ejemplos concretos de uso y salidas esperadas.
- **Herramientas**: Especificar solo las herramientas necesarias (lista simplificada).
- **Idioma**: Usar español o inglés según el público objetivo, ser consistente.
- **Formato**: Usar encabezados Markdown, listas, código con sintaxis adecuada.

## 🧪 Pruebas y Validación

Para probar un agente:
1. Instálalo en un proyecto de prueba con `bash install.sh`.
2. En VS Code, abre Copilot Chat y menciona al agente (`@NombreAgente`).
3. Verifica que las respuestas sean coherentes con las instrucciones.

Puedes usar el script `validate_agents.py` (ver sección de herramientas) para validar la sintaxis del frontmatter.

## 🤝 Contribución

¡Las contribuciones son bienvenidas! Por favor lee [CONTRIBUTING.md](CONTRIBUTING.md) para detalles sobre cómo proponer mejoras, reportar problemas o agregar nuevos agentes.

## 🔐 Notas de Seguridad

- Los agentes no se sincronizan automáticamente con Settings Sync de VS Code
- Están atados al proyecto (carpeta `.github/agents/`)
- Usa Git para mantenerlos actualizados entre computadoras
- No incluyas información sensible en las definiciones de agentes

## 📚 Recursos

- [Documentación oficial de Agentes Personalizados](https://docs.github.com/en/copilot/customizing-copilot/creating-custom-agents)
- [Best Practices para Agentes](https://github.blog/changelog/2024-05-21-github-copilot-extensions-now-in-public-beta/)

---

**Última actualización**: Marzo 2026
