//
//  CancelButton.swift
//  Spotlights
//
//  Created by Rueben on 24/05/2023.
//

import Foundation
import SwiftUI

struct CancelButton: View {
    var dismiss: DismissAction
    var body: some View {
        Button("Cancel") {
            dismiss()
        }
        .foregroundColor(.primary)
    }
}
