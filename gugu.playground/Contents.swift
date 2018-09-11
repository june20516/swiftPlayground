//: Playground - noun: a place where people can play

import Cocoa

//2,3단 - 계산 후 출력
print("2단")
print("2 × 2 = \(2*2)")
print("2 × 3 = \(2*3)")
print("2 × 4 = \(2*4)")
print("2 × 5 = \(2*5)")
print("2 × 6 = \(2*6)")
print("2 × 7 = \(2*7)")
print("2 × 8 = \(2*8)")
print("2 × 9 = \(2*9)")

print("3단")
print("3 × 2 = \(3*2)")
print("3 × 3 = \(3*3)")
print("3 × 4 = \(3*4)")
print("3 × 5 = \(3*5)")
print("3 × 6 = \(3*6)")
print("3 × 7 = \(3*7)")
print("3 × 8 = \(3*8)")
print("3 × 9 = \(3*9)")


//4,5단 - 변수 사용
var a: Int = 4

print("\(a)단")
var b = a * 1
print("\(a) × 1 = \(b)")
b = a * 2
print("\(a) × 2 = \(b)")
b = a * 3
print("\(a) × 3 = \(b)")
b = a * 4
print("\(a) × 4 = \(b)")
b = a * 5
print("\(a) × 5 = \(b)")
b = a * 6
print("\(a) × 6 = \(b)")
b = a * 7
print("\(a) × 7 = \(b)")
b = a * 8
print("\(a) × 8 = \(b)")
b = a * 9
print("\(a) × 9 = \(b)")

a = 5
print("\(a)단")
b = a * 1
print("\(a) × 1 = \(b)")
b = a * 2
print("\(a) × 2 = \(b)")
b = a * 3
print("\(a) × 3 = \(b)")
b = a * 4
print("\(a) × 4 = \(b)")
b = a * 5
print("\(a) × 5 = \(b)")
b = a * 6
print("\(a) × 6 = \(b)")
b = a * 7
print("\(a) × 7 = \(b)")
b = a * 8
print("\(a) × 8 = \(b)")
b = a * 9
print("\(a) × 9 = \(b)")


// 6,7단 - 반복문 사용
a = 6
print("\(a)단")
var i = 1
while ( i < 10) {
    print("\(a) × \(i) = \(a*i)")
    i += 1
}

a = 7
print("\(a)단")
for j in 1..<10 {
    print("\(a) × \(j) = \(a*j)")
}


//// 8,9단 - 조건문, 이중반복문 사용
//for k in 2..<10 {
//    print("\(k)단")
//    for l in 1..<10 {
//        print("\(k) × \(l) = \(k*l)")
//    }
//}
//
for k in 2..<10 {
    if (k%2 == 1){
        print("\(k)단")
        for l in 1..<10 {
            print("\(k) × \(l) = \(k*l)")
        }
    }
}
