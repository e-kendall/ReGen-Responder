//
//  BrokenBonesQ1.swift
//  ReGen Responder
//
//  Created by Eamon Kendall on 3/8/2023.
//

import SwiftUI

struct BrokenBonesQ1: View {
    @State private var BrokenBonesQ1YES: Bool = false
    @State private var BrokenBonesQ1NO: Bool = false
    @Binding var BrokenBonesQ2YES: Bool
    @Binding var BrokenBonesQ2NO: Bool
    @Binding var stepIDS: [String]
    @Binding var currentStepIndex: Int
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("You've called for help for a Broken Limb.")
                    .font(.title)
                Text("Please answer the following questions")
                    .font(.title2)
                Spacer()
                Text("Are there any protruding bones?")
                    .font(.title3)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 451, height: 58)
                        .foregroundColor(.gray)
                    NavigationLink("Yes", destination: BrokenBonesQ2(), isActive: $BrokenBonesQ1YES)
                        .foregroundColor(.white)
                }
                
                NavigationLink(destination: TreatmentView(), isActive: $BrokenBonesQ1NO) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 451, height: 58)
                            .foregroundColor(.gray)
                        Text("No")
                            .foregroundColor(.white)
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        BrokenBonesQ1NO = true
                        if BrokenBonesQ1NO {
                            stepIDS = ["4", "5", "6"]
                            currentStepIndex += 1
                        }
                    })
                }
                
                Spacer()
            }
            .navigationBarBackButtonHidden()
        }
    }
}

struct BrokenBonesQ1_Previews: PreviewProvider {
    @State static var brokenBonesQ2YESExamples = false
    @State static var brokenBonesQ2NOExamples = false // Set it to false initially
    @State static var stepIDExamples = ["5", "6"]
    @State static var currentStepIndex = 0 // Set it to the initial step index
    
    static var previews: some View {
        BrokenBonesQ1(
            BrokenBonesQ2YES: $brokenBonesQ2YESExamples,
            BrokenBonesQ2NO: $brokenBonesQ2NOExamples,
            stepIDS: $stepIDExamples,
            currentStepIndex: $currentStepIndex // Pass the currentStepIndex binding
        )
        .previewInterfaceOrientation(.landscapeRight)
    }
}

