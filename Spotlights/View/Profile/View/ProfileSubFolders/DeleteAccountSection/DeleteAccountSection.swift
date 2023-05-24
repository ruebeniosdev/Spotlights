//
//  DeleteAccountSection.swift
//  Spotlights
//
//  Created by Rueben on 24/05/2023.
//

import SwiftUI

struct DeleteAccountSection: View {
    @Binding var isAtive: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Delete Account")
                .font(.custom("Poppins-Medium", size: 16))
                .foregroundColor(Color("textfieldcolor"))
            VStack(alignment: .leading, spacing: 16) {
                HStack(spacing: 8) {
                    Image(systemName: "trash")
                        .font(.title3)
                    Text("Delete your account")
                        .font(.custom("Poppins-Bold", size: 24))
                        .multilineTextAlignment(.center)
                }
                .foregroundColor(.white)
                Text("This action is irreversible. It will delete your personal account and activity.")
                    .font(.custom("Poppins-Medium", size: 17))
                    .foregroundColor(Color("textfieldcolor"))
                HStack {
                    Spacer()
                    Button {
                        isAtive.toggle()
                    } label: {
                        Text("Delete Account")
                            .font(.custom("Poppins-Medium", size: 15.58))
                            .foregroundColor(Color("asterisk 2"))
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 164, height: 46)
                            .background(
                                ZStack {
                                    RoundedRectangle(cornerRadius: 7)
                                        .fill(Color(#colorLiteral(red: 0.9215686321258545, green: 0.3490196168422699, blue: 0.2235294133424759, alpha: 1)))
                                        .opacity(0.2)
                                    RoundedRectangle(cornerRadius: 7)
                                        .strokeBorder(Color(#colorLiteral(red: 0.9215686321258545, green: 0.3490196168422699, blue: 0.2235294133424759, alpha: 1)), lineWidth: 2)
                                }
                            )
                    }
                }
            }
            .padding()
            .frame(height: 222)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color(#colorLiteral(red: 0.8708333373069763, green: 0.903124988079071, blue: 1, alpha: 0.4000000059604645)), lineWidth: 1)
            )
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}


struct DeleteAccountSection_Previews: PreviewProvider {
    static var previews: some View {
        DeleteAccountSection(isAtive: .constant(false))
    }
}
