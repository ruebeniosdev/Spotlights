//
//  profileName.swift
//  Spotlights
//
//  Created by Rueben on 17/04/2023.
//

import SwiftUI

struct ProfileName: View {
    var user: User
    var body: some View {
        VStack(alignment: .leading) {
            Text(user.userFullname)
                .font(.custom("Poppins-Medium", size: 16))
                .foregroundColor(.white)
            Text(user.username)
                .font(.custom("Poppins-Medium", size: 12))
                .foregroundColor(Color("textfieldcolor"))
        }
    }
}
