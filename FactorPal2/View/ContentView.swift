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
    
    @State var answersChecked: Bool = false
    
    @State var answer1Correct: Bool = false
    @State var answer2Correct: Bool = false
    
    @State var errorMessage: String = ""
    
    @State var pastAttempts: [Equation] = []
    
    @State private var selectedAttemptsToShow: Int = 0
    
    //MARK: Computed properties
    var overallResponseCorrect: Bool {
        return answer1Correct && answer2Correct
    }
    
    var coefficientB: Int {
        return factorR + factorS
    }
    var constantC: Int {
        return factorR * factorS
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Factor:")
                    .font(Font.system(size: 26))
                Spacer()
            }
            .padding()
            
            LaTeX("$x^2+\(coefficientB)x+\(constantC)$")
                .font(UIFont.systemFont(ofSize: 40))
            
            HStack(alignment: .top, spacing: 0) {
                LaTeX("(x+")
                    .font(UIFont.systemFont(ofSize: 50))
                VStack {
                    TextField("", text: $factorGuess1)
                        .font(Font.system(size: 50))
                        .frame(width: 45)
                        .textFieldStyle(.roundedBorder)
                    ZStack {
                        Image(systemName: "checkmark.circle")
                            .foregroundStyle(.green)
                            .opacity(answer1Correct == true ? 1.0 : 0.0)
                        Image(systemName: "x.circle")
                            .foregroundStyle(.red)
                            .opacity(answer1Correct == false && answersChecked == true ? 1.0 : 0.0)
                    }
                }
                LaTeX("$)(x+$")
                    .font(UIFont.systemFont(ofSize: 50))
                VStack {
                    TextField("", text: $factorGuess2)
                        .font(Font.system(size: 50))
                        .frame(width: 45)
                        .textFieldStyle(.roundedBorder)
                    ZStack {
                        Image(systemName: "checkmark.circle")
                            .foregroundStyle(.green)
                            .opacity(answer2Correct == true ? 1.0 : 0.0)
                        Image(systemName: "x.circle")
                            .foregroundStyle(.red)
                            .opacity(answer2Correct == false && answersChecked == true ? 1.0 : 0.0)
                    }
                }
                LaTeX(")")
                    .font(UIFont.systemFont(ofSize: 50))
            }
            Text(errorMessage)
                .font(Font.system(size: 10))
            ZStack(alignment: .trailing) {
                Button(action: {
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
                    answersChecked = true
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
                    
                    saveAttempt()
                }, label: {
                    Text("Check answers")
                        .padding()
                        .foregroundStyle(.white)
                        .background(Color.blue, in: Capsule())
                })
                .opacity(answersChecked == false ? 1.0 : 0.0)
                
                Button(action: {
                    factorR = Int.random(in: 1...6)
                    factorS = Int.random(in: 1...6)
                    
                    factorGuess1 = ""
                    factorGuess2 = ""
                    
                    answersChecked = false
                    answer1Correct = false
                    answer2Correct = false
                }, label: {
                    Text("Next question")
                        .padding()
                        .foregroundStyle(.white)
                        .background(Color.blue, in: Capsule())
                })
                .opacity(answersChecked == true ? 1.0 : 0.0)
            }
            Picker("Filter", selection: $selectedAttemptsToShow) {
                Text("All").tag(0)
                Text("Correct").tag(1)
                Text("Incorrect").tag(2)
            }
            .pickerStyle(.segmented)
        }
    }
    
    //MARK: Functions
    func saveAttempt() {
        let lastAttempt = Equation(
            factorR: factorR,
            factorS: factorS,
            factorGuess1: factorGuess1,
            factorGuess2: factorGuess2,
            answersCorrect: overallResponseCorrect
        )
        pastAttempts.insert(lastAttempt, at: 0)
    }
    func filter(_ pastAttempts: [Equation], by showingAttempts: Int) -> [Equation] {
        if selectedAttemptsToShow == 0 {
            return pastAttempts
        } else {
            var filteredAttempts: [Equation] = []
            
            for currentAttempt in pastAttempts {
                if showingAttempts == 1 && currentAttempt.answersCorrect == true {
                    filteredAttempts.insert(currentAttempt, at: 0)
                } else if showingAttempts == 2 && currentAttempt.answersCorrect == false {
                    filteredAttempts.insert(currentAttempt, at: 0)
                }
            }
            return filteredAttempts
        }
    }
}

#Preview {
    ContentView()
}
