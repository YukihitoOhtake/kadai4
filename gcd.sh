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
    echo "Usage: $0 num1 num2"
    exit 1
fi

# 引数が自然数かどうかを確認
if ! [[ $1 =~ ^[0-9]+$ ]] || ! [[ $2 =~ ^[0-9]+$ ]]; then
    echo "Error: Both arguments must be natural numbers."
    exit 1
fi

# 最大公約数を計算
gcd $1 $2
