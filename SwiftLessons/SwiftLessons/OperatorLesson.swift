//
//  OperatorLesson.swift
//  SwiftCommandLine
//
//  Created by gaojuyan on 2017/3/1.
//  Copyright © 2017年 gaojuyan. All rights reserved.
//

import Foundation

///////////////////////////Basic Operators///////////////////////////

// Arithmetic operators: + - * / %
// Logical operators: && || !
// Range operators: ... ..<
// Assignment operator: ==
/********  Terminology   *******
 Unary operators: + - !
 Binary operators: +
 Ternary operators: ?: (Ternary Conditional Operator)
 *******************************/
// Compound Assignment Operators: += -= *= /=
// Comparison Operators； == != > < >= <= === !==

/* Nil-Coalescing Operator: ??  (coalesce 合并)
 a ?? b unwrap an optional a if it contains a value, or returns a default value b if a is nil.
 The expression a is always of an optional type.The expression b must match the type that is
 stored inside a.
 The nil-coalescing operator is shorthand for the code: a != nil ? a! : b
 */



///////////////////////////Advanced Operators///////////////////////////


// Bitwise Operators: 
/*
 1. bitwise NOT operator: ~
 2. bitwise AND operator: &
 3. bitwise OR  operator: |
 4. bitwise XOR operator: ^
 5. bitwise Left Shift operator: <<
 6. bitwise Right Shift operator: >>
 
 */

// Overflow Operators: &+ &- &*

class OperatorLesson {
    
    var sumOfOperator = 0
    
    var unsignedOverflow = UInt8.max
    
    func runOverflow() {
        print("---------max overflow test---------")
        print("original value: \(unsignedOverflow)")  // 255
        unsignedOverflow = unsignedOverflow &+ 1
        print("overflow value: \(unsignedOverflow)")  // 0
        print("---------min overflow test---------")
        var unsignedMin = UInt8.min
        print("original value: \(unsignedMin)")  // 0
        unsignedMin = unsignedMin &- 1
        print("overflow value: \(unsignedMin)")  // 255
        print("---------signed integers overflow test---------")
        var signedMax = Int8.max
        print("original value: \(signedMax)")   // 127
        signedMax = signedMax &+ 1
        print("overflow value: \(signedMax)")   // -128
        print("---------min overflow test---------")
        var signedMin = Int8.min
        print("original value: \(signedMin)")   // -128
        signedMin = signedMin &- 1
        print("overflow value: \(signedMin)")   // 127
    }
    
    func runPrecedence() {
        print("============= precedence test ===============")
        print("3 % 4 = \(3 % 4)")
        print("result = \(2 + 3 % 4 * 5)")
    }
    
    // Operator overloading
    static func + (left: OperatorLesson, right: OperatorLesson) -> OperatorLesson {
        let lesson = OperatorLesson()
        lesson.sumOfOperator = left.sumOfOperator + right.sumOfOperator
        return lesson
    }
    
    static func == (left: OperatorLesson, right: OperatorLesson) -> Bool {
        // equivalence operator
        return left.sumOfOperator == right.sumOfOperator
    }

}







