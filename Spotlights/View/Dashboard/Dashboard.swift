//
//  Dashboard.swift
//  Spotlights
//
//  Created by Rueben on 11/04/2023.
//

import SwiftUI

struct Dashboard: View {
    
    @Binding var showSlideMenu: Bool
    
    var body: some View {
        ZStack {
            Color("bg")
            VStack(spacing: 0) {
                Header(title: "Spotlights", action: {showSlideMenu = true})
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment:  .leading,spacing: 24) {
                        VStack(alignment:  .leading,spacing: 24) {
                            Text("Gifters of the week")
                                .font(.custom("Poppins-SemiBold", size: 20))
                                .padding(.top)
                                .padding(.horizontal)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    GiftersofWeek(image: "gifters", name: "JoeOkat", checkmarkType: true)
                                    GiftersofWeek(image: "agatha", name: "Agathat", checkmarkType: false)
                                    GiftersofWeek(image: "1", name: "Pilotyras", checkmarkType: false)
                                    
                                }
                                .padding(.horizontal)
                            }
                            .foregroundColor(.white)
                            VStack(alignment:  .leading,spacing: 24) {
                                Text("Creators of the week")
                                    .font(.custom("Poppins-SemiBold", size: 20))
                                   
                                HStack(spacing: 11) {
                                    CreatorPeopleCard(title: "Pilotyras", check: "ccheck", image: "1")
                                    CreatorPeopleCard(title: "Onipanua", check: "logo", image: "2")
                                }
                                .frame(height: 182)
                            }
                            .padding(.horizontal)
                          
                        }
                    
                        .foregroundColor(.white)
                       
                        VStack(alignment:  .leading,spacing: 24) {
                            Text("Projects to support")
                                .font(.custom("Poppins-SemiBold", size: 20))
                                .padding(.horizontal)
                            ScrollView(.vertical, showsIndicators: false) {
                                VStack(spacing: 11) {
                                    HStack(spacing: 11) {
                                        NavigationLink {
                                            OrphanageDetailView()
                                        } label: {
                                            ProjectCard(title: "Orphanage", image: "magic-star", bgcolor: Color("offwhite"))
                                        }
                                        
                                        NavigationLink {
                                            BusinessDetailVIew()
                                        } label: {
                                            ProjectCard(title: "Business", image: "presention-chart", bgcolor: Color("accent"))
                                        }
                                    }
                                    HStack(spacing: 11) {
                                        NavigationLink {
                                            SchoolDetail()
                                        } label: {
                                            ProjectCard(title: "School", image: "teacher", bgcolor: Color("primary"))
                                        }
                                        
                                        
                                        NavigationLink {
                                            Hospital()
                                        } label: {
                                            ProjectCard(title: "Hospitality", image: "hospital", bgcolor: Color("accent3"))
                                        }
                                    }
                                  
                                }
                                .padding(.horizontal)
                            }
                        }
                        .foregroundColor(.white)
                       
                    }
                   
                  
                }
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
        }
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            Dashboard(showSlideMenu: .constant(false))
        }
    }
}
