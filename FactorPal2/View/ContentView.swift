//
//  QuestionsView.swift
//  FactorPal
//
//  Created by Veda Niav Cunniffe on 2026-04-10.
//

import SwiftUI
import LaTeXSwiftUI

struct QuestionsView: View {
    //MARK: Stored properties
    @State var factorGuess1: String = ""
    @State var factorGuess2: String = ""
    
    @State var answersChecked: Bool = false
    
    @State var answer1Correct: Bool = false
    @State var answer2Correct: Bool = false
    
    @State var pastAnswers: [Equation] = []
    
    //MARK: Computed properties
    var body: some View {
        VStack {
            Text("Factor:")
            HStack {
                LaTeX("$x^2$")
            }
            HStack {
                Text("(x+")
                TextField("", text: <#Binding<String>#>)
                Text(")(x+")
                TextField("", text: <#T##Binding<String>#>)
                Text(")")
            }
        }
    }
}

#Preview {
    QuestionsView()
}
