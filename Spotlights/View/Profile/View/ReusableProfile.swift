//
//  ReusableProfile.swift
//  Spotlights
//
//  Created by Rueben on 17/04/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct ReusableProfile: View {
    var user: User
    @ObservedObject var viewModel: AuthViewModel
    var body: some View {
        HStack {
            if let profileURL = URL(string: user.userProfileURL ?? "") {
                WebImage(url: profileURL)
                    .resizable()
                    .placeholder {
                        ZStack {
                            Circle()
                                .fill(Color("primary"))
                                .frame(width: 40, height: 40)
                            Text(user.userFullname.prefix(1))
                                .font(.custom("Poppins-Medium", size: 18.3))
                                .tracking(-0.14)
                                .foregroundColor(.black)
                        }
                    }
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
            } else {
                ZStack {
                    Circle()
                        .fill(Color("primary"))
                        .frame(width: 40, height: 40)
                    
                    Text(user.userFullname.prefix(1))
                        .font(.custom("Poppins-Medium", size: 18.3))
                        .tracking(-0.14)
                        .foregroundColor(.black)
                }
            }
            
            
            VStack(alignment: .leading, spacing: 4) {
                if let fullname = viewModel.myProfile?.userFullname {
                    Text(fullname)
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(.white)
                }
                
                
                if let username = viewModel.myProfile?.username {
                    Text(username)
                        .font(.custom("Poppins-Medium", size: 12))
                        .foregroundColor(.secondary)
                }
                
            }
        }
        
    }
}

