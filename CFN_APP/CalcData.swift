//
//  CalcData.swift
//  CFN_APP
//
//  Created by Mathias Ooi on 7/5/20.
//  Copyright © 2020 Mathias Ooi. All rights reserved.
//

import Foundation
import Darwin

class Expression{
    func eval() -> Double{
        return 0.0
    }
}

class Number: Expression {
    var value: Double
    init(_ num: Double) {
        self.value = num
    }
    override func eval() -> Double {
        return self.value
    }
}

class Addition: Expression{
    var a: Expression
    var b: Expression
    init(_ a: Expression, _ b: Expression){
        self.a = a
        self.b = b
    }
    override func eval() -> Double {
        return self.a.eval() + self.b.eval()
    }
}

class Subtraction: Expression{
    var a: Expression
    var b: Expression
    init(_ a: Expression, _ b: Expression){
        self.a = a
        self.b = b
    }
    override func eval() -> Double {
        return self.a.eval() - self.b.eval()
    }
}

class Multiplication: Expression{
    var a: Expression
    var b: Expression
    init(_ a: Expression, _ b: Expression){
        self.a = a
        self.b = b
    }
    override func eval() -> Double {
        return self.a.eval() * self.b.eval()
    }
}

class Division: Expression{
    var a: Expression
    var b: Expression
    init(_ a: Expression, _ b: Expression){
        self.a = a
        self.b = b
    }
    override func eval() -> Double {
        return self.a.eval() / self.b.eval()
    }
}


func parseArray(_ array: [String]) -> Expression{
    // Follow order of operations
    print(array)
    for i in (0..<array.count).reversed(){
        if array[i] == "+" {
            return Addition(parseArray(array[0..<i], 0, i), parseArray(array[(i+1)..<array.count], (i+1), array.count))
        }
        if array[i] == "-"{
            return Subtraction(parseArray(array[0..<i], 0, i), parseArray(array[(i+1)..<array.count], (i+1), array.count))
        }
    }
    for i in (0..<array.count).reversed(){
        if array[i] == "×"{
            return Multiplication(parseArray(array[0..<i], 0, i), parseArray(array[(i+1)..<(array.count)], (i+1), array.count))
        }
        if array[i] == "÷"{
            return Division(parseArray(array[0..<i], 0, i), parseArray(array[(i+1)..<array.count], (i+1), array.count))
        }
    }
    return Number(Double(array[0]) ?? 0.0)
}
func parseArray(_ array: ArraySlice<String>, _ a: Int, _ b: Int) -> Expression{
    // A is start B is stop
    
    for i in (a..<b).reversed(){
        if array[i] == "+"{
            return Addition(parseArray(array[a..<i], a, i), parseArray(array[(i+1)..<b], (i+1), b))
        }
        if array[i] == "-"{
            return Subtraction(parseArray(array[a..<i], a, i), parseArray(array[(i+1)..<b], (i+1), b))
        }
    }

    for i in (a..<b).reversed(){
        if array[i] == "×"{
            return Multiplication(parseArray(array[a..<i], a, i), parseArray(array[(i+1)..<b], (i+1), b))
        }
        if array[i] == "÷"{
            return Division(parseArray(array[a..<i], a, i), parseArray(array[(i+1)..<b], (i+1), b))
        }
    }
    return Number(Double(array[a]) ?? 0.0)
}

final class CalcData: ObservableObject {
    @Published var calculatorDisplay : [String] =  [""]
    @Published var pressedHistory: Bool = false
    var pressedEqual: Bool = false
    var history: [[String]] = [[""]]
    
    func appendToCalculator(thing:String){
        if self.pressedEqual{
            self.calculatorDisplay = [""]
            self.pressedEqual = false
        }
        switch thing{
        case "⏎":
            calculatorDisplay.append("")
        case "AC":
            calculatorDisplay = [""]
        case "DEL":
            if calculatorDisplay[calculatorDisplay.count-1].count != 0{
                calculatorDisplay[calculatorDisplay.count-1].removeLast()
            }
        case "HIS":
            self.pressedHistory = true
        case "=":
            self.calculatorDisplay.removeLast() // Removes the empty string
            let k:[String] = [String(parseArray(self.calculatorDisplay).eval())]
            self.history.append(self.calculatorDisplay + [" = "] + k)
            self.calculatorDisplay = k
            self.pressedEqual = true // Changes pressedEqual to true so the next tim you run function you reset calculatorDisplay
            if self.history.count > 7{ // Limit lines in history
                self.history.removeFirst()
            }
        case "ReturnFromHistory":
            self.pressedHistory = false
        default:
            calculatorDisplay[calculatorDisplay.count-1] += thing
        print(calculatorDisplay)
        }
    }
    func viewHistory() -> String{
        var text: String = ""
        for input in self.history{
            for i in input{
                text += i
            }
            text += "\n"
        }
        return text
    }
}


