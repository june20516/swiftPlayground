//
//  main.swift
//  UnitConvertor
//
//  Created by Jun ho Lee on 2018. 9. 11..
//  Copyright © 2018년 Bran. All rights reserved.
//

import Foundation




//값 입력 받기
func inputValue() -> String {
    let inputValue = readLine()!
    return inputValue
}

//숫자 값 추출
func extractNumeric(_ input: String) -> Double {
    var numericValue: Double = -1
    if let optionalNumeric =
        Double(input.components(separatedBy: CharacterSet(charactersIn: "01234567890.").inverted).joined(separator: "")) {
        numericValue = optionalNumeric
    }
    return numericValue
}

//단위 추출
func extractUnits(_ input: String) -> [String] {
    let units = input.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789.")).components(separatedBy: " ") //숫자를 제거한 배열
    return units
}

// 지원하지 않는 단위이면 -1 반환
func inputToMiddleValue(numericValue: Double, units: [String], constants: [String: Double]) -> (value: Double, unit: String) {
    if let constant = constants[units[0]] {
        return ((numericValue * constant),units[0])
    } else if let constant = constants[units[0]] {
        return ((numericValue * constant),units[0])
    }
        return (-1, "지원하지 않는 단위입니다.")
}


func middleValueToTargetValue(numericValue: Double, units: [String], constants: [String: Double]) -> Double {
    if constants.keys.contains(units[0]) {  // 다른 단위, 없는 단위 방어
        if let constant = constants[units[1]] {
            return (numericValue / constant)
        }
    }
    return -1
}

// 한가지 단위일 때 변환
func convertSingleUnit (_ middleValue: Double, fromUnit: String, constants: [String: Double]) -> (convertedValue: Double, convertedUnit: String) {
    switch fromUnit {
    case "m" :
        return (middleValue, "cm")
    case "cm" :
        return (middleValue / constants["m"]!, "m")
    case "yard" :
        return (middleValue / constants["m"]!, "m")
    case "g" :
        return (middleValue / constants["kg"]!, "kg")
    case "kg" :
        return (middleValue, "g")
    default :
        return (-1, "단위를 확인해주세요")
    }
}

func printResult (resultValue: Double, toUnit: String) {
    if resultValue == -1 {
        print("지원하지 않는 단위입니다")  // 단위가 잘못 됐을 때 출력됨
    } else {
        print("\(resultValue)\(toUnit)")
    }
}

func findConstant(units: [String]) -> [String: Double] {
    // fromUnit이 cm가 되기 위한 상수
    let constantsToCentimeter: [String: Double] = [
        "cm": 1,
        "m": 100,
        "inch": 2.54,
        "yard": 91.44
    ]
    // fromUnit이 g이 되기 위한 상수
    let constantsToGram: [String: Double] = [
        "g": 1,
        "kg": 1000,
        "oz": 28.349523,
        "lb": 453.59237
    ]
    if constantsToGram.keys.contains(units[0]) {
        return constantsToGram
    } else if constantsToCentimeter.keys.contains(units[0]) {
        return constantsToCentimeter
    } else {
        return ["단위를 확인하세요": -1]
    }
}

func excecuteConverting(_ input: String) -> (resultValue: Double, toUnit: String) {
    let numericValue = extractNumeric(input)
    let units = extractUnits(input)
    let categoryOfUnit = findConstant(units: units)
    let middleValue = inputToMiddleValue(numericValue: numericValue, units: units, constants: categoryOfUnit).value
    print("middleValue(cm,g) \(middleValue)\(units)")   // 확인용
    switch units.count {
    case 1:
        let singleUnitResults = convertSingleUnit(middleValue, fromUnit: units[0], constants: categoryOfUnit)
        let resultValue = singleUnitResults.convertedValue
        let toUnit = singleUnitResults.convertedUnit
        return (resultValue, toUnit)
    case 2:
        let resultValue = middleValueToTargetValue(numericValue: middleValue, units: units, constants: categoryOfUnit)
        let toUnit = units[1]
        return (resultValue, toUnit)
    default:
        return(-1, "단위를 확인해주세요")
    }
}

func main() {
    while true {
        let inputedValue = inputValue()
        if inputedValue == "q" || inputedValue == "quit" {
            print("종료합니다")
            return
        } else {
            let convertedResults = excecuteConverting(inputedValue)
            printResult(resultValue: convertedResults.resultValue, toUnit: convertedResults.toUnit)
        }
    }
}

main()
