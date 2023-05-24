//
//  SlideMenuOptionsRowView.swift
//  Spotlights
//
//  Created by Rueben on 24/05/2023.
//

import SwiftUI

struct SlideMenuOptionsRowView: View {
    let viewModel: slidemenuModel
    @Binding var showAboutUs: Bool
    @Binding var showContactUs: Bool
    @ObservedObject var vm: AuthViewModel
    var body: some View {
        Group {
            if viewModel == .spotlight {
                NavigationLink(destination: ContentView(index: Tab.explore), label: {
                    SlideMenuOptionRowView(viewModel: viewModel)
                })
            } else if viewModel == .contactus {
                Button(action: {
                    showContactUs.toggle()
                }) {
                    SlideMenuOptionRowView(viewModel: viewModel)
                }
            } else if viewModel == .about {
                Button(action: {
                    showAboutUs.toggle()
                }) {
                    SlideMenuOptionRowView(viewModel: viewModel)
                }
            } else if viewModel == .signout {
                Button(action: {
                    vm.showLogOutDailogBox.toggle()
                }) {
                    SlideMenuOptionRowView(viewModel: viewModel)
                }
                .alert("Are you sure you want to log out?", isPresented: $vm.showLogOutDailogBox) {
                    Button(role: .destructive) {
                        vm.signOut()
                    } label: {
                        SlideMenuOptionRowView(viewModel: viewModel)
                    }
                }
            } else if viewModel == .share {
                Button(action: {
                    if let image = UIImage(named: "logo") {
                        let subject = "Check out Spotlights"
                        let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
                        activityVC.setValue(subject, forKey: "subject")
                        
                        if let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                            if let rootViewController = windowScene.windows.first?.rootViewController {
                                rootViewController.present(activityVC, animated: true, completion: nil)
                            }
                        }
                    }
                }) {
                    SlideMenuOptionRowView(viewModel: viewModel)
                }
            } else {
                SlideMenuOptionRowView(viewModel: viewModel)
            }
        }
    }
}

//struct SlideMenuOptionsRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        SlideMenuOptionsRowView()
//    }
//}
