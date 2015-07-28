#!/usr/bin/env bash
PORT='80'
IP='212.26.132.121'

clear && rake tmp:clear && rake log:clear && rackup  -o $IP -p $PORT config.ru
