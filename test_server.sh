#!/bin/bash
source /ros_entrypoint.sh
roscore &
python3 /app/test_server.py
