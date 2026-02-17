# Bash Network Security Testing Lab

## Overview

This project is a small **network security testing lab** built with Bash scripts and a simple Python HTTP server.  
The purpose is to practice **server monitoring, connection testing, and basic security testing** in a controlled environment.  

The lab currently includes:

1. **Configuration file (`config.sh`)** – centralizes server IP, port, log folder, and timestamp format.  
2. **Connection test (`check_connection.sh`)** – checks if the server is reachable and logs HTTP status.  
3. **Header injection test (`security_test.sh`)** – simulates sending malicious headers to see if the server handles them safely.
