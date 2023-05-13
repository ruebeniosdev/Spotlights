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
                    VStack(spacing: 26) {
                        LazyHStack(spacing: 40) {
                            ForEach(Category.allCases,id: \.rawValue) { category in
                                Button {
                                    withAnimation(.easeInOut) {
                                        selectedCateogry = category
                                    }
                                } label: {
                                    Text(category.rawValue)
                                        .font(.custom("Poppins-SemiBold", size: 16))
                                        .foregroundColor(selectedCateogry == category ? Color("accent") : .gray)
                                        .overlay(alignment: .bottom) {
                                            ZStack {
                                                if selectedCateogry == category {
                                                    Capsule()
                                                        .matchedGeometryEffect(id: "category", in: animation)
                                                        .foregroundColor(Color("accent"))
                                                        .frame(height: 2)
                                                        .padding(.horizontal)
                                                } else {
                                                    Capsule()
                                                        .fill(Color.clear)
                                                        .frame(height: 2)
                                                        .padding(.horizontal)
                                                }
                                            }
                                        }
                                }
                            }
                        }
                        .padding(.top)
                        ZStack {
                            if selectedCateogry == .creator {
                                ExploreCreator()
                                    .transition(.identity)
                            } else if selectedCateogry == .gifters {
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
        }
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore(showSlideMenu: .constant(false))
    }
}
