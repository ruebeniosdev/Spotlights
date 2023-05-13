//
//  projectList.swift
//  Spotlights
//
//  Created by Rueben on 13/04/2023.
//

import SwiftUI

struct ProjectList: View {
    @State private var selectedOption = "Select which projects to support"
       let options = ["Orphanage", "Business", "School", "Hospitality"]
    var body: some View {
        VStack {
            DropDownMenu(options: options, selectedOption: $selectedOption)
        }
    }
}

struct ProjectList_Previews: PreviewProvider {
    static var previews: some View {
        ProjectList()
    }
}
