#!/usr/bin/env bash
# Simple Interest Calculator

read -r -p "Enter principal amount: " principal
read -r -p "Enter annual rate of interest (%): " rate
read -r -p "Enter time period (years): " time

if ! [[ "$principal" =~ ^[0-9]+([.][0-9]+)?$ ]] ||    ! [[ "$rate" =~ ^[0-9]+([.][0-9]+)?$ ]] ||    ! [[ "$time" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
  echo "Error: enter valid non-negative numbers."
  exit 1
fi

si=$(awk -v p="$principal" -v r="$rate" -v t="$time" 'BEGIN {printf "%.2f",(p*r*t)/100}')
total=$(awk -v p="$principal" -v s="$si" 'BEGIN {printf "%.2f",p+s}')

echo "Simple Interest: $si"
echo "Total Amount: $total"
