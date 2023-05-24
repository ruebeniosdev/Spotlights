//
//  CategoryButtons.swift
//  Spotlights
//
//  Created by Rueben on 24/05/2023.
//

import SwiftUI

struct CategoryButtons: View {
    @Binding var selectedCategory: Category
    var animation: Namespace.ID
    var body: some View {
        LazyHStack(spacing: 40) {
            ForEach(Category.allCases, id: \.rawValue) { category in
                Button {
                    withAnimation(.easeInOut) {
                        selectedCategory = category
                    }
                } label: {
                    Text(category.rawValue)
                        .font(.custom("Poppins-SemiBold", size: 16))
                        .foregroundColor(selectedCategory == category ? Color("accent") : .gray)
                        .overlay(alignment: .bottom) {
                            ZStack {
                                if selectedCategory == category {
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
    }
}


