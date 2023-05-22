//
//  CustomDialog.swift
//  Spotlights
//
//  Created by Rueben on 17/04/2023.
//

import SwiftUI

struct CustomDialog: View {
    @Binding var isActive: Bool
    let icon: String
    let message: String
    let buttonTitle: String
    let action: () ->()
    @State private var offset: CGFloat = 1000
    var body: some View {
        ZStack {
            Color("bg").opacity(0.25)
                .ignoresSafeArea()
                .onTapGesture {
                    close()
                }
            VStack(spacing: 15) {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color("asterisk 2"))
                Text(message)
                    .font(.custom("Poppins-Regular", size: 17))
                    .multilineTextAlignment(.center)
                    .frame(width: 284, height: 130)
                Button {
                    action()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14.67)
                            .fill(Color(#colorLiteral(red: 0.08235294371843338, green: 0.08235294371843338, blue: 0.08235294371843338, alpha: 1)))

                            RoundedRectangle(cornerRadius: 14.67)
                            .strokeBorder(Color(#colorLiteral(red: 0.9803921580314636, green: 0.9803921580314636, blue: 0.9803921580314636, alpha: 0.6000000238418579)), lineWidth: 0.9166666865348816)
                        Text(buttonTitle)
                            .font(.custom("Poppins-medium", size: 15.58))
                            .foregroundColor(Color("asterisk 2"))
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 285, height: 48)
                }

            }
            .foregroundColor(.black)
            .padding(.horizontal, 22)
            .padding(.vertical, 32)
            .background(
                RoundedRectangle(cornerRadius: 32)
                    .fill(Color("offwhite"))
            )
            .fixedSize(horizontal: false, vertical: true)
            .clipShape( RoundedRectangle(cornerRadius: 32))
            .overlay {
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            close()
                        } label: {
                            Image(systemName: "xmark")
                                .font(.title2)
                        }
                        .tint(.black)
                    }
                    Spacer()
                }
                .padding()
            }
            .padding(30)
            .offset(x: 0, y: offset)
            .onAppear {
                withAnimation(.spring()) {
                    offset = 0
                }
            }
        }
    }
    func close() {
        withAnimation(.spring()) {
            offset = 1000
            isActive = false
        }
    }
}

//struct CustomDialog_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomDialog(isActive: .constant(false), icon: "star.circle.fill", message: "If you delete your account we will be unable to restore your information. You will also lose the opportunity to grow your social media accounts organically.", buttonTitle: "Yes, I Understand The Risk", action: {})
//    }
//}
