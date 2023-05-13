//
//  ReAuthenticateView.swift
//  Spotlights
//
//  Created by Rueben on 13/05/2023.
//

import SwiftUI

struct ReAuthenticateView: View {
    @ObservedObject var viewModel: AuthViewModel
    var body: some View {
        ZStack {
            Color("bg").opacity(0.4)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                CustomSecureField(nameAttach: "Password", password: $viewModel.password, placeHolder: "Enter your secure password")
                .textContentType(.password)  .padding(.horizontal)
                ButtonMain(action: {
                    viewModel.reauthenticateWithPassword(password: viewModel.password) { result in
                        viewModel.deleteAccount()
                    }
                }, title: "Authenticate")
                .padding(.horizontal,100)
            }
            .foregroundColor(.white)
            .frame(width: 350, height: 350)
             .background(Color("bg"))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 20)
        }
    }
}

struct ReAuthenticateView_Previews: PreviewProvider {
    static var previews: some View {
        ReAuthenticateView(viewModel: AuthViewModel())
    }
}
