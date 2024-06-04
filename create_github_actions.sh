#!/bin/bash

# GitHub Actions設定ファイルの作成
mkdir -p ~/kadai4/.github/workflows
cat << 'EOF' > ~/kadai4/.github/workflows/ci.yml
name: CI

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2

    - name: Set up SSH
      run: sudo apt-get update && sudo apt-get install -y openssh-client

    - name: Make gcd.sh executable
      run: chmod +x gcd.sh

    - name: Make test_gcd.sh executable
      run: chmod +x test_gcd.sh

    - name: Run tests
      run: ./test_gcd.sh
EOF
