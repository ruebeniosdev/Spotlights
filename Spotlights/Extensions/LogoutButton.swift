//
//  LogoutButton.swift
//  Spotlights
//
//  Created by Rueben on 16/04/2023.
//

import SwiftUI

struct LogoutButton: View {
    @State var action: () -> Void
    var title: String
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.custom("Poppins-SemiBold", size: 16))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(12)
                .frame(maxWidth: .infinity)
                .background(Color("asterisk 2"))
                .cornerRadius(48)
        }
    }
}

struct LogoutButton_Previews: PreviewProvider {
    static var previews: some View {
        LogoutButton(action: {}, title: "Log Out")
    }
}
