//
//  ProfileRow.swift
//  Spotlights
//
//  Created by Rueben on 16/04/2023.
//

import SwiftUI

struct ProfileRow: View {
    var body: some View {
        HStack {
            HStack(spacing: 16) {
                Button {
                    
                } label: {
                    ZStack {
                        Circle()
                            .fill(Color("primary"))
                        .frame(width: 40, height: 40)
                        
                        Text("J").font(.custom("Poppins-Medium", size: 18.3)).tracking(-0.14)
                            .foregroundColor(.black)
                    }
                }

                
                VStack(alignment: .leading) {
                    Text("Joe Okat")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(.white)
                    Text("joeokat")
                        .font(.custom("Poppins-Medium", size: 12))
                        .foregroundColor(Color("textfieldcolor"))
                }
                Spacer()
                Image(systemName: "checkmark")
                    .foregroundColor(Color("textfieldcolor"))
            }
            .frame(height: 40)
        }
        .padding(22)
        .frame(maxWidth: .infinity,alignment: .leading)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 7)
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
            }
        )
    }
}

struct ProfileRow_Previews: PreviewProvider {
    static var previews: some View {
        ProfileRow()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
