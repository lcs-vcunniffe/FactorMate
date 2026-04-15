//
//  Equation.swift
//  FactorPal
//
//  Created by Veda Niav Cunniffe on 2026-04-11.
//  Debugged with assistance from ChatGPT – reminded me to make the Equation struct identifiable
//

import Foundation

struct Equation: Identifiable {
    let id = UUID()
    var factorR: Int
    var factorS: Int
    var factorGuess1: String
    var factorGuess2: String
    var answer1Correct: Bool
    var answer2Correct: Bool
    
    var answersCorrect: Bool {
        return answer1Correct && answer2Correct
    }
    var coefficientB: Int {
        return factorR + factorS
    }
    var constantC: Int {
        return factorR * factorS
    }
}
