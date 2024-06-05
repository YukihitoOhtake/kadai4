#!/bin/bash

# エラートラッキング用の変数
errors=()

# 最大公約数スクリプトのテスト関数
test_gcd() {
    local test_num=$1
    local num1=$2
    local num2=$3
    local expected=$4
    local result
    result=$(./gcd.sh "$num1" "$num2" 2>/dev/null)
    if [ "$result" -eq "$expected" ]; then
        echo "テスト${test_num}成功: gcd($num1, $num2) == $expected"
    else
        echo "テスト${test_num}失敗: gcd($num1, $num2) == $result, 期待される結果は $expected"
        errors+=("テスト${test_num}")
    fi
}

test_error() {
    local test_num=$1
    local command=$2
    local description=$3
    if $command > /dev/null 2>&1; then
        echo "テスト${test_num}失敗: ${description} に対してエラーが発生するはずです"
        errors+=("テスト${test_num}")
    else
        echo "テスト${test_num}成功: ${description} のテストが通りました"
    fi
}

# 正常テストケース
test_gcd 1 2 4 2
test_gcd 2 10 15 5
test_gcd 3 100 25 25
test_gcd 4 21 14 7
test_gcd 5 54 24 6
test_gcd 6 81 27 27

# 異常テストケース
test_error 7 "./gcd.sh 3" "引数が1つの場合"
test_error 8 "./gcd.sh 10 abc" "引数が文字の場合"
test_error 9 "./gcd.sh -10 5" "引数が負の数の場合 (-10, 5)"
test_error 10 "./gcd.sh 10 -5" "引数が負の数の場合 (10, -5)"
test_error 11 "./gcd.sh 10 5.5" "引数が小数の場合 (10, 5.5)"
test_error 12 "./gcd.sh 5.5 10" "引数が小数の場合 (5.5, 10)"
test_error 13 "./gcd.sh 10 5 3" "引数が多すぎる場合 (10, 5, 3)"

# 結果の表示
if [ ${#errors[@]} -eq 0 ]; then
    echo "すべてのテストが成功しました。"
else
    echo "以下のテストでエラーが発生しました:"
    for error in "${errors[@]}"; do
        echo "$error"
    done
    exit 1
fi
