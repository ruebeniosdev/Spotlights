//
//  DoneButton.swift
//  Spotlights
//
//  Created by Rueben on 24/05/2023.
//

import SwiftUI

struct DoneButton: View {
    @ObservedObject var viewModel: AuthViewModel
    var dismiss: DismissAction
    var body: some View {
        Button {
            handleDoneButtonTap()
        } label: {
            Text("Done")
                .font(.subheadline)
                .fontWeight(.bold)
        }
        .disabled(viewModel.fullname.isEmpty || viewModel.username.isEmpty)
        
        
    }
    private func handleDoneButtonTap() {
        viewModel.updateUserProfilePicture()
        viewModel.updateUsername(newUsername: viewModel.username)
        viewModel.updateFullname(newFullname: viewModel.fullname) { success in
            if success {
                Task {
                    await viewModel.fetchUserData()
                }
                viewModel.showSuccessAlert = true
                dismiss()
            } else {
                viewModel.showAlert = true
                viewModel.showSuccessAlert = false
            }
        }
    }
    
}

//struct DoneButton_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack {
//            DoneButton(viewModel: AuthViewModel(), dismiss: {})
//        }
//        
//    }
//}
