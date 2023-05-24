//
//  GiftersOfTheWeekSection.swift
//  Spotlights
//
//  Created by Rueben on 24/05/2023.
//

import SwiftUI

struct GiftersOfTheWeekSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
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
        }
        .foregroundColor(.white)
    }
}

struct GiftersOfTheWeekSection_Previews: PreviewProvider {
    static var previews: some View {
        GiftersOfTheWeekSection()
    }
}
