//
//  LoadingView.swift
//  Spotlights
//
//  Created by Rueben on 15/04/2023.
//

import SwiftUI

struct LoadingView: View {
    @Binding var show: Bool
    var body: some View {
        ZStack {
            if show {
                Group {
                    Rectangle()
                        .fill(.black.opacity(0.25))
                        .ignoresSafeArea()
                    
                    Loading()
                        .padding(15)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10,style: .continuous))
                    
                }
            }
            
        }
        .animation(.easeInOut(duration: 0.25), value: show)
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(show: .constant(false))
    }
}
