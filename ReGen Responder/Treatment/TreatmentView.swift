//
//  TreatmentView.swift
//  ReGen Responder
//
//  Created by Eamon Kendall on 6/8/2023.
//

import SwiftUI

struct TreatmentView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var currentStepIndex: Int = 0
    @State private var stepIDS: [String] = ["1", "6", "9"]


    var body: some View {
        NavigationStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(modelData.treatmentSteps[currentStepIndex].direction)
                        .font(.system(size: 36, weight: .semibold))
                        .multilineTextAlignment(.leading)
                    
                    Text(modelData.treatmentSteps[currentStepIndex].description)
                        .font(.system(size: 24, weight: .medium))
                    
                    if let materialLocation = modelData.treatmentSteps[currentStepIndex].materialLocation {
                        HStack {
                            ZStack {
                                Circle()
                                    .foregroundColor(.red)
                                    .frame(width: 224, height: 224)
                                Text(materialLocation)
                                    .foregroundColor(.white)
                                    .font(.system(size: 84, weight: .medium))
                            }
                            .padding()
                        }
                        .frame(width: 490)
                    }
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 451, height: 58)
                            .foregroundColor(.gray)
                        Button("Next") {
                            showNextStep(withStepIDs: stepIDS)
                        }
                        .foregroundColor(.white)
                    }
                    .padding()
                    Text("If the patients condition worsens or you are ever in doubt, Dial 000.")
                        .font(.headline)
                }
                .padding()
                
                
                Image(modelData.treatmentSteps[currentStepIndex].image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                
                
                
                    .navigationBarBackButtonHidden()
            }
            .padding()
        }
    }
    
    func showNextStep(withStepIDs stepIDs: [String]) {
        guard let currentIndex = modelData.treatmentSteps.firstIndex(where: { $0.id == stepIDS[currentStepIndex] }) else {
            return
        }

        let validSteps = modelData.treatmentSteps.enumerated().filter { index, step in
            stepIDs.contains(step.id) && index > currentIndex
        }

        if let nextStep = validSteps.first {
            currentStepIndex = nextStep.offset
        }
    }

}

struct TreatmentView_Previews: PreviewProvider {
    static var previews: some View {
        TreatmentView()
            .environmentObject(ModelData())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
