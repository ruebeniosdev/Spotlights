//
//  Header.swift
//  Spotlights
//
//  Created by Rueben on 11/04/2023.
//

import SwiftUI

struct Header: View {
    var title: String
    @State var action: () -> Void
    var body: some View {
        HStack {
            Button {
                withAnimation(.easeInOut) {
                    action()
                }
            } label: {
                Image("menu")
                    .renderingMode(.template)
                    .foregroundColor(.black)
                    .frame(width: 20, height: 20)
            }
            Spacer()
            Text(title)
                .font(.custom("Poppins-SemiBold", size: 18))
                .foregroundColor(.black)
            Spacer()
            Button {
            } label: {
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.black)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
        .background(.white)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(title: "Get Spotlights", action: {})
    }
}
