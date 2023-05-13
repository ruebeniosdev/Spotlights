//
//  ButtonMain.swift
//  Spotlights
//
//  Created by Rueben on 11/04/2023.
//

import SwiftUI

struct ButtonMain: View {
    @State var action: () -> Void
    var title: String
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.custom("Poppins-SemiBold", size: 16))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(12)
                .frame(maxWidth: .infinity)
                .background(Color("accent"))
                .cornerRadius(48)
        }
       // .padding()
    }
}

struct ButtonMain_Previews: PreviewProvider {
    static var previews: some View {
        ButtonMain(action: {}, title: "Get Spotlights")
    }
}
