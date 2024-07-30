#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status

# Source necessary functions and setup environment variables
source /app/BP-BASE-SHELL-STEPS/functions.sh
source /app/BP-BASE-SHELL-STEPS/log-functions.sh

CODEBASE_LOCATION="${WORKSPACE}/${CODEBASE_DIR}"

# Log a message indicating the start of the script
logInfoMessage "Starting build process for code located at [$CODEBASE_LOCATION]"

# Print current working directory (optional, for debugging purposes)
pwd

# Change directory to the location of your codebase
logInfoMessage "Changing directory to [$CODEBASE_LOCATION]"
cd "${CODEBASE_LOCATION}"

# Install dependencies if needed
logInfoMessage "Installing dependencies using $PACKAGE_MANAGER"
$PACKAGE_MANAGER $INSTRUCTION

# Run build command
logInfoMessage "Running build command"
$BUILD_COMMAND

# Run clean command
logInfoMessage "Running clean command"
$CLEAN_COMMAND

# Run start command
logInfoMessage "Running start command"
$START_COMMAND

# Capture the task status
TASK_STATUS=$?

# Save task status
logInfoMessage "Saving task status: $TASK_STATUS"
saveTaskStatus $TASK_STATUS $ACTIVITY_SUB_TASK_CODE
