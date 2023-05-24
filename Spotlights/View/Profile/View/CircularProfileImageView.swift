//
//  CircularProfileImageView.swift
//  Spotlights
//
//  Created by Rueben on 21/05/2023.
//

import SwiftUI
import SDWebImageSwiftUI


enum ProfileImageSize {
    case xSmall
    case small
    case medium
    case large
    
    var dimension: CGFloat {
        switch self {
        case .xSmall:
            return 40
        case .small:
            return 48
        case .medium:
            return 64
        case .large:
            return 80
        }
    }
}

struct CircularProfileImageView: View {
    @ObservedObject var viewModel: AuthViewModel
    let size: ProfileImageSize
    var body: some View {
        if let profileURL = viewModel.myProfile?.userProfileURL,
           let url = URL(string: profileURL) {
            ZStack {
                WebImage(url: url)
                    .resizable()
                    .scaledToFill()
                    .frame(width: size.dimension, height: size.dimension)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(LinearGradient(colors: [.red,.purple,.red,.orange,.yellow,.orange], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.3)
                    }
                
                ZStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 25, height: 25)
                    
                    Image(systemName: "plus")
                        .font(Font.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                    
                    Circle().stroke(Color.white, lineWidth: 2)
                        .frame(width: 25, height: 25)
                }
                .offset(x: 35, y: 30)
            }
            
        } else {
            ZStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .foregroundColor(Color(.systemGray4))
                    .overlay {
                        Circle()
                            .stroke(LinearGradient(colors: [.red,.purple,.red,.orange,.yellow,.orange], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.3)
                    }
                ZStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 25, height: 25)
                    
                    Image(systemName: "plus")
                        .font(Font.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                    
                    Circle().stroke(Color.white, lineWidth: 2)
                        .frame(width: 25, height: 25)
                }
                .offset(x: 35, y: 30)
            }
        }
            
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(viewModel: AuthViewModel(), size: .large)
    }
}
