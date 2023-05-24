//
//  SelectedButtonContent.swift
//  Spotlights
//
//  Created by Rueben on 24/05/2023.
//

import SwiftUI

struct SelectedButtonContent: View {
    @ObservedObject var vm: SpotlightViewModel
    var body: some View {
        VStack(spacing: 16) {
            if vm.isButton1Selected {
                CustomTextField(nameAttach: "URL", text: $vm.blog, placeHolder: "Add blog or website here")
                    .autocapitalization(.none)
                    .keyboardType(.URL)
                    .textContentType(.URL)
                ProjectList()
                CustomTextField(nameAttach: "Amount to gift", text: $vm.amount, placeHolder: "GHC")
                    .keyboardType(.decimalPad)
                
                Text("NB: Creators are ranked based on past\ninfluence or present contributions.")
                    .font(.custom("Poppins-Italic", size: 16))
                    .foregroundColor(.gray)
                    .padding(.top, 36)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                ButtonMain(action: {}, title: "Get Spotlights")
            } else {
                CustomGifterTextFileds(nameAttach: "Tiktok", text: $vm.tiktok, placeHolder: "Add tiktok handle", star: " *")
                    .keyboardType(.URL)
                    .textContentType(.URL)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .onChange(of: vm.tiktok) { newValue in
                        if !newValue.contains("tiktok.com/@") {
                            vm.tiktok = ""
                        }
                    }
                CustomGifterTextFileds(nameAttach: "Twitter", text: $vm.twitter, placeHolder: "Add twitter handle", star: "")
                    .keyboardType(.URL)
                    .textContentType(.URL)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .onChange(of: vm.twitter) { newValue in
                        if !newValue.contains("twitter.com/") {
                            vm.twitter = ""
                        }
                    }
                CustomGifterTextFileds(nameAttach: "Instagram", text: $vm.instagram, placeHolder: "Add instagram handle", star: "")
                    .keyboardType(.URL)
                    .textContentType(.URL)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .onChange(of: vm.instagram) { newValue in
                        if !newValue.contains("instagram.com/") {
                            vm.instagram = ""
                        }
                    }
                CustomGifterTextFileds(nameAttach: "Facebook", text: $vm.facebook, placeHolder: "Add facebook handle", star: "")
                    .keyboardType(.URL)
                    .textContentType(.URL)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .onChange(of: vm.facebook) { newValue in
                        if !newValue.contains("facebook.com/") {
                            vm.facebook = ""
                        }
                    }
                CustomGifterTextFileds(nameAttach: "Amount to gift", text: $vm.amountGifter, placeHolder: "GHC", star: " *")
                    .keyboardType(.decimalPad)
                
                Text("NB: Creators are ranked based on past\ninfluence or present contributions.")
                    .font(.custom("Poppins-Italic", size: 16))
                    .foregroundColor(.gray)
                    .padding(.top, 36)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                ButtonMain(action: {}, title: "Get Spotlights")
            }
        }
        .transition(.identity)
        .foregroundColor(.white)
        .padding(.top)
    }
}

struct SelectedButtonContent_Previews: PreviewProvider {
    static var previews: some View {
        SelectedButtonContent(vm: SpotlightViewModel())
    }
}
