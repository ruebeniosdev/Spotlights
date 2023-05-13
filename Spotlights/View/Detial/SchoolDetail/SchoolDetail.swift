//
//  SchoolDetail.swift
//  Spotlights
//
//  Created by Rueben on 12/04/2023.
//

import SwiftUI

struct SchoolDetail: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color("primary")
                .ignoresSafeArea()
            VStack(spacing: 0) {
                DetailHeader(action: {dismiss()}, title: "Nhyira Foundation", image: "fav icon")
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 24) {
                            TabView {
                                ForEach(0..<4) { _ in
                                    Image("graduate")
                                        .resizable()
                                        .scaledToFill()
                                }
                            }
                            .frame(height: 335)
                            .tabViewStyle(.page(indexDisplayMode: .always))
                            .tint(Color("accent"))
                           // .padding(.top)
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Support a graduate")
                                    .font(.custom("Poppins-SemiBold", size: 20))
                                Text("All the hassle for a tassel. In most \ncases graduates do not get a decent\nor permanent job after college.\nOur goal is to help the unemployed in\nGhana and Africa everyday this year\nwith their own Start Business.")
                                    .font(.custom("Poppins-Regular", size: 16))
                            }
                            .padding(.horizontal)
                            .foregroundColor(.black)
                            DonateButton(action: {}, title: "Sponsor now", image: "sponsor")
                                .padding(.horizontal)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SchoolDetail_Previews: PreviewProvider {
    static var previews: some View {
        SchoolDetail()
    }
}
