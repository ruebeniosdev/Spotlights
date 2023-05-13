//
//  GifterCard.swift
//  Spotlights
//
//  Created by Rueben on 11/04/2023.
//

import SwiftUI

struct GifterCard: View {
    var body: some View {
        ZStack {
            VStack(spacing: 18) {
                Image("3square")
                Text("Gifter")
                    .font(.custom("Poppins-Medium", size: 16))
            }
            .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
        .frame(width: 162, height: 162)
        .background(Color("primary"))
        .cornerRadius(8)
    }
}

struct GifterCard_Previews: PreviewProvider {
    static var previews: some View {
        GifterCard()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
