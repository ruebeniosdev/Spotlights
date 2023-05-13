//
//  Hospital.swift
//  Spotlights
//
//  Created by Rueben on 12/04/2023.
//

import SwiftUI

struct Hospital: View {
    var phoneNumber = "+233261430256"
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color("accent3")
                .ignoresSafeArea()
            VStack(spacing: 0) {
                DetailHeader(action: {dismiss()}, title: "The Golden Heritage Foundation", image: "")
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 24) {
                            TabView {
                                ForEach(0..<4) { _ in
                                    Image("mum")
                                        .resizable()
                                        .scaledToFill()
                                }
                            }
                            .frame(height: 335)
                            .tabViewStyle(.page(indexDisplayMode: .always))
                            .tint(Color("accent"))
                           // .padding(.top)
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Bless a new mum")
                                    .font(.custom("Poppins-SemiBold", size: 20))
                                Text("Put smiles on the faces of new mums\nand touch lives of new borns by \ndonating items such as toiletries, \ndiapers, baby clothes and more.\n\nFor more inquiries kindly contact us.")
                                    .font(.custom("Poppins-Regular", size: 16))
                            }
                             .padding(.horizontal)
                             .foregroundColor(.black)
                            HStack(spacing: 18) {
                                DonateButton(action: {}, title: "Donate now", image: "donate")
                                Button {
                                    if let phoneCallUrl = URL(string: "tel://\(self.phoneNumber)") {
                                    let application:UIApplication = UIApplication.shared
                                    if (application.canOpenURL(phoneCallUrl)) {
                                            application.open(phoneCallUrl, options: [:], completionHandler: nil)
                                        }
                                    }
                                } label: {
                                    Image("call")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 17.81, height: 17.81)
                                        .padding()
                                        .frame(width: 106, height: 48)
                                        .background(Color("secondary"))
                                        .cornerRadius(48)
                                }

                            }
                            .padding(.horizontal)
                        }
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Hospital_Previews: PreviewProvider {
    static var previews: some View {
        Hospital()
    }
}
