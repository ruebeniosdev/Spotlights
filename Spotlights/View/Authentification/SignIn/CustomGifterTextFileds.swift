//
//  CustomGifterTextFileds.swift
//  Spotlights
//
//  Created by Rueben on 11/04/2023.
//

import SwiftUI

struct CustomGifterTextFileds: View {
    var nameAttach: String
    @Binding var text: String
    var placeHolder: String
    var star: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(nameAttach)
                    .font(.custom("Poppins-Medium", size: 16))
                +
                Text(star)
                    .foregroundColor(Color("primary"))
            }
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeHolder)
                        .foregroundColor(Color.black)
                }
                TextField(placeHolder, text: $text, prompt: Text(placeHolder) .foregroundColor(Color("textfieldcolor")))
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(Color.black)
                    .padding()
                    .frame(height: 51)
                    .background(Color.white)
                    .cornerRadius(5)
            }
            .textInputAutocapitalization(.never)
        }
    }
}

struct CustomGifterTextFileds_Previews: PreviewProvider {
    static var previews: some View {
        CustomGifterTextFileds(nameAttach: "Tiktok", text: .constant(""), placeHolder: "Add tiktok handle", star: " *")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
