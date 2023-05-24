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
                    VStack(spacing: 24) {
                        GiftersOfTheWeekSection()
                        CreatorsOfTheWeekSection()
                        ProjectsToSupportSection()
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
