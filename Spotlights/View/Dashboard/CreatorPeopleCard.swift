//
//  CreatorPeopleCard.swift
//  Spotlights
//
//  Created by Rueben on 12/04/2023.
//

import SwiftUI

struct CreatorPeopleCard: View {
    var title: String
    var check: String
    var image: String
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(image)
                .resizable()
                .cornerRadius(8)
            //  .frame(width: 162)
                .scaledToFill()
            HStack(spacing: 10) {
                Text(title)
                    .font(.custom("Poppins-SemiBold", size: 14))
                    .foregroundColor(.white)
                Image(check)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }
            .padding(.horizontal, 8)
            .frame(width: 162, height: 40, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                Rectangle()
                    .fill(LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color(#colorLiteral(red: 0.09019608050584793, green: 0.09803921729326248, blue: 0.10980392247438431, alpha: 1)), location: 0),
                            .init(color: Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 0)), location: 1)]),
                        startPoint: UnitPoint(x: 6.661338147750939e-16, y: 0),
                        endPoint: UnitPoint(x: 1.0000000149011583, y: 0.9999997555836817)))
            )
        }
        .frame(maxWidth: .infinity)
       // .cornerRadius(8)
    }
}

struct CreatorPeopleCard_Previews: PreviewProvider {
    static var previews: some View {
        CreatorPeopleCard(title: "Pilotyras", check: "ccheck", image: "1")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
