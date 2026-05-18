#!/bin/bash
set -e

MC_VERSION="1.21.11"
FABRIC_LOADER="0.18.4"
FABRIC_INSTALLER="1.0.1"

INSTALLER_JAR="fabric-installer-${FABRIC_INSTALLER}.jar"
INSTALLER_URL="https://maven.fabricmc.net/net/fabricmc/fabric-installer/${FABRIC_INSTALLER}/${INSTALLER_JAR}"
SERVER_LAUNCH_JAR="fabric-server-launch.jar"

cd /server

# ── Download Fabric installer if not already present ──────────────────────────
if [ ! -f "$INSTALLER_JAR" ]; then
  echo "[start.sh] Downloading Fabric installer ${FABRIC_INSTALLER}..."
  curl -fsSL -o "$INSTALLER_JAR" "$INSTALLER_URL"
fi

# ── Run Fabric installer if the launch jar doesn't exist yet ──────────────────
if [ ! -f "$SERVER_LAUNCH_JAR" ]; then
  echo "[start.sh] Installing Fabric ${FABRIC_LOADER} for Minecraft ${MC_VERSION}..."
  java -jar "$INSTALLER_JAR" server \
    -mcversion "$MC_VERSION" \
    -loader "$FABRIC_LOADER" \
    -downloadMinecraft
fi

# ── Accept EULA automatically ─────────────────────────────────────────────────
echo "eula=true" > eula.txt

# ── Copy server.properties if it doesn't exist yet ───────────────────────────
if [ ! -f "server.properties" ]; then
  echo "[start.sh] No server.properties found — using default."
fi

# ── Create mods folder if missing ────────────────────────────────────────────
mkdir -p mods

# ── Launch the server ─────────────────────────────────────────────────────────
echo "[start.sh] Starting Fabric Minecraft ${MC_VERSION}..."
exec java $JAVA_OPTS -jar "$SERVER_LAUNCH_JAR" nogui
