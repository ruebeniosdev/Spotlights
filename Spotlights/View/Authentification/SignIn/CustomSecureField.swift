//
//  CustomSecureField.swift
//  Spotlights
//
//  Created by Rueben on 11/04/2023.
//

import SwiftUI

struct CustomSecureField: View {
    var nameAttach: String
    @Binding var password: String
    var placeHolder: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(nameAttach)
                    .font(.custom("Poppins-Medium", size: 16))
                +
                Text(" *")
                    .foregroundColor(Color("asterisk"))
            }
            ZStack(alignment: .leading) {
                if password.isEmpty {
                    Text(placeHolder)
                        .foregroundColor(Color.black)
                }
                SecureField(placeHolder, text: $password, prompt: Text(placeHolder) .foregroundColor(Color("textfieldcolor")))
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(Color.black)
                    .padding()
                    .frame(height: 51)
                    .background(Color.white)
                    .cornerRadius(5)
            }
        }
    }
}

struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecureField(nameAttach: "Password", password: .constant(""), placeHolder: "Entere your secure password")
    }
}
