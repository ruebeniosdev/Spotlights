//
//  CustomCorners.swift
//  VPN
//
//  Created by Rueben on 04/12/2022.
//

import SwiftUI

struct CustomCorners: Shape {
    var radius: CGFloat
    var corners: UIRectCorner
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii:
                                    CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func getRect() -> CGRect {
        UIScreen.main.bounds
    }
    func getSafeArea()->UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        return safeArea
    }
}
