//
//  HeartOrLungQ3.swift
//  ReGen Responder
//
//  Created by Eamon Kendall on 4/8/2023.
//

import SwiftUI

struct HeartOrLungQ3: View {
    @State private var HeartOrLungQ3YES: Bool = false
    @State private var HeartOrLungQ3NO: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("You've called for help for a Heart/Lung Problem.")
                    .font(.title)
                Text("Please answer the following questions")
                    .font(.title2)
                Spacer()
                Text("Does the victim have a pulse?")
                    .font(.title3)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 451, height: 58)
                        .foregroundColor(.gray)
                    NavigationLink("Yes", destination: Text("Treatment"))
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    HeartOrLungQ3YES = true
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 451, height: 58)
                        .foregroundColor(.gray)
                    NavigationLink("No", destination: Text("Treatment"))
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    HeartOrLungQ3NO = true
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct HeartOrLungQ3_Previews: PreviewProvider {
    static var previews: some View {
        HeartOrLungQ3()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
