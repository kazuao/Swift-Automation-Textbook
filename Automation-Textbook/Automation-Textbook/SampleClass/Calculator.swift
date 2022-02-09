//
//  Calculator.swift
//  Calc-iosTestText
//
//  Created by kazunori.aoki on 2022/01/29.
//

import Foundation

final class Calculator {

    func add(_ x: Int, _ y: Int) -> Int {
        return x + y
    }

    func subtract(_ x: Int, _ y: Int) -> Int {
        return x - y
    }

    func multiple(_ x: Int, _ y: Int) -> Int {
        return x * y
    }

    func division(_ x: Int, _ y: Int) -> Int {
        return x / y
    }

    func safeDivision(_ x: Int, _ y: Int) -> Int? {
        if y == 0 {
            return nil
        } else {
            return x / y
        }
    }
}
