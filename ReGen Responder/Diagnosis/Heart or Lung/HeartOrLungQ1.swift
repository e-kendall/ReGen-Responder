//
//  HeartOrLungQ1.swift
//  ReGen Responder
//
//  Created by Eamon Kendall on 4/8/2023.
//

import SwiftUI

struct HeartOrLungQ1: View {
    @State private var HeartOrLungQ1YES: Bool = false
    @State private var HeartOrLungQ1NO: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("You've called for help for a Heart/Lung Problem.")
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
                    NavigationLink("Yes", destination: HeartOrLungQ2())
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    HeartOrLungQ1YES = true
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 451, height: 58)
                        .foregroundColor(.gray)
                    NavigationLink("No", destination: HeartOrLungQ2())
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    HeartOrLungQ1NO = true
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct HeartOrLungQ1_Previews: PreviewProvider {
    static var previews: some View {
        HeartOrLungQ1()
            .previewInterfaceOrientation(.landscapeRight)

    }
}
