//
//  Explore.swift
//  Spotlights
//
//  Created by Rueben on 11/04/2023.
//

import SwiftUI

struct Explore: View {
    @State private var selectedCateogry: Category = .gifters
    @Namespace var animation
    @Binding var showSlideMenu: Bool
    var body: some View {
        ZStack {
            Color("bg")
            VStack(spacing:  0) {
                Header(title: "Spotlights", action: {showSlideMenu = true})
                ScrollView(.vertical, showsIndicators: false) {
                  ExploreContent(selectedCategory: $selectedCateogry)
                }
            }
        }
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore(showSlideMenu: .constant(false))
    }
}
