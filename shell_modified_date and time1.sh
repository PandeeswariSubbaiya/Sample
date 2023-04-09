#!/bin/bash

usage() {
  echo "Usage: $0 [-d days] [-f from_date] [-t to_date]"
  echo "Date format: YYYY-MM-DD"
  exit 1
}

while getopts ":d:f:t:" opt; do
  case $opt in
    d)
      days="$OPTARG"
      ;;
    f)
      from_date="$OPTARG"
      ;;
    t)
      to_date="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      usage
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      usage
      ;;
  esac
done

if [ -z "$days" ] && [ -z "$from_date" ] && [ -z "$to_date" ]; then
  usage
fi

if [ ! -z "$days" ] && [ ! -z "$from_date" ] && [ ! -z "$to_date" ]; then
  echo "You can only provide either days or from_date and to_date"
  usage
fi

if [ ! -z "$from_date" ] && [ -z "$to_date" ]; then
  echo "Both from_date and to_date are required"
  usage
fi

if [ ! -z "$to_date" ] && [ -z "$from_date" ]; then
  echo "Both from_date and to_date are required"
  usage
fi

if [ ! -z "$days" ]; then
  find . -type f -mtime -$days -printf "%p %s bytes\n"
fi

if [ ! -z "$from_date" ] && [ ! -z "$to_date" ]; then
  find . -type f -newermt "$from_date" ! -newermt "$to_date" -printf "%p %s bytes\n"
fi
