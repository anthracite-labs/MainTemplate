#!/usr/bin/env bash
# Human-in-the-loop reproduction loop.
# Copy this file beside a debugging artifact, edit the steps below, and run it.
# The agent runs the script; the human follows prompts in their terminal.
#
# Usage:
#   bash hitl-loop.template.sh
#
# Two helpers:
#   step "<instruction>"          → show instruction, wait for Enter
#   capture VAR "<question>"      → show question, read response into VAR
#
# At the end, captured values are printed as KEY=VALUE for the agent to parse.
# Capture observations only; leave signing in or other sensitive action as a
# `step`, never as a captured credential. Redact secrets before reporting output.

set -euo pipefail

step() {
  printf '\n>>> %s\n' "$1"
  read -r -p "    [Enter when done] " _
}

capture() {
  local var="$1" question="$2" answer
  printf '\n>>> %s\n' "$question"
  read -r -p "    > " answer
  printf -v "$var" '%s' "$answer"
}

# --- edit below ---------------------------------------------------------

step "Open the local application and sign in if required."

capture ERRORED "Perform the failing action. Did the exact symptom occur? (y/n)"

capture OBSERVATION "Paste the redacted error, wrong output, or timing observation:"

# --- edit above ---------------------------------------------------------

printf '\n--- Captured ---\n'
printf 'ERRORED=%s\n' "$ERRORED"
printf 'OBSERVATION=%s\n' "$OBSERVATION"
