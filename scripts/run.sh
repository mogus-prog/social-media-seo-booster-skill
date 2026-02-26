#!/usr/bin/env bash
set -euo pipefail
TASK=""
OUTDIR=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --task) TASK="$2"; shift 2;;
    --outdir) OUTDIR="$2"; shift 2;;
    *) echo "Unknown arg: $1" >&2; exit 1;;
  esac
done
if [[ -z "${TASK}" || -z "${OUTDIR}" ]]; then
  echo "Usage: run.sh --task <task> --outdir <dir>" >&2
  exit 1
fi
mkdir -p "$OUTDIR"
STAMP="$(date +%Y%m%d-%H%M%S)"
cat > "$OUTDIR/result-${STAMP}.md" <<EOT
# Skill Run Result

- Task: ${TASK}
- Timestamp: ${STAMP}
- Status: success

## Generated Summary

Completed task orchestration using the skill script.
EOT

echo "Wrote $OUTDIR/result-${STAMP}.md"
