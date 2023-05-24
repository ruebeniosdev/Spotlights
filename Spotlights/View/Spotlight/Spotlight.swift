//
//  Spotlight.swift
//  Spotlights
//
//  Created by Rueben on 11/04/2023.
//

import SwiftUI

struct Spotlight: View {
    @StateObject var vm =
    SpotlightViewModel()
    @Binding var showSlideMenu: Bool
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bg")
                VStack(spacing: 0) {
                    Header(title: "Get Spotlights", action: {showSlideMenu = true})
                    ScrollView(.vertical, showsIndicators: false) {
                        SpotlightContent(vm: vm)
                    }
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
                
            }
            .onTapGesture {
                vm.closeKeyboard() // Dismiss the keyboard
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct Spotlight_Previews: PreviewProvider {
    static var previews: some View {
        Spotlight(showSlideMenu: .constant(false))
    }
}


