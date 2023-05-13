//
//  CreatorCard.swift
//  Spotlights
//
//  Created by Rueben on 11/04/2023.
//

import SwiftUI

struct CreatorCard: View {
    var body: some View {
            ZStack(alignment: .topLeading) {
                VStack(spacing: 18) {
                    Image("maximize")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    Text("Creator")
                        .font(.custom("Poppins-Medium", size: 16))
                }
                .foregroundColor(.black)
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("asterisk 2"))
                    .clipped()
                    .frame(width: 24, height: 23)
                    .offset(x: -55, y: -50)
            }
            .frame(maxWidth: .infinity)
            .frame(width: 162, height: 162)
            .background(Color.white)
            .cornerRadius(8)
    }
}

struct CreatorCard_Previews: PreviewProvider {
    static var previews: some View {
        CreatorCard()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
