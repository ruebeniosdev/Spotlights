//
//  CustomImage.swift
//  Spotlights
//
//  Created by Rueben on 12/04/2023.
//

import SwiftUI

struct CustomImage: View {
    var image: UIImage?
    var body: some View {
        if let image = image {
            ZStack {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
            }
        } else {
            ZStack {
                Image("imagePic")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 19)
                    .padding()
                    .frame(width: 80, height: 80)
                    .background(Color("offwhite"))
                    .clipShape(Circle())
            }
        }
    }
}

struct CustomImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomImage(image: nil)
    }
}
