# 🚀 Guía de Inicio Rápido

## 1️⃣ Subir a GitHub (primera vez)

### Crear repositorio en GitHub
1. Ve a https://github.com/new
2. Nombre: `copilot-agents`
3. Descripción: `Mis agentes personalizados de GitHub Copilot`
4. Privado o Público (según prefieras)
5. **NO** inicializar con README (ya lo tenemos)
6. Crear repositorio

### Conectar y subir
```bash
cd ~/my-copilot-agents
git remote add origin git@github.com:TU_USUARIO/copilot-agents.git
# O si usas HTTPS:
# git remote add origin https://github.com/TU_USUARIO/copilot-agents.git

git push -u origin main
```

## 2️⃣ En tu otra computadora

### Clonar el repositorio
```bash
git clone git@github.com:TU_USUARIO/copilot-agents.git ~/my-copilot-agents
# O si usas HTTPS:
# git clone https://github.com/TU_USUARIO/copilot-agents.git ~/my-copilot-agents
```

### Usar en un proyecto
```bash
cd /ruta/de/tu/proyecto
bash ~/my-copilot-agents/install.sh
```

## 3️⃣ Actualizar cambios

### Cuando modificas un agente
```bash
cd ~/my-copilot-agents
git add .
git commit -m "Actualizar agente X"
git push
```

### Obtener cambios en la otra computadora
```bash
cd ~/my-copilot-agents
git pull
```

### Actualizar agentes en proyectos existentes
```bash
cd /ruta/de/tu/proyecto
bash ~/my-copilot-agents/install.sh
```

## 4️⃣ Alternativa: Usar directamente Git en cada proyecto

Si prefieres que los agentes sean parte del repositorio de cada proyecto:

```bash
cd /ruta/de/tu/proyecto

# Copiar agentes del template
mkdir -p .github/agents
cp ~/my-copilot-agents/.github/agents/*.md .github/agents/

# Agregar al control de versiones del proyecto
git add .github/agents/
git commit -m "Add custom Copilot agents"
git push
```

Luego en la otra computadora simplemente:
```bash
git pull
```

## 💡 Recomendación

- **Repositorio de plantillas** (`~/my-copilot-agents`): Para mantener tus agentes actualizados y reutilizables
- **Git del proyecto**: Si quieres que todo el equipo use los mismos agentes
- **Ambos**: Mantén el repositorio de plantillas y copia a proyectos específicos según necesites

## 🔄 Flujo de trabajo recomendado

1. Edita agentes en `~/my-copilot-agents/.github/agents/`
2. Prueba en un proyecto: `bash ~/my-copilot-agents/install.sh`
3. Si funciona, commit y push:
   ```bash
   cd ~/my-copilot-agents
   git add .
   git commit -m "Mejora agente X"
   git push
   ```
4. En la otra computadora:
   ```bash
   cd ~/my-copilot-agents
   git pull
   ```
5. Actualiza proyectos que lo necesiten:
   ```bash
   cd /proyecto
   bash ~/my-copilot-agents/install.sh
   ```
