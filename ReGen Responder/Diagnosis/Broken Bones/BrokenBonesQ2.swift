//
//  BrokenBonesQ2.swift
//  ReGen Responder
//
//  Created by Eamon Kendall on 4/8/2023.
//

import SwiftUI

struct BrokenBonesQ2: View {
    @State private var BrokenBonesQ2YES: Bool = false
    @State private var BrokenBonesQ2NO: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("You've called for help for a Broken Limb.")
                    .font(.title)
                Text("Please answer the following questions")
                    .font(.title2)
                Spacer()
                Text("Is the wound bleeding severely?")
                    .font(.title3)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 451, height: 58)
                        .foregroundColor(.gray)
                    NavigationLink("Yes", destination: Text("Treatment"))
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    BrokenBonesQ2YES = true
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 451, height: 58)
                        .foregroundColor(.gray)
                    NavigationLink("No", destination: Text("Treatment"))
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    BrokenBonesQ2NO = true
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct BrokenBonesQ2_Previews: PreviewProvider {
    static var previews: some View {
        BrokenBonesQ2()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
