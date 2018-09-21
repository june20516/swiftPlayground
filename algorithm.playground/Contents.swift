//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    var results = Array<Int>.init()
    for number in arr{
        if number % divisor == 0 {
            results.append(number)
        }
    }
    if results.isEmpty { results.append(-1) }
    let sortedResults = results.sorted {
        switch ($0, $1) {
        case let (a, b):
            return a < b
        }
    }
    return sortedResults
}

var num = [36,4,5,7,8,20,22]
solution(num, 4)

num.sorted()
