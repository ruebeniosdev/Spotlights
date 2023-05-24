//
//  ExploreContent.swift
//  Spotlights
//
//  Created by Rueben on 24/05/2023.
//

import SwiftUI

struct ExploreContent: View {
    @Binding var selectedCategory: Category
    var body: some View {
        VStack(spacing: 26) {
            CategoryButtons(selectedCategory: $selectedCategory, animation: Namespace().wrappedValue)
            
            ZStack {
                if selectedCategory == .creator {
                    ExploreCreator()
                        .transition(.identity)
                } else if selectedCategory == .gifters {
                    VStack(alignment: .leading, spacing: 24) {
                        Text("Creators and gifters we follow who \nsupport") + Text(" #ProjectNhyira").foregroundColor(Color("accent"))
                            .font(.custom("Poppins-Medium", size: 16))
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .transition(.identity)
                }
            }
        }
    }
}

struct ExploreContent_Previews: PreviewProvider {
    static var previews: some View {
        ExploreContent(selectedCategory: .constant(.creator))
    }
}
