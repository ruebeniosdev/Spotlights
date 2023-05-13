//
//  dropDownMenu.swift
//  Spotlights
//
//  Created by Rueben on 13/04/2023.
//

import SwiftUI

struct DropDownMenu: View {
    let options: [String]
    @Binding var selectedOption: String
    @State private var showOptions = false
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 0) {
                Text("Project")
                Text(" *")
                    .foregroundColor(Color("asterisk"))
                    .font(.custom("Inter-Medium", size: 16))
            }
            VStack(alignment: .leading) {
                HStack {
                    Text(selectedOption)
                        .font(.custom("Inter-Medium", size: 16))
                        .foregroundColor(Color("textfieldcolor"))
                        .padding()
                        .frame(height: 56)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .overlay(alignment: .trailing) {
                            Image(systemName: showOptions ? "chevron.up" : "chevron.down")
                                .resizable()
                                .frame(width: 12, height: 6, alignment: .center)
                                .foregroundColor(Color("secondary"))
                                .rotationEffect(.degrees(showOptions ? 360 : 0))
                                .rotation3DEffect(.degrees(showOptions ? 180 : 0), axis: (x: 0, y: 0, z: 1))
                                .animation(.easeInOut, value: showOptions)
                                .padding()
                        }
                }
                if showOptions {
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(options, id: \.self) { option in
                            Button {
                                withAnimation(.easeInOut) {
                                    self.selectedOption = option
                                    self.showOptions = false
                                }
                            } label: {
                                Text(option)
                                    .font(.custom("Inter-Medium", size: 16))
                                    .foregroundColor(.black)
                                    .padding(.horizontal, 15)
                                    .padding(.bottom, 5)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .background(Color("offwhite"))
            .cornerRadius(5)
            .onTapGesture {
                withAnimation(.easeInOut) {
                    self.showOptions.toggle()
                }
            }
        }
    }
}

struct DropDownMenu_Previews: PreviewProvider {
    static var previews: some View {
        DropDownMenu(options: [], selectedOption: .constant("Select which projects to support"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
struct DropDownOption: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
}

extension DropDownOption {
    static let testingOption: DropDownOption = DropDownOption(option: "Select which projects to support")
    static let testAllProject: [DropDownOption] = [
        DropDownOption(option: "Orphanage"),
        DropDownOption(option: "Business"),
        DropDownOption(option: "School"),
        DropDownOption(option: "Hospitality")
    ]
}
