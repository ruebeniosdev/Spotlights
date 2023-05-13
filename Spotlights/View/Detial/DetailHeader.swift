//
//  DetailHeader.swift
//  Spotlights
//
//  Created by Rueben on 12/04/2023.
//

import SwiftUI

struct DetailHeader: View {
    @State var action: () -> Void
    var title: String
    var image: String
    var body: some View {
        HStack {
            Button {
                action()
            } label: {
                Image(systemName: "arrow.left")
                    .renderingMode(.template)
                    .foregroundColor(.primary)
                    .frame(width: 18, height: 12)
            }
            Spacer()
            Image("fav icon1")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            Text(title)
                .font(.custom("Poppins-Regular", size: 16))
            Image(systemName: "checkmark.seal.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(Color("asterisk"))
            Spacer()
        }
        .padding(.horizontal, 18)
        .padding(.vertical)
        .background()
    }
}

struct DetailHeader_Previews: PreviewProvider {
    static var previews: some View {
        DetailHeader(action: {}, title: "Nyhire Foundation", image: "fav icon")
            .previewLayout(.sizeThatFits)
    }
}
