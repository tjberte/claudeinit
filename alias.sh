claude_with_log() {
    local timestamp=$(date +"%Y%m%d_%H%M%S")
    local log_dir="$(pwd)/.claude_logs"
    mkdir -p "$log_dir"
    local log_file="${log_dir}/session_${timestamp}.md"

    cat > "$log_file" << EOF
# Claude Session Log
**Date:** $(date +"%Y-%m-%d %H:%M:%S")
**Directory:** $(pwd)
**User:** $USER

---

EOF

    echo "Starting Claude session..."
    echo "Log: $log_file"
    echo "───────────────────────────────────────────────────────────────────────"

    script -q -c "~/.local/bin/claude" "$log_file"

    echo -e "\n---\n**Session ended:** $(date +"%Y-%m-%d %H:%M:%S")" >> "$log_file"

    echo "───────────────────────────────────────────────────────────────────────"
    echo "Session ended. Log saved to: $log_file"
}

alias c='claude_with_log'
