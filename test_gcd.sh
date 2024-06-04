#!/bin/bash

# 最大公約数スクリプトのテスト関数
test_gcd() {
    local result
    result=$(./gcd.sh $1 $2 2>/dev/null)
    if [ "$result" -eq "$3" ]; then
        echo "Test passed: gcd($1, $2) == $3"
    else
        echo "Test failed: gcd($1, $2) == $result, expected $3"
        exit 1
    fi
}

# 正常テストケース
test_gcd 2 4 2
test_gcd 10 15 5
test_gcd 100 25 25

# 異常テストケース
# 引数が1つの場合
if ./gcd.sh 3 > /dev/null 2>&1; then
    echo "Test failed: expected error for single argument"
    exit 1
else
    echo "Test passed: single argument test"
fi

# 引数が文字の場合
if ./gcd.sh 10 "abc" > /dev/null 2>&1; then
    echo "Test failed: expected error for non-numeric argument"
    exit 1
else
    echo "Test passed: non-numeric argument test"
fi

# 引数が負の数の場合
if ./gcd.sh -10 5 > /dev/null 2>&1; then
    echo "Test failed: expected error for negative number"
    exit 1
else
    echo "Test passed: negative number test"
fi

# 引数が小数の場合
if ./gcd.sh 10 5.5 > /dev/null 2>&1; then
    echo "Test failed: expected error for decimal number"
    exit 1
else
    echo "Test passed: decimal number test"
fi

# 引数が多すぎる場合
if ./gcd.sh 10 5 3 > /dev/null 2>&1; then
    echo "Test failed: expected error for too many arguments"
    exit 1
else
    echo "Test passed: too many arguments test"
fi

echo "All tests passed."

