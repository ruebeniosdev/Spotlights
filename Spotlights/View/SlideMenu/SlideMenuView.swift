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
    @Binding  var showAboutUs: Bool
    // @Binding var index: Tab
    @ObservedObject var viewModel: AuthViewModel
    var body: some View {
        NavigationStack {
            ZStack {
                Color("sec")
                    .ignoresSafeArea()
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 28) {
                        HStack(spacing: 10) {
                            HStack {
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                Text("Spotlight")
                                    .font(.custom("Poppins-Medium", size: 24))
                            }
                            Spacer()
                            Button {
                                withAnimation(.easeInOut) {
                                    showSlideMenu = false
                                }
                            } label: {
                                Image("back")
                            }
                        }
                        .padding(.top)
                        Rectangle()
                            .fill(Color("offwhite").opacity(0.1))
                            .frame(height: 1)
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(spacing: 20) {
                                ForEach(slidemenuModel.allCases, id: \.rawValue) { slideOption in
                                    if slideOption == .spotlight {
                                        NavigationLink {
                                            ContentView(index: Tab.explore)
                                                .navigationBarBackButtonHidden(true)
                                        } label: {
                                            SlideMenuOptionRowView(viewModel: slideOption)
                                        }
                                    } else if slideOption == .contactus {
                                        Button {
                                            if let url = URL(string: "mailto:contact@spotlights.com"), UIApplication.shared.canOpenURL(url) {
                                                // The device can open the URL, so open it
                                                UIApplication.shared.open(url)
                                            } else {
                                                // The device cannot open the URL, so handle the error
                                                // For example, display an alert to the user
                                                if let rootViewController = UIApplication.keyWindow?.rootViewController {
                                                    let alert = UIAlertController(title: "Error", message: "We're sorry, there was a problem opening your email. The email server may be down or your dont have a email app on this device. Please try again later or download the email app from the Appstore.", preferredStyle: .alert)
                                                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                                                    alert.addAction(okAction)
                                                    rootViewController.present(alert, animated: true, completion: nil)
                                                }
                                            }
                                        } label: {
                                            SlideMenuOptionRowView(viewModel: slideOption)
                                        }
                                    } else if slideOption == .about {
                                        Button {
                                            showAboutUs.toggle()
                                        } label: {
                                            SlideMenuOptionRowView(viewModel: slideOption)
                                        }
                                    } else if slideOption == .signout {
                                        Button {
                                            viewModel.showLogOutDailogBox.toggle()
                                        } label: {
                                            SlideMenuOptionRowView(viewModel: slideOption)
                                        }
                                        .alert("Are you sure you want to log out?", isPresented: $viewModel.showLogOutDailogBox) {
                                            Button(role: .destructive) {
                                                viewModel.signOut()
                                            } label: {
                                                SlideMenuOptionRowView(viewModel: slideOption)
                                            }
                                        }
                                    } else if slideOption == .share {
                                        Button {
                                            if let image = UIImage(named: "logo") {
                                                let subject = "Check out Spotlights"
                                                let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
                                                activityVC.setValue(subject, forKey: "subject")
                                                // Get the current window scene
                                                if let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                                                    // Get the first window
                                                    if let rootViewController = windowScene.windows.first?.rootViewController {
                                                        rootViewController.present(activityVC, animated: true, completion: nil)
                                                    }
                                                }
                                            }
                                        } label: {
                                            SlideMenuOptionRowView(viewModel: slideOption)
                                        }
                                    }
                                    else {
                                        SlideMenuOptionRowView(viewModel: slideOption)
                                    }
                                }
                            }
                        }
                        
                        Spacer()
                        Text("Version: 1.1.0")
                            .font(.custom("Poppins-Menium", size: 16))
                            .foregroundColor(Color("accent"))
                            .padding(.bottom)
                    }
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    //.frame(width: UIScreen.main.bounds.width / 1.5)
                }
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
