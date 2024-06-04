#!/bin/bash

# 最大公約数スクリプトのテスト関数
test_gcd() {
    local result
    result=$(./gcd.sh $1 $2)
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
if ./gcd.sh 3 > /dev/null 2>&1; then
    echo "Test failed: expected error for single argument"
    exit 1
fi

if ./gcd.sh 10 "abc" > /dev/null 2>&1; then
    echo "Test failed: expected error for non-numeric argument"
    exit 1
fi

echo "All tests passed."
