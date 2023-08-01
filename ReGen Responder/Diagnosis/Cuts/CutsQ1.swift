//
//  CutsQ1.swift
//  ReGen Responder
//
//  Created by Eamon Kendall on 4/8/2023.
//

import SwiftUI

struct CutsQ1: View {
    @State private var CutsQ1YES: Bool = false
    @State private var CutsQ1NO: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("You've called for help for a Cut.")
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
                    NavigationLink("Yes", destination: CutsQ2())
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    CutsQ1YES = true
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 451, height: 58)
                        .foregroundColor(.gray)
                    NavigationLink("No", destination: CutsQ2())
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    CutsQ1NO = true
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct CutsQ1_Previews: PreviewProvider {
    static var previews: some View {
        CutsQ1()
            .previewInterfaceOrientation(.landscapeRight)

    }
}
