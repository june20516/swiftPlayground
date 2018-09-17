//
//  main.swift
//  UnitConvertor
//
//  Created by Jun ho Lee on 2018. 9. 11..
//  Copyright © 2018년 Bran. All rights reserved.
//

import Foundation


let constantToCentimeter: [String: Double] = [  // fromUnit이 cm가 되기 위한 상수
    "cm": 1,
    "m": 100,
    "inch": 2.54,
    "yard": 91.44
]

func inputValue() -> String {
    let inputValue = readLine()!  //값 입력 받기
    return inputValue
}

func extractNumeric(_ input: String) -> Double { //숫자 값 추출
    var numericValue: Double = -1
    if let optionalNumeric =
        Double(input.components(separatedBy: CharacterSet(charactersIn: "01234567890.").inverted).joined(separator: "")) {
        numericValue = optionalNumeric
    }
    return numericValue
}

func extractUnits(_ input: String) -> [String] { //단위 추출
    let units = input.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789.")).components(separatedBy: " ") //숫자를 제거한 배열
    return units
}

func inputToCentimeter(numericValue: Double, units: [String]) -> Double {  // 지원하지 않는 단위이면 -1 반환
    guard let constant = constantToCentimeter[units[0]] else {
        return -1
    }
    return (numericValue * constant)
}


func cmToTarget(numericValue: Double, units: [String]) -> Double {
    guard let constant = constantToCentimeter[units[1]] else {
        return -1
    }
    return (numericValue / constant)
}


func convertSingleUnit (_ middleValue: Double, fromUnit: String) -> (convertedValue: Double, convertedUnit: String) {
    switch fromUnit {
    case "m" :
        return (middleValue, "cm")
    case "cm" :
        return (middleValue / constantToCentimeter["m"]!, "m")
    case "yard" :
        return (middleValue / constantToCentimeter["m"]!, "m")
    default :
        return (0, "단위를 확인해주세요")
    }
}


func printResult (resultValue: Double, toUnit: String) {
    print("\(resultValue)\(toUnit)")
}

func excecuteConverting(_ input: String) {
    let inputedValue = input
    let numericValue = extractNumeric(inputedValue)
    let units = extractUnits(inputedValue)
    let middleValue = inputToCentimeter(numericValue: numericValue, units: units)
    print("middleValue \(middleValue)cm")
    if units.count == 2 {
        let resultValue = cmToTarget(numericValue: middleValue, units: units)
        let toUnit = units[1]
        printResult(resultValue: resultValue, toUnit: toUnit)
    } else {
        let singleResultValue = convertSingleUnit(middleValue, fromUnit: units[0])
        printResult(resultValue: singleResultValue.convertedValue, toUnit: singleResultValue.convertedUnit)
    }
}


func main() {
    while true {
        let inputedValue = inputValue()
        if inputedValue == "q" || inputedValue == "quit" {
            print("종료합니다")
            return
        } else {
            excecuteConverting(inputedValue)
        }
    }
}

main()

