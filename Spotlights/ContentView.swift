//
//  ContentView.swift
//  Spotlights
//
//  Created by Rueben on 11/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State var index: Tab = .dashboard
    @State  var showSlideMenu: Bool = false
    @State  var showAboutUs: Bool = false
    var body: some View {
        NavigationStack {
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                TabView(selection: $index) {
                    Dashboard(showSlideMenu: $showSlideMenu)
                        .tabItem {
                            Image("home")
                                .renderingMode(.template)
                        }
                        .tag(Tab.dashboard)
                    Explore(showSlideMenu: $showSlideMenu)
                        .tabItem {
                            Image("compass")
                                .renderingMode(.template)
                        }
                        .tag(Tab.explore)
                    Spotlight(showSlideMenu: $showSlideMenu)
                        .tabItem {
                            Image("+")
                                .renderingMode(.template)
                        }
                        .tag(Tab.spotlight)
                    Profile(viewModel: AuthViewModel())
                        .tabItem {
                            Image("user")
                                .renderingMode(.template)
                        }
                        .tag(Tab.profile)
                }
                .tint(Color("accent"))
                if showSlideMenu {
                    ZStack {
                        Color.black.opacity(showSlideMenu ? 0.25 : 0.0)
                            .transition(.identity)
                            .onTapGesture {
                                withAnimation {
                                    showSlideMenu = false
                                }
                            }
                    }
                    .ignoresSafeArea()
                }
                SlideMenuView(showSlideMenu: $showSlideMenu, showAboutUs: $showAboutUs, viewModel: AuthViewModel())
                    .frame(width: 302)
                    .offset(x: showSlideMenu ? 0 : -UIScreen.main.bounds.width, y: 0)
                    .rotation3DEffect(Angle(degrees: showSlideMenu ? 0 : 15), axis: (x: 0, y: 20, z: 0))
                    .animation(.default, value: showSlideMenu)
            }
            .overlay {
                if showAboutUs {
                    ZStack {
                        Color("bg").opacity(0.5)
                            .ignoresSafeArea()
                        AboutView(showAboutUs: $showAboutUs)
                            .transition(.move(edge: .bottom))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            showAboutUs = false
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("")
            .onAppear {
                showSlideMenu = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
