//
//  ExploreCreator.swift
//  Spotlights
//
//  Created by Rueben on 12/04/2023.
//

import SwiftUI

struct ExploreCreator: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                VStack {
                    Text("Creators and gifters we follow who \nsupport") + Text(" #ProjectNhyira").foregroundColor(Color("accent"))
                        .font(.custom("Poppins-Medium", size: 16))
                }
                .padding(.horizontal)
                VStack(alignment: .leading, spacing: 24) {
                    HStack(spacing: 10) {
                        Text("Top 10 Creators")
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(Color("asterisk"))
                    }
                    .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            Image("1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 141.51, height: 141.51)
                                .cornerRadius(8)
                            Image("2")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 141.51, height: 141.51)
                                .cornerRadius(8)
                            Image("3")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 141.51, height: 141.51)
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                    }
                }
                VStack(alignment: .leading, spacing: 24){
                    HStack(spacing: 10) {
                        Text("Innovative Startups")
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(Color("asterisk"))
                    }
                    .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            Image("fle")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 141.51, height: 141.51)
                                .cornerRadius(8)
                            Image("cake")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 141.51, height: 141.51)
                                .cornerRadius(8)
                            Image("cake2")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 141.51, height: 141.51)
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                    }
                }
                VStack(alignment: .leading, spacing: 24){
                    HStack(spacing: 10) {
                        Text("Current Project Sponsors")
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(Color("asterisk"))
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color("accent"))
                    }
                    .padding(.horizontal)
                        HStack(spacing: 16) {
                            ForEach(0..<2) { _ in
                                CurrentPro()
                                    .frame(height: 162)
                            }
                        }
                        .padding(.horizontal)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 1, y: 1)
                    ButtonMain(action: {}, title: "Get Spotlights")
                }
            }
            .foregroundColor(.white)
        }
    }
}

struct ExploreCreator_Previews: PreviewProvider {
    static var previews: some View {
        ExploreCreator()
            .previewLayout(.sizeThatFits)
        // .padding()
    }
}
