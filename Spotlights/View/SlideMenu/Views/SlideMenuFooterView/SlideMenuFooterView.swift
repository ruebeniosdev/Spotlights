//
//  SlideMenuFooterView.swift
//  Spotlights
//
//  Created by Rueben on 24/05/2023.
//

import SwiftUI

struct SlideMenuFooterView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Version: 1.1.0")
                .font(.custom("Poppins-Menium", size: 16))
                .foregroundColor(Color("accent"))
                .padding(.bottom)
        }
    }
}

struct SlideMenuFooterView_Previews: PreviewProvider {
    static var previews: some View {
        SlideMenuFooterView()
    }
}
