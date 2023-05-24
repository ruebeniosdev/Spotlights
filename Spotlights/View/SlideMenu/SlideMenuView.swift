//
//  SlideMenuView.swift
//  Spotlights
//
//  Created by Rueben on 11/04/2023.
//

import SwiftUI

struct SlideMenuView: View {
    @Binding var showSlideMenu: Bool
    @State private var showContactUs = false
    @Binding var showAboutUs: Bool
    @ObservedObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("sec")
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    SlideMenuHeaderView(showSlideMenu: $showSlideMenu, showAboutUs: $showAboutUs)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 30) {
                            ForEach(slidemenuModel.allCases, id: \.rawValue) { slideOption in
                                SlideMenuOptionsRowView(viewModel: slideOption, showAboutUs: $showAboutUs, showContactUs: $showContactUs, vm: viewModel)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top)
                    }
                    
                    SlideMenuFooterView()
                }
                .foregroundColor(.white)
            }
        }
    }
}

struct SlideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SlideMenuView(showSlideMenu: .constant(false), showAboutUs: .constant(false), viewModel: AuthViewModel())
        }
    }
}

