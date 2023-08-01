//
//  PunctureWoundsQ1.swift
//  ReGen Responder
//
//  Created by Eamon Kendall on 4/8/2023.
//

import SwiftUI

struct PunctureWoundsQ1: View {
    @State private var PunctureWoundsQ1YES: Bool = false
    @State private var PunctureWoundsQ1NO: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("You've called for help for a Puncture Wound.")
                    .font(.title)
                Text("Please answer the following questions")
                    .font(.title2)
                Spacer()
                Text("Is the wound severely bleeding?")
                    .font(.title3)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 451, height: 58)
                        .foregroundColor(.gray)
                    NavigationLink("Yes", destination: Text("Treatment"))
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    PunctureWoundsQ1YES = true
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 451, height: 58)
                        .foregroundColor(.gray)
                    NavigationLink("No", destination: Text("Treatment"))
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    PunctureWoundsQ1NO = true
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()

    }
}

struct PunctureWoundsQ1_Previews: PreviewProvider {
    static var previews: some View {
        PunctureWoundsQ1()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
