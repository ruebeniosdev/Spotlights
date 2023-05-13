//
//  MenuBtn.swift
//  Spotlights
//
//  Created by Rueben on 13/04/2023.
//

import SwiftUI

struct MenuBtn: View {
    let slideMenu: SlideMenuModel
    var body: some View {
            HStack(spacing: 18) {
                Image(slideMenu.imageName)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color("accent"))
                
                Text(slideMenu.title)
                    .font(.custom("Poppins-Medium", size: 16))
            }
            .frame(maxWidth: .infinity,alignment: .leading)
    }
}

struct MenuBtn_Previews: PreviewProvider {
    static var previews: some View {
        MenuBtn(slideMenu: SlideMenuModel(rawValue: 1) ?? .spotlight)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
