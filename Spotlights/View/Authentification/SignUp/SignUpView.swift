//
//  SignUpView.swift
//  Spotlights
//
//  Created by Rueben on 29/04/2023.
//

import SwiftUI
import PhotosUI

struct SignUpView: View {
    @Environment(\.dismiss) var dismiss
    @FocusState private var focus: FocusableField?
    @ObservedObject var viewModel: AuthViewModel
    var body: some View {
        VStack {
            ViewThatFits {
                HelperView(viewModel: viewModel)
                ScrollView(.vertical, showsIndicators: false) {
                    HelperView(viewModel: viewModel)
                }
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .photosPicker(isPresented: $viewModel.isPresentingImagePicker, selection: $viewModel.photoItem)
        .onChange(of: viewModel.photoItem, perform: { newValue in
            // extracting UIImage from photoItem
            if let newValue {
                Task {
                    do {
                        guard let imageData = try await newValue.loadTransferable(type: Data.self)  else { return }
                        await MainActor.run(body: {
                            viewModel.userProfilePicData = imageData
                        })
                    } catch {
                        // dop something
                    }
                }
            }
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("bg").ignoresSafeArea())
        .alert(viewModel.errorMessage, isPresented: $viewModel.showError, actions: {})
        .overlay {
            LoadingView(show: $viewModel.isLoading)
        }
        .onTapGesture {
            viewModel.closeKeyboard() // Dismiss the keyboard
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewModel: AuthViewModel())
    }
}


