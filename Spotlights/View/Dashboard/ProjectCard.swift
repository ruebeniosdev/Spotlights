//
//  ProjectCard.swift
//  Spotlights
//
//  Created by Rueben on 12/04/2023.
//

import SwiftUI

struct ProjectCard: View {
    var title: String
    var image: String
    var bgcolor: Color
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(bgcolor)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 1, y: 1)
            
            VStack(spacing: 10.24) {
                Image(image)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 19.38, height: 19.76)
                Text(title)
            }
            .foregroundColor(.black)
        }
        .frame(height: 100)

        
    }
}

struct ProjectCard_Previews: PreviewProvider {
    static var previews: some View {
        ProjectCard(title: "Orphanage", image: "magic-star", bgcolor: Color("offwhite"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
