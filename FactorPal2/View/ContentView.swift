//
//  QuestionsView.swift
//  FactorPal
//
//  Created by Veda Niav Cunniffe on 2026-04-10.
//

import SwiftUI
import LaTeXSwiftUI

struct ContentView: View {
    //MARK: Stored properties
    @State var factorGuess1: String = ""
    @State var factorGuess2: String = ""
    
    @State var factorR = Int.random(in: 1...6)
    @State var factorS = Int.random(in: 1...6)
    
    var coefficientB: Int {
        return factorR + factorS
    }
    var constantC: Int {
        return factorR * factorS
    }
    
    @State var answersChecked: Bool = false
    
    @State var answer1Correct: Bool = false
    @State var answer2Correct: Bool = false
    
    @State var errorMessage: String = ""
    
    @State var pastAnswers: [Equation] = []
    
    //MARK: Computed properties
    var body: some View {
        VStack {
            Text("Factor:")
                .multilineTextAlignment(.leading)
            LaTeX("$x^2+\(coefficientB)x+\(constantC)$")
            HStack {
                Text("(x+")
                TextField("", text: $factorGuess1)
                    .frame(width: 20)
                Text(")(x+")
                TextField("", text: $factorGuess2)
                Text(")")
            }
            ZStack {
                Button(action: {
                    answersChecked = true
                    guard let factorTry1 = Int(factorGuess1) else {
                        answer1Correct = false
                        answersChecked = false
                        errorMessage = "Please put numbers in both fields."
                        return
                    }
                    guard let factorTry2 = Int(factorGuess2) else {
                        answer2Correct = false
                        answersChecked = false
                        errorMessage = "Please put numbers in both fields."
                        return
                    }
                    if factorTry1 == factorR {
                        answer1Correct = true
                        errorMessage = ""
                        if factorTry2 == factorS {
                            answer2Correct = true
                        } else {
                            answer2Correct = false
                        }
                    } else if factorTry1 == factorS {
                        answer1Correct = true
                        errorMessage = ""
                        if factorTry2 == factorR {
                            answer2Correct = true
                        } else {
                            answer2Correct = false
                        }
                    } else {
                        answer1Correct = false
                        errorMessage = ""
                        if factorTry2 == factorR {
                            answer2Correct = true
                        } else if factorTry2 == factorS {
                            answer2Correct = true
                        } else {
                            answer2Correct = false
                        }
                    }
                }, label: {
                    Text("Check answers")
                })
            }
        }
    }
}

#Preview {
    ContentView()
}
