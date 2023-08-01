//
//  SeizureQ2.swift
//  ReGen Responder
//
//  Created by Eamon Kendall on 4/8/2023.
//

import SwiftUI

struct SeizureQ2: View {
    @State private var SeizureQ2YES: Bool = false
    @State private var SeizureQ2NO: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("You've called for help for a Seizure.")
                    .font(.title)
                Text("Please answer the following questions")
                    .font(.title2)
                Spacer()
                Text("Is the patient moving uncontrollably?")
                    .font(.title3)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 451, height: 58)
                        .foregroundColor(.gray)
                    NavigationLink("Yes", destination: Text("Treatment"))
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    SeizureQ2YES = true
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 451, height: 58)
                        .foregroundColor(.gray)
                    NavigationLink("No", destination: Text("Treatment"))
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    SeizureQ2NO = true
                }
                Spacer()
            }
        }
    }
}

struct SeizureQ2_Previews: PreviewProvider {
    static var previews: some View {
        SeizureQ2()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
