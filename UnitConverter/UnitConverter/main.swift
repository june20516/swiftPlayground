//
//  main.swift
//  UnitConverter
//
//  Created by Jun ho Lee on 2018. 9. 11..
//  Copyright © 2018년 Bran. All rights reserved.
//

import Foundation

//print("Hello, World!")
//
//
//let cm: Int = 120
//let m: Double = Double(cm) * 0.01
//print("\(m)m")
//
//
//let kg: Double = 0.27
//let g: Int = Int(kg * 1000)
//print("\(g)g")
//
//

let cmConst:Int = 100

var heightCm: Int = 177
var heightM: Float = Float(heightCm) / Float(cmConst)

print(heightM)


// 입력값에서 단위 확인하여 변환
let cmWidth: String = "2500cm"
let mWidth: String = "25m"
func meterConverter(width: String) -> String {
    let unit = (width.components(separatedBy: CharacterSet.decimalDigits)).joined(separator: "") //단위 추출
    var value = Double(width.trimmingCharacters(in: CharacterSet(charactersIn: "01234567890.").inverted))! //값 추출
    var answer = "" //결과값
    switch unit { // 단위에 따른 액션
    case "cm" :
        value = value / 100
        answer = "\(value)m"
    case "m" :
        value = value * 100
        answer = "\(value)cm"
    default :
        answer = "단위를 확인해주세요"
    }
    return answer
}

print(meterConverter(width: cmWidth))
print(meterConverter(width: mWidth))
