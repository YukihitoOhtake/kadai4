#!/bin/bash

# 最大公約数を計算する関数
gcd() {
    a=$1
    b=$2
    while [ $b -ne 0 ]; do
        temp=$b
        b=$((a % b))
        a=$temp
    done
    echo $a
}

# 引数の数を確認
if [ $# -ne 2 ]; then
    echo "使い方: $0 数字1 数字2"
    exit 1
fi

# 引数が自然数かどうかを確認
if ! [[ $1 =~ ^[1-9][0-9]*$ ]] || ! [[ $2 =~ ^[1-9][0-9]*$ ]]; then
    echo "エラー: 引数は両方とも正の整数を入力してください。"
    exit 1
fi

# 最大公約数を計算
gcd $1 $2
