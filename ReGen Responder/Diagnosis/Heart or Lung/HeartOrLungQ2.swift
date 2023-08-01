//
//  HeartOrLungQ2.swift
//  ReGen Responder
//
//  Created by Eamon Kendall on 4/8/2023.
//

import SwiftUI

struct HeartOrLungQ2: View {
    @State private var HeartOrLungQ2YES: Bool = false
    @State private var HeartOrLungQ2NO: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("You've called for help for a Heart/Lung Problem.")
                    .font(.title)
                Text("Please answer the following questions")
                    .font(.title2)
                Spacer()
                Text("Is the patient breathing correctly?")
                    .font(.title3)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 451, height: 58)
                        .foregroundColor(.gray)
                    NavigationLink("Yes", destination: Text("Treatment"))
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    HeartOrLungQ2YES = true
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 451, height: 58)
                        .foregroundColor(.gray)
                    NavigationLink("No", destination: HeartOrLungQ3())
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    HeartOrLungQ2NO = true
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct HeartOrLungQ2_Previews: PreviewProvider {
    static var previews: some View {
        HeartOrLungQ2()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
