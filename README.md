# Ghost Admin Finder

## Description:
Ghost Admin Finder is designed to quickly and simply locate admin login panels on a website.

## Installation:
Copy and paste the following commands in Termux to install the required dependencies and clone the repository:

```bash
pkg update -y && pkg upgrade -y && apt update -y && apt upgrade -y && pkg install bash curl git -y && git clone https://github.com/X-Shir0/GhostAdminFinder
cd GhostAdminFinder && chmod +x ghost.sh && ./ghost.sh domainname.com
