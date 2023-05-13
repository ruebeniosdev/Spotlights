//
//  BusinessDetailVIew.swift
//  Spotlights
//
//  Created by Rueben on 12/04/2023.
//

import SwiftUI

struct BusinessDetailVIew: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color("accent")
                .ignoresSafeArea()
            VStack(spacing: 0) {
                DetailHeader(action: {dismiss()}, title: "Nhyira Foundation", image: "fav icon")
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 24) {
                            TabView {
                                ForEach(0..<4) { _ in
                                    Image("businesspic")
                                        .resizable()
                                        .scaledToFill()
                                }
                            }
                            .tabViewStyle(.page(indexDisplayMode: .always))
                            .tint(Color("accent"))
                            .frame(height: 335)
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Support a business")
                                    .font(.custom("Poppins-SemiBold", size: 20))

                                Text("Instead of baby showers,let’s come\ntogether and host business showers.\nWhen a friend launches herself as \nself-employed,let us congratulate\nher by bringing supplies, resources\nand funds to help kickstart her startup")
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

struct BusinessDetailVIew_Previews: PreviewProvider {
    static var previews: some View {
        BusinessDetailVIew()
    }
}
