//
//  SlideMenuHeaderView.swift
//  Spotlights
//
//  Created by Rueben on 24/05/2023.
//

import SwiftUI

struct SlideMenuHeaderView: View {
    @Binding var showSlideMenu: Bool
    @Binding var showAboutUs: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 28) {
            HStack(spacing: 10) {
                HStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    Text("Spotlight")
                        .font(.custom("Poppins-Medium", size: 24))
                }
                Spacer()
                Button(action: {
                    withAnimation(.easeInOut) {
                        showSlideMenu = false
                    }
                }) {
                    Image("back")
                }
            }
            .padding(.top)
            Rectangle()
                .fill(Color("offwhite").opacity(0.1))
                .frame(height: 1)
        }
        .padding(.horizontal)
    }
}


//struct SlideMenuHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        SlideMenuHeaderView()
//    }
//}
