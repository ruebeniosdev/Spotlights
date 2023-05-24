//
//  ProjectsToSupportSection.swift
//  Spotlights
//
//  Created by Rueben on 24/05/2023.
//

import SwiftUI

struct ProjectsToSupportSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
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

struct ProjectsToSupportSection_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsToSupportSection()
    }
}
