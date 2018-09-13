//
//  main.swift
//  UnitConvertor
//
//  Created by Jun ho Lee on 2018. 9. 11..
//  Copyright © 2018년 Bran. All rights reserved.
//

import Foundation

let inputValue = readLine()!  //값 입력 받기

func extractNumeric(_ input: String) -> Double { //숫자 값 추출
    var numeric: Double = -1
    if let optionalNumeric =
        Double(input.components(separatedBy: CharacterSet(charactersIn: "01234567890.").inverted).joined(separator: "")) {
        numeric = optionalNumeric
    }
    return numeric
}

func extractUnits(_ input: String) -> (startUnit: String, endUnit: String) { //단위 추출
    var units: [String] = ["",""]
    let strUnits = input.components(separatedBy: CharacterSet(charactersIn: "0123456789.")).joined(separator: "") //숫자를 제거한 배열
    if strUnits.contains(" ") { //단위가 2개인 경우
        units = strUnits.components(separatedBy: " ") //공백으로 나눠 배열 저장
    } else {  //아닌경우
        units = [strUnits, ""]  //배열 크기 고정
    }
    return (units[0], units[1])
}

func convertCentimeterToMeter(_ numeric: Double) -> Double { // cm 값을 m 값으로 변환
    return numeric / 100
}

func convertCentimeterToInch(_ numeric: Double) -> Double { // cm 값을 inch 값으로 변환
    return numeric / 2.54
}

func convertMeterToCentimeter(_ numeric: Double) -> Double { // m 값을 cm 값으로 변환
    return numeric * 100
}

func convertMeterToInch(_ numeric: Double) -> Double { // m 값을 inch 값으로 변환
    return numeric / 0.0254
}

func convertInchToCentimeter(_ numeric: Double) -> Double { // inch 값을 cm 값으로 변환
    return numeric * 2.54
}

func convertInchToMeter(_ numeric: Double) -> Double { // inch 값을 mm 값으로 변환
    return numeric * 0.0254
}



func unitConvertor(_ input: String) -> String { // 단위에 따른 액션
    let numeric = extractNumeric(input)
    switch (extractUnits(input)) {
    case ("cm","inch") :
        return String(convertCentimeterToInch(numeric)) + extractUnits(input).endUnit
    case ("cm",_) :
        return String(convertCentimeterToMeter(numeric)) + "m"
    case ("m","inch") :
        return String(convertMeterToInch(numeric)) + extractUnits(input).endUnit
    case ("m",_) :
        return String(convertMeterToCentimeter(numeric)) + "cm"
    case ("inch","cm") :
        return String(convertInchToCentimeter(numeric)) + extractUnits(input).endUnit
    case ("inch","m") :
        return String(convertInchToMeter(numeric)) + extractUnits(input).endUnit
    default :
        return "지원하지 않는 단위입니다"
    }
}

print(unitConvertor(inputValue))

