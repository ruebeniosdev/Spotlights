//
//  AboutView.swift
//  Spotlights
//
//  Created by Rueben on 16/04/2023.
//

import SwiftUI

struct AboutView: View {
    @Binding  var showAboutUs: Bool
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color("bg").opacity(0.5)
                .ignoresSafeArea()
            
            VStack {
                VStack(spacing: 16) {
                    Image("logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                    //Spotlight - discover, conn...
                    Text("Spotlight - discover, connect and grab gifters from your favorite social media platforms today.\nWe highlight influencers weekly for supporting our mission.")
                        .font(.custom("Poppins-Regular", size: 17))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                       
                    Button {
                        withAnimation() {
                            showAboutUs = false

                        }
//                        dismiss()
                    } label: {
                        VStack {
                            Text("Got it")
                                .font(.custom("Poppins-Medium", size: 15.6))
                                .foregroundColor(Color("accent"))
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 14.67)
                                        .fill(Color("sec"))
                                        .frame(width: 285, height: 48)
                            )
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 24)
                                .fill(Color("accent"))
                                .frame(width: 277, height: 32)
                                .padding(.top,10)
                                .blur(radius: 15)
                        )
                    }
                }
            }
            .padding(22)
            .frame(width: 330, height: 330)
            .background(
                RoundedRectangle(cornerRadius: 32)
                    .fill(.white)
            )
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(showAboutUs: .constant(false))
    }
}
