#!/bin/bash

# Load the properties file
source properties.sh

# Define the thresholds for CPU, memory, and disk usage
CPU_THRESHOLD=$CPU_THRESHOLD_PROP
MEM_THRESHOLD=$MEM_THRESHOLD_PROP
DISK_THRESHOLD=$DISK_THRESHOLD_PROP

# Get the current CPU, memory, and disk usage
CPU_USAGE=$(top -b -n 1 | grep "%Cpu(s)" | awk '{print $2}')
MEM_USAGE=$(free | awk 'NR==2{printf "%.2f", $3/$2*100}')
DISK_USAGE=$(df -h / | awk 'NR==2{printf "%s", "%p"}' | cut -d'%' -f1)

# Create a table of the metrics
echo "CPU Usage | Memory Usage | Disk Usage" > metrics.txt
echo "$CPU_USAGE% | $MEM_USAGE% | $DISK_USAGE%" >> metrics.txt

# Check if any of the metrics breach the threshold
if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
  echo "CPU usage is above threshold. Sending email notification..."
  mail -s "CPU usage is above threshold" $EMAIL_PROP < metrics.txt
fi

if (( $(echo "$MEM_USAGE > $MEM_THRESHOLD" | bc -l) )); then
  echo "Memory usage is above threshold. Sending email notification..."
  mail -s "Memory usage is above threshold" $EMAIL_PROP < metrics.txt
fi

if (( $(echo "$DISK_USAGE > $DISK_THRESHOLD" | bc -l) )); then
  echo "Disk usage is above threshold. Sending email notification..."
  mail -s "Disk usage is above threshold" $EMAIL_PROP < metrics.txt
fi
