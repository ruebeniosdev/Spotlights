//
//  disableWithOpacity.swift
//  Spotlights
//
//  Created by Rueben on 15/04/2023.
//

import Foundation
import SwiftUI

extension View {
    func disableWithOpacity(_ condition: Bool) -> some View {
        self.disabled(condition)
            .opacity(condition ? 0.5 : 1.0)
    }
}
