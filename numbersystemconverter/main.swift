//
//  main.swift
//  numbersystemconverter
//
//  Created by Yining Wang on 2021-01-26.
//

import Foundation

print("Hello, World!")

//Input
print("What number system do you want to convert from")
print("B: Binary")
print("O: Octal")
print("D: Decimal")
print("H: Hexadecimal")
print("Enter your choice (B/O/ /D/H):", terminator: "")//keep following output on the same line

let from = readLine()!


print("What number do you want to convert from")
let value = readLine()!

print("What number do you want to convert to")
print("B: Binary")
print("O: Octal")
print("D: Decimal")
print("H: Hexadecimal")
print("Enter your choice (B/O/ /D/H):", terminator: "")

let to = readLine()!

func decimalequivalent(value:String, base:Double) -> Double {
    var exponent = 0.0
    var result = 0.0
    
    for character in value.reversed() {
        switch character{
        case "A":
            result += 10 * pow(base, exponent)
        case "B":
            result += 11 * pow(base, exponent)
        case "C":
            result += 12 * pow(base, exponent)
        case "D":
            result += 13 * pow(base, exponent)
        case "E":
            result += 14 * pow(base, exponent)
        case "F":
            result += 15 * pow(base, exponent)
        case "G":
            result += 16 * pow(base, exponent)
        default:
            let digit = Double(String(character))!
            result += digit * pow(base, exponent)
        }
        exponent += 1
    }
    return result
}
    
//Process

var b = 0.0
switch from {
case "B":
    b = 2.0
case "O":
    b = 8.0
case "D":
    b = 10.0
case "H":
    b = 16.0
default:
    break
}

let result = decimalequivalent(value: value, base: b )
//Output




enum NumberSystemBase: Int {
    case binary = 2
    case octal = 8
    case hexadeciml = 16
    case decimal = 10
}


func getRepresentation(of valueToConvert: Int, inBase base: NumberSystemBase) -> String {
    var decimalValueLeftToConvert = valueToConvert
    var representation = ""
    while decimalValueLeftToConvert > 0 {
        let nextDigit = decimalValueLeftToConvert % base.rawValue
        if base == .hexadeciml {
            switch nextDigit {
            case 0...9:
                representation = String(nextDigit) + representation
            case 10:
                representation = "A" + representation
            case 11:
                representation = "B" + representation
            case 12:
                representation = "C" + representation
            case 13:
                representation = "D" + representation
            case 14:
                representation = "E" + representation
            case 15:
                representation = "F" + representation
            default:
                break
            }
        } else {
            representation = String(nextDigit) + representation
        }
        decimalValueLeftToConvert = decimalValueLeftToConvert / base.rawValue

    }
    
    return representation
}

