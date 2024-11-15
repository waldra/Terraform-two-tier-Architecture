#!/bin/bash

apt update && apt install -y nginx

systemctl enable nginx
systemctl start nginx

