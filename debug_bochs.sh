#!/bin/bash
# Start Bochs in background
bochs -f bochsrc.txt -q &
BOCHS_PID=$!

# Wait for initialization
sleep 2

# Force break into debugger
kill -INT $BOCHS_PID

# Keep terminal attached
wait $BOCHS_PID
