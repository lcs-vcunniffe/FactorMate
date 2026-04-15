//
//  Equation.swift
//  FactorPal2
//
//  Created by Veda Niav Cunniffe on 2026-04-11.
//

import Foundation

//
//  Equation.swift
//  FactorPal
//
//  Created by Veda Niav Cunniffe on 2026-04-10.
//

import Foundation

struct Equation: Identifiable {
    let id = UUID()
    var factorR: Int
    var factorS: Int
    var factorGuess1: String
    var factorGuess2: String
    var answersCorrect: Bool
    
    var coefficientB: Int {
        return factorR + factorS
    }
    var constantC: Int {
        return factorR * factorS
    }
}
