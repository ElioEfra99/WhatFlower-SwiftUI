//
//  ImagePickerView.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 11/11/21.
//

import Foundation
import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let uiImagePicker = UIImagePickerController()
        // Couple lines to enable using image picker in physical device
//        uiImagePicker.sourceType = .camera
//        uiImagePicker.allowsEditing = true
        uiImagePicker.delegate = context.coordinator
        return uiImagePicker
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePickerView
        init(parent: ImagePickerView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                // Use the selected image to trigger detection
                print(selectedImage)
            }
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
}
