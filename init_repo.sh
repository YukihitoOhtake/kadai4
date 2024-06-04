#!/bin/bash

# 変数設定
REPO_NAME="kadai4"
GITHUB_USER="YOUR_GITHUB_USERNAME"
GITHUB_EMAIL="your_email@example.com"
REMOTE_REPO="git@github.com:$GITHUB_USER/$REPO_NAME.git"

# Gitの設定
git config --global user.name "$GITHUB_USER"
git config --global user.email "$GITHUB_EMAIL"

# リポジトリの初期化
mkdir -p ~/$REPO_NAME
cd ~/$REPO_NAME
git init
git remote add origin $REMOTE_REPO

# .gitignoreファイルの作成（任意）
echo ".DS_Store" >> .gitignore
echo "*.log" >> .gitignore
echo "node_modules" >> .gitignore

# 初期コミット
git add .
git commit -m "Initial commit"
