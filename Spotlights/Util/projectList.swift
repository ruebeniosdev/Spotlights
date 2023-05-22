//
//  projectList.swift
//  Spotlights
//
//  Created by Rueben on 13/04/2023.
//

import SwiftUI

struct ProjectList: View {
    var body: some View {
        VStack {
            DropDownMenu(viewModel: SpotlightViewModel())
        }
    }
}

struct ProjectList_Previews: PreviewProvider {
    static var previews: some View {
        ProjectList()
    }
}
