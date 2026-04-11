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
        }
    }
}

#Preview {
    ContentView()
}
