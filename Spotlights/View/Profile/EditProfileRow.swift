//
//  EditProfileRow.swift
//  Spotlights
//
//  Created by Rueben on 13/05/2023.
//

import SwiftUI

struct EditProfileRow: View {
    let title:  String
    let placeholder: String
    @Binding var text: String
    var body: some View {
        HStack {
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
            VStack {
                TextField(placeholder, text: $text,prompt: Text(placeholder).foregroundColor(.white.opacity(0.7)).font(.footnote))
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}

struct EditProfileRow_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileRow(title: "", placeholder: "", text: .constant(""))
    }
}
