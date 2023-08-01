//
//  CutsQ2.swift
//  ReGen Responder
//
//  Created by Eamon Kendall on 4/8/2023.
//

import SwiftUI

struct CutsQ2: View {
    @State private var CutsQ2YES: Bool = false
    @State private var CutsQ2NO: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("You've called for help for a Cut.")
                    .font(.title)
                Text("Please answer the following questions")
                    .font(.title2)
                Spacer()
                Text("Is the cut deep?")
                    .font(.title3)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 451, height: 58)
                        .foregroundColor(.gray)
                    NavigationLink("Yes", destination: Text("Treatment"))
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    CutsQ2YES = true
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 451, height: 58)
                        .foregroundColor(.gray)
                    NavigationLink("No", destination: Text("Treatment"))
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    CutsQ2NO = true
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct CutsQ2_Previews: PreviewProvider {
    static var previews: some View {
        CutsQ2()
            .previewInterfaceOrientation(.landscapeRight)

    }
}
