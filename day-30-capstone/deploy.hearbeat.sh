#!/bin/bash

# Day 30 Capstone: Full deployment script
# Deploys an updated heartbeat.sh to a remote server, restarts the service,
# verifies health, and logs the entire run.

REMOTE_HOST="ec2test"
REMOTE_SCRIPT_PATH="/usr/local/bin/heartbeat.sh"
LOCAL_SCRIPT="./heartbeat_v2.sh"
LOG_FILE="./deploy_log.txt"

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

log "=== Starting deployment ==="

# Create an updated version of the heartbeat script locally
cat << 'HEARTBEAT_EOF' > "$LOCAL_SCRIPT"
#!/bin/bash
echo "Heartbeat v2 running at $(date) - deployed via capstone script"
HEARTBEAT_EOF
chmod +x "$LOCAL_SCRIPT"
log "Created updated local script: $LOCAL_SCRIPT"

# Deploy the file via scp
log "Deploying $LOCAL_SCRIPT to $REMOTE_HOST:$REMOTE_SCRIPT_PATH"
scp "$LOCAL_SCRIPT" "$REMOTE_HOST":/tmp/heartbeat_v2.sh
if [ $? -eq 0 ]; then
    log "File transfer succeeded."
else
    log "File transfer FAILED. Aborting."
    exit 1
fi

# Move file into place with correct ownership and permissions, then restart the service
log "Applying correct ownership and permissions, then restarting service..."
ssh "$REMOTE_HOST" bash -s << 'REMOTE_EOF'
sudo mv /tmp/heartbeat_v2.sh /usr/local/bin/heartbeat.sh
sudo chown root:root /usr/local/bin/heartbeat.sh
sudo chmod 755 /usr/local/bin/heartbeat.sh
sudo systemctl restart heartbeat
REMOTE_EOF

if [ $? -eq 0 ]; then
    log "Remote deployment commands executed successfully."
else
    log "Remote deployment commands FAILED."
    exit 1
fi

# Verify health using systemctl and journalctl
log "Verifying service health..."
ssh "$REMOTE_HOST" "systemctl is-active heartbeat" | tee -a "$LOG_FILE"
ssh "$REMOTE_HOST" "sudo journalctl -u heartbeat --since '1 minute ago' --no-pager" | tee -a "$LOG_FILE"

log "=== Deployment complete ==="
