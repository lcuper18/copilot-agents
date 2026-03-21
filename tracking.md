# Tracking: GitHub Copilot Agents - OpenCode Compatibility

## Objetivo
Hacer los agentes de GitHub Copilot compatibles con OpenCode manteniendo ambas fuentes.

## Estado: En Progreso

---

## Fase 1: Análisis y Documentación ✅

| Tarea | Estado | Notas |
|-------|--------|-------|
| Revisar estructura de `.agent.md` | ✅ Listo | Frontmatter YAML + prompt |
| Investigar formato OpenCode Agents | ✅ Listo | Markdown en `~/.config/opencode/agents/` |
| Crear mapeo de campos | ✅ Listo | `name`→archivo, `description`→description, `tools`→permissions |

## Fase 2: Conversión de Agentes ✅

| Agente | Estado | Archivo OpenCode |
|--------|--------|-----------------|
| ExpertSQL | ✅ Listo | `expert-sql.md` |
| CyberSecurity | ✅ Listo | `cyber-security.md` |
| ManagerProject | ✅ Listo | `manager-project.md` |
| QA | ✅ Listo | `qa.md` |
| Ventas_software | ✅ Listo | `ventas-software.md` |
| FrontendDev | ✅ Listo | `frontend-dev.md` |
| DevOps | ✅ Listo | `devops.md` |
| DataScience | ✅ Listo | `data-science.md` |

## Fase 3: Mapeo de Herramientas ✅

| GitHub Copilot | OpenCode |
|----------------|----------|
| `vscode` | `read`, `glob`, `grep`, `list` |
| `execute` | `bash` |
| `edit` | `edit`, `write` |
| `agent` | (Task tool) |
| `search` | `grep`, `glob` |
| `web` | `webfetch`, `websearch` |
| `todo` | `todowrite`, `todoread` |

## Fase 4: Script de Conversión Automática (Pendiente)

- [ ] Crear `convert_to_opencode.py` para conversión automatizada
- [ ] Manejar mapeo de herramientas
- [ ] Generar permisos apropiados por tipo de agente

## Fase 5: Validación y Pruebas (Pendiente)

- [ ] `opencode agent list` - verificar carga
- [ ] Probar cada agente con `opencode run --agent <nombre>`
- [ ] Validar que permisos funcionen correctamente

## Fase 6: Documentación (Pendiente)

- [ ] COMPATIBILITY.md - guía de uso dual
- [ ] README.md - actualizar con instrucciones OpenCode
- [ ] Ejemplos de uso

---

## Commits Realizados

| Fecha | Commit | Descripción |
|-------|--------|-------------|
| 2026-03-21 | `e111a71` | Mejoras iniciales: 5 agentes originales + fix duplicados |
| 2026-03-21 | `f2a8c34` | Conversión completa a OpenCode: 8 agentes + tracking.md |

---

## Archivos Creados (OpenCode)

Ubicación: `~/.config/opencode/agents/`

```
expert-sql.md      - SQL database expert
cyber-security.md  - Cybersecurity analysis
manager-project.md - Project management
qa.md              - Quality assurance
ventas-software.md - Software sales
frontend-dev.md    - Frontend development
devops.md          - DevOps & infrastructure
data-science.md    - Data science & ML
```

---

## Problemas Conocidos

1. GitHub Copilot usa `argument-hint` - no existe en OpenCode
2. Herramientas específicas de VS Code no tienen equivalente directo en OpenCode
3. Formato de `tools` es diferente (array vs object permissions)

---

## Próximos Pasos

1. [ ] Verificar que OpenCode cargue los agentes con `opencode agent list`
2. [ ] Probar un agente con `opencode run --agent expert-sql`
3. [ ] Ajustar permisos si es necesario
4. [ ] Crear script de conversión para actualizaciones futuras

---

*Última actualización: 2026-03-21*
