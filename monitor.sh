#!/bin/bash

# Monitor CPU

cpu_usage=$( top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}' )

echo "CPU Usage: $cpu_usage%"


# Monitor RAM

mem_total=$( grep MemTotal /proc/meminfo | awk '{print $2}' )

# meminfo file contain current memory usage on your system, along with some other information about your memory
# MemTotal is the total usable memory in your system

mem_available=$( grep MemAvailable /proc/meminfo | awk '{print $2}' )

# Mem Available is the amount of memory not being used by your system at all

mem_used=$(( mem_total - mem_available ))

echo "Ram Usage: $(( mem_used / 1024 ))MB / $(( mem_total / 1024 ))MB"


# Monitor Disk Space

disk_usage=$( df -h / | awk 'NR==2 {print $4 " available out of " $2}' )

echo "Disk Space: $disk_usage"


# System Uptime

uptime_info=$(uptime -p)

echo "System Uptime: $uptime_info"
