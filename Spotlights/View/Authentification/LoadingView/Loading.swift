//
//  Loading.swift
//  Spotlights
//
//  Created by Rueben on 16/04/2023.
//

import SwiftUI

struct Loading: View {
    @State var isAnimating = false
    @State var totalAngle = 0
    func foreverAnimation(_ thisDelay: Double = 0) -> Animation {
        return Animation.easeInOut(duration: 1)
            .repeatForever(autoreverses: false)
            .delay(thisDelay/10)
    }
    var body: some View {
        ZStack {
            ForEach(0..<5) { circleBtn in
                VStack {
                    Circle()
                        .fill(Color("accent").opacity(0.15))
                        .frame(width: 20, height: 20)
                       // .background(.red)
                    Spacer()
                }.frame(width: 70, height: 70)
                    .opacity(1 - (Double(circleBtn)/Double(5)))
                    .rotationEffect(Angle(degrees: self.isAnimating ? 360.0 : 0.0))
                    .animation(self.foreverAnimation(Double(circleBtn)), value: isAnimating)
                    .onAppear {
                        self.isAnimating = true
                    }
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                self.totalAngle  += 60
            }
        }
    }
}

struct Loading_Previews: PreviewProvider {
    static var previews: some View {
        Loading()
    }
}
