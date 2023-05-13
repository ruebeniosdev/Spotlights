//
//  CurrentPro.swift
//  Spotlights
//
//  Created by Rueben on 13/04/2023.
//

import SwiftUI

struct CurrentPro: View {
    var body: some View {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color("offwhite"))
                .frame(maxWidth: .infinity)
    }
}

struct CurrentPro_Previews: PreviewProvider {
    static var previews: some View {
        CurrentPro()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
