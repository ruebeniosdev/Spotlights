//
//  DonateButton.swift
//  Spotlights
//
//  Created by Rueben on 12/04/2023.
//

import SwiftUI

struct DonateButton: View {
    @State var action: () -> Void
    var title: String
    var image: String
    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 12) {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 18)
                Text(title)
                    .font(.custom("Poppins-SemiBold", size: 15.58))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("accent"))
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 41)
            .frame(width: 211, height: 48)
            .background(Color("secondary"))
            .cornerRadius(48)
        }
    }
}

struct DonateButton_Previews: PreviewProvider {
    static var previews: some View {
        DonateButton(action: {}, title: "Donate now", image: "donate")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
