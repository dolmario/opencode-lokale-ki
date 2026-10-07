# Opencode local-client practice

This companion currently supports the German tutorial. The complete step-by-step guide is [DE/START.md](../DE/START.md). The exercise prompt and JSON field contract are in English and can be used with your existing local client.

1. Unzip into a new practice directory and read VORBEREITEN-UEBUNG.ps1. Run it with -OutputDirectory ./my-first-agent-test. It only copies synthetic inputs, prompt, schema, checker and blank review sheet; no agent, server, model or download is started.
2. Inspect your existing local-provider configuration and the official references. Model ID, endpoint and actual context limits must match. Preserve other providers and permissions. A directory alone is not a sandbox. OpenCode uses built-in Build/Plan; the archived q4-orchestrator is custom. Its local provider SDK may need installation if missing, which this kit does not perform.
3. Start the existing client from the isolated practice directory: opencode . --agent build. Ask it to read AUFTRAG.md and ERGEBNIS-SCHEMA.json and create only ERGEBNIS.json. The new task needs no children, network or system changes.
4. Run ./PRUEFEN-ERGEBNIS.ps1 -ResultPath ./ERGEBNIS.json manually after inspecting it. Exit 0 checks this limited file contract; exit 1 reports errors. It starts no model and changes no answer.
5. This NEW exercise explicitly requires floor(131072 / 3)=43690 integer tokens and queue order beta, gamma, alpha, with exact used and ignored source IDs. These are synthetic inputs, not today's server measurements.
6. ARCHIV preserves the author's actual synthetic 2026-09-19 outputs. OpenCode returned 43690 and Hermes returned an unrounded 43690.666666666664. Their old schemas differ from the new explicit integer contract. Recorded child counts are not independently replayed proof. No fresh client installation or agent-answer run is claimed.
7. Record your actual run in ABNAHME.csv. A file hash preserves bytes, not truth or universal agent quality. Other AMD systems, WSL networking and Mac operation were not freshly tested here.
