//
//  SpotlightContent.swift
//  Spotlights
//
//  Created by Rueben on 24/05/2023.
//

import SwiftUI

struct SpotlightContent: View {
    @ObservedObject var vm: SpotlightViewModel
    var body: some View {
        VStack(alignment: .leading) {
            ButtonsSection(vm: vm)
            
            if vm.isButton1Selected || vm.isButton2Selected {
                SelectedButtonContent(vm: vm)
            }
            
            Spacer(minLength: 320)
            
            VStack {
                Text("NB: Choose creator if you are an entity\nlooking to promote your business or \nservice.")
                    .font(.custom("Poppins-Italic", size: 16))
                    .foregroundColor(.gray)
                    .padding(.top, 36)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                ButtonMain(action: {}, title: "Get Spotlights")
            }
            .opacity(vm.isButton1Selected || vm.isButton2Selected ? 0 : 1)
        }
        .padding(.horizontal)
    }
}

struct SpotlightContent_Previews: PreviewProvider {
    static var previews: some View {
        SpotlightContent(vm: SpotlightViewModel())
    }
}
