//
//  SeizureQ1.swift
//  ReGen Responder
//
//  Created by Eamon Kendall on 4/8/2023.
//

import SwiftUI

struct SeizureQ1: View {
    @State private var SeizureQ1YES: Bool = false
    @State private var SeizureQ1NO: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("You've called for help for a Seizure.")
                    .font(.title)
                Text("Please answer the following questions")
                    .font(.title2)
                Spacer()
                Text("Is the patient conscious?")
                    .font(.title3)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 451, height: 58)
                        .foregroundColor(.gray)
                    NavigationLink("Yes", destination: Text("Treatment"))
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    SeizureQ1YES = true
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 451, height: 58)
                        .foregroundColor(.gray)
                    NavigationLink("No", destination: SeizureQ2())
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    SeizureQ1NO = true
                }
                Spacer()
            }
        }
    }
}

struct SeizureQ1_Previews: PreviewProvider {
    static var previews: some View {
        SeizureQ1()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
