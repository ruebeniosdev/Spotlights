//
//  OrphanageDetailView.swift
//  Spotlights
//
//  Created by Rueben on 12/04/2023.
//

import SwiftUI

struct OrphanageDetailView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color("offwhite")
                .ignoresSafeArea()
            VStack(spacing: 0) {
                DetailHeader(action: {dismiss()}, title: "Nhyira Foundation", image: "fav icon")
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 24) {
                            TabView {
                                ForEach(0..<4) { _ in
                                    Image("children")
                                        .resizable()
                                        .scaledToFill()
                                }
                            }
                            .frame(height: 335)
                            .tabViewStyle(.page(indexDisplayMode: .always))
                            .tint(Color("accent"))
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Help feed people")
                                    .font(.custom("Poppins-SemiBold", size: 20))
                                Text("We’ve raised ¢1,730 for this year’s\nmaiden food relief efforts for rural\ncommunities.\n\nKeep it going by supporting our work \nin West Africa and beyond.")
                                    .font(.custom("Poppins-Regular", size: 16))
                            }
                            .padding(.horizontal)
                            .foregroundColor(.black)
                            DonateButton(action: {}, title: "Donate now", image: "donate")
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

struct OrphanageDetailView_Previews: PreviewProvider {
    static var previews: some View {
            OrphanageDetailView()
    }
}
