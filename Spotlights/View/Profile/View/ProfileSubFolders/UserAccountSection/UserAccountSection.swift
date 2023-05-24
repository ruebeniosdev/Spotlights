//
//  UserAccountSection.swift
//  Spotlights
//
//  Created by Rueben on 24/05/2023.
//

import SwiftUI

struct UserAccountSection: View {
    @State private var showEdit = false
    @ObservedObject var viewModel: AuthViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("User Account")
                .font(.custom("Poppins-Medium", size: 16))
                .foregroundColor(Color("textfieldcolor"))
            HStack {
                Button {
                    showEdit.toggle()
                } label: {
                    HStack(spacing: 16) {
                        if let profile = viewModel.myProfile {
                            ReusableProfile(user: profile, viewModel: viewModel)
                                .refreshable {
                                    self.viewModel.myProfile = nil
                                    await viewModel.fetchUserData()
                                }
                        } else {
                            ProgressView()
                        }

                        Spacer()
                        Image(systemName: "checkmark")
                            .foregroundColor(Color("textfieldcolor"))
                    }
                    .frame(height: 40)
                }
                .fullScreenCover(isPresented: $showEdit) {
                    EditProfile(viewModel: viewModel)
                }
            }
            .padding(22)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                }
            )
        }
    }
}


struct UserAccountSection_Previews: PreviewProvider {
    static var previews: some View {
        UserAccountSection(viewModel: AuthViewModel())
    }
}
