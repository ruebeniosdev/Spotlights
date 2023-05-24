//
//  ButtonsSection.swift
//  Spotlights
//
//  Created by Rueben on 24/05/2023.
//

import SwiftUI

struct ButtonsSection: View {
    @ObservedObject var vm: SpotlightViewModel
    var body: some View {
        HStack(spacing: 16) {
            Button {
                vm.isButton1Selected = true
                vm.isButton2Selected = false
                withAnimation() {
                    vm.isView1Visible = true
                }
            } label: {
                VStack(spacing: 18) {
                    Image("maximize")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    Text("Creator")
                        .font(.custom("Poppins-Medium", size: 16))
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .frame(height: 162)
                .background(vm.isButton1Selected ? Color("asterisk 2") : .white)
                .cornerRadius(8)
                .overlay(alignment: .topLeading) {
                    Rectangle()
                        .fill(Color("asterisk 2"))
                        .frame(width: 24, height: 23)
                        .clipShape(CustomCorners(radius: 8, corners: [.topLeft, .bottomRight]))
                        .clipped()
                }
            }
            
            Button {
                vm.isButton1Selected = false
                vm.isButton2Selected = true
                withAnimation {
                    vm.isView1Visible = false
                }
            } label: {
                ZStack(alignment: .topLeading) {
                    VStack(spacing: 18) {
                        Image("3square")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        Text("Gifter")
                            .font(.custom("Poppins-Medium", size: 16))
                    }
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .frame(height: 162)
                    .background(vm.isButton2Selected ? Color("primary") : .white)
                    .cornerRadius(8)
                    .overlay(alignment: .topLeading) {
                        Rectangle()
                            .fill(Color("primary"))
                            .frame(width: 24, height: 23)
                            .clipShape(CustomCorners(radius: 8, corners: [.topLeft, .bottomRight]))
                            .clipped()
                    }
                }
            }

            
        }
        .padding(.top)
    }
}

struct ButtonsSection_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsSection(vm: SpotlightViewModel())
    }
}
