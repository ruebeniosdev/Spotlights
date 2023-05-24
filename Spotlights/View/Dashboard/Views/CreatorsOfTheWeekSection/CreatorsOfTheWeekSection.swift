//
//  CreatorsOfTheWeekSection.swift
//  Spotlights
//
//  Created by Rueben on 24/05/2023.
//

import SwiftUI

struct CreatorsOfTheWeekSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
                    Text("Creators of the week")
                        .font(.custom("Poppins-SemiBold", size: 20))
                    
                    HStack(spacing: 11) {
                        CreatorPeopleCard(title: "Pilotyras", check: "ccheck", image: "1")
                        CreatorPeopleCard(title: "Onipanua", check: "logo", image: "2")
                    }
                    .frame(height: 182)
                }
                .padding(.horizontal)
                .foregroundColor(.white)
    }
}

struct CreatorsOfTheWeekSection_Previews: PreviewProvider {
    static var previews: some View {
        CreatorsOfTheWeekSection()
    }
}
