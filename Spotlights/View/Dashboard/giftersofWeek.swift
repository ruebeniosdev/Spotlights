//
//  giftersofWeek.swift
//  Spotlights
//
//  Created by Rueben on 12/04/2023.
//

import SwiftUI

struct GiftersofWeek: View {
    var image: String
    var name: String
    var checkmarkType: Bool
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                Image(image)
                    .resizable()
                    .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                HStack(spacing: 10) {
                    Text(name)
                        .font(.custom("Poppins-SemiBold", size: 14))
                    Image(checkmarkType ? "ccheck" : "logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color("asterisk"))
                }
                .foregroundColor(.black)
            }
        }
        .padding(8)
        .frame(width: 160, height: 56)
        .background(Color.white)
        .cornerRadius(28)
    }
}

struct GiftersofWeek_Previews: PreviewProvider {
    static var previews: some View {
        GiftersofWeek(image: "gifters", name: "JoeOkat", checkmarkType: true)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
