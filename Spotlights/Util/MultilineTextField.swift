//
//  MultilineTextField.swift
//  TwitterClone
//
//  Created by Rueben on 24/11/2022.
//

import Foundation
import SwiftUI

struct MultilineTextfield: UIViewRepresentable {
    func makeCoordinator() -> MultilineTextfield.Coordinator {
        return MultilineTextfield.Coordinator(parent: self)
    }
    
    
    @Binding var tweet: String
    
    func makeUIView(context: Context) -> UITextView {
        let text = UITextView()
        text.allowsEditingTextAttributes = true
        text.text = "Tell us how we can help"
        text.isUserInteractionEnabled = true
        text.textColor = .gray
        text.font = .systemFont(ofSize: 14)
        text.delegate = context.coordinator
        return text
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        
    }
    
  
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: MultilineTextfield
        
        init(parent: MultilineTextfield) {
            self.parent = parent
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            textView.text = ""
            textView.textColor = .label
         }
         
         func textViewDidChange(_ textView: UITextView) {
             self.parent.tweet = textView.text
         }
    }
    
   
}
