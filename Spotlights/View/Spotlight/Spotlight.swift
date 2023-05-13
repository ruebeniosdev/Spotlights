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
                            VStack(alignment: .leading) {
                                HStack(spacing: 16) {
                                    Button {
                                        vm.isButton1Selected = true
                                        vm.isButton2Selected = false
                                        withAnimation() {
                                            vm.isView1Visible = true
                                        }
                                        
                                    } label: {
                                        VStack(spacing: 18) {
                                            Image("maximize")
                                                .renderingMode(.template)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 24, height: 24)
                                            Text("Creator")
                                                .font(.custom("Poppins-Medium", size: 16))
                                        }
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 162)
                                        .background(vm.isButton1Selected ? Color("asterisk 2") : .white)
                                        .cornerRadius(8)
                                        .overlay(alignment: .topLeading) {
                                            Rectangle()                            .fill(Color("asterisk 2"))
                                                .frame(width: 24, height: 23)
                                                .clipShape(CustomCorners(radius: 8, corners: [.topLeft, .bottomRight]))
                                                .clipped()
                                        }
                                        
                                    }
                                    Button {
                                        vm.isButton1Selected = false
                                        vm.isButton2Selected = true
                                        withAnimation {
                                            vm.isView1Visible = false
                                        }
                                    } label: {
                                        ZStack(alignment: .topLeading) {
                                            VStack(spacing: 18) {
                                                Image("3square")
                                                    .renderingMode(.template)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 24, height: 24)
                                                Text("Gifter")
                                                    .font(.custom("Poppins-Medium", size: 16))
                                            }
                                            .foregroundColor(.black)
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 162)
                                            .background(vm.isButton2Selected ? Color("primary") : .white)
                                            .cornerRadius(8)
                                            .overlay(alignment: .topLeading) {
                                                Rectangle()
                                                    .fill(Color("primary"))
                                                    .frame(width: 24, height: 23)
                                                    .clipShape(CustomCorners(radius: 8, corners: [.topLeft, .bottomRight]))
                                                    .clipped()
                                            }
                                        }
                                    }
                                }
                                .padding(.top)
                                
                                if vm.isButton1Selected || vm.isButton2Selected {
                                    if vm.isView1Visible {
                                        VStack(spacing: 16) {
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
                                                .padding(.top,36)
                                                .frame(maxWidth: .infinity,alignment: .center)
                                            
                                            ButtonMain(action: {}, title: "Get Spotlights")
                                        }
                                        .transition(.identity)
                                        .foregroundColor(.white)
                                        .padding(.top)
                                        
                                    } else {
                                        VStack(spacing: 16) {
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
                                                .padding(.top,36)
                                                .frame(maxWidth: .infinity,alignment: .center)
                                            
                                            ButtonMain(action: {}, title: "Get Spotlights")
                                        }
                                        .transition(.identity)
                                        .foregroundColor(.white)
                                        .padding(.top)
                                    }
                                }
                                
                                Spacer(minLength: 320)
                                
                                VStack {
                                    Text("NB: Choose creator if you are an entity\nlooking to promote your business or \nservice.")
                                        .font(.custom("Poppins-Italic", size: 16))
                                        .foregroundColor(.gray)
                                        .padding(.top,36)
                                        .frame(maxWidth: .infinity,alignment: .center)
                                    
                                    ButtonMain(action: {}, title: "Get Spotlights")
                                }
                                .opacity(vm.isButton1Selected || vm.isButton2Selected ? 0 : 1)
                            }
                            .padding(.horizontal)
                        }
                    }
                    .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
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


