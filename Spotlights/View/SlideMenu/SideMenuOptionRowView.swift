//
//  SideMenuOptionRowView.swift
//  Spotlights
//
//  Created by Rueben on 14/04/2023.
//

import SwiftUI

struct SlideMenuOptionRowView: View {
    let viewModel: slidemenuModel
    var body: some View {
        HStack(spacing: 16) {
            Image(viewModel.imageName)
                .resizable()
                .renderingMode(.template)
                .frame(width: 20, height: 20)
                .foregroundColor(Color("accent"))
            Text(viewModel.title)
                .font(.custom("Poppins-Medium", size: 16))
        }
        .frame(maxWidth: .infinity,alignment: .leading)
    }
}

//struct SlideMenuOptionRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        SlideMenuOptionRowView(viewModel: slidemenuModel(rawValue: 1) ?? .spotlight)
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}
