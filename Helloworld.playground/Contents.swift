//: Playground - noun: a place where people can play

import Cocoa

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


func convertSingleUnit (_ middleValue: Double, fromUnit: String, constants: [String: Double]) -> String {
    print(constants)
    var singleUnitResult: String = " convertedAll "
    if constants.keys.contains(fromUnit) {
        for (unit, constant) in constants {
            singleUnitResult = "\n\(middleValue * constant)\(unit)"
            print(singleUnitResult)
        }
        return singleUnitResult
        
    }
    return "단위를 확인해주세요"
}


let test = convertSingleUnit(200, fromUnit: "inch", constants: findConstant(units: ["m","cm"]))

print(test)

//
//let testDic: [String: Int] = [
//    "one": 1,
//    "two": 2,
//    "three": 3,
//    "four": 4,
//    "five": 5
//]
//
//for (text, number) in testDic {
//    print("\(text)번째: \(number) 곱하기 2 는 \(number*2)")
//}
