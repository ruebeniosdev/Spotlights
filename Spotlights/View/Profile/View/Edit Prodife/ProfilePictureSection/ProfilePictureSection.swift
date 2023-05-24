//
//  ProfilePictureSection.swift
//  Spotlights
//
//  Created by Rueben on 24/05/2023.
//

import SwiftUI

struct ProfilePictureSection: View {
    @ObservedObject var viewModel: AuthViewModel
    @State private var scale: CGFloat = 0.5
    var body: some View {
        Button {
            viewModel.isPresentingImagePicker.toggle()
        } label: {
            VStack {
                if (viewModel.myProfile?.userProfileURL) != nil {
                    CircularProfileImageView(viewModel: viewModel, size: .large)
                        .scaleEffect(scale)
                        .animation(.easeInOut(duration: 0.1).delay(0.3), value: scale)
                        .onAppear {
                            scale = 1.0
                        }
                } else {
                    CircularProfileImageView(viewModel: viewModel, size: .large)
                }
                
                Text("Edit profile picture")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical, 18)
                
                Divider()
            }
            .padding(.vertical, 8)
        }
        
    }
}

struct ProfilePictureSection_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePictureSection(viewModel: AuthViewModel())
    }
}
