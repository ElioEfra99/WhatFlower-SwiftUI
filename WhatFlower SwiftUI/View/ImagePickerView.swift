//
//  ImagePickerView.swift
//  WhatFlower SwiftUI
//
//  Created by Eliu Efraín Díaz Bravo on 11/11/21.
//

import Foundation
import SwiftUI
import CoreML
import Vision

struct ImagePickerView: UIViewControllerRepresentable {
    @EnvironmentObject var flower: FlowerObject
    @EnvironmentObject var modelData: ModelData
    @Binding var isPresented: Bool
    @Binding var isLoading: Bool
    @Binding var fetchingFailed: Bool
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let uiImagePicker = UIImagePickerController()
        uiImagePicker.sourceType = .camera
        uiImagePicker.allowsEditing = true
        uiImagePicker.delegate = context.coordinator
        return uiImagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate, FlowerServiceDelegate {
        
        let parent: ImagePickerView
        var flowerService = FlowerService()
        
        init(parent: ImagePickerView) {
            self.parent = parent
            super.init()
            flowerService.delegate = self
        }
        
        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let selectedImage = info[.editedImage] as? UIImage {
                guard let ciImage = CIImage(image: selectedImage) else { return }
                parent.isLoading = true
                detect(flowerImage: ciImage)
            }
        }
        
        func detect(flowerImage: CIImage) {
            guard let classifierModel = try? VNCoreMLModel(for: FlowerClassifier(configuration: .init()).model) else {
                fatalError("Could not setup CoreML model")
            }
            
            let request = VNCoreMLRequest(model: classifierModel) { request, error in
                guard let classification = request.results as? [VNClassificationObservation] else {
                    fatalError("Model failed to process image")
                }
                
                if let firstItem = classification.first {
                    let flowerName = firstItem.identifier
                    let flowerStoredInDevice = self.parent.modelData.flowers.contains(where: { $0.tag == flowerName })
                    
                    if flowerStoredInDevice {
                        let flower = self.retrieveFlowerFromDevice(with: flowerName)
                        self.moveFlowerData(flower)
                    } else {
                        self.flowerService.fetchFlower(flowerName: flowerName)
                    }
                }
            }
            
            let handler = VNImageRequestHandler(ciImage: flowerImage)
            
            do {
                try handler.perform([request])
            } catch {
                print("Failed performing requests with error: \(error)")
            }
        }
        
        //MARK: - FlowerService Delegate Methods
        
        func didFindFlower(_ flower: Flower) {
            moveFlowerData(flower, true)
        }
        
        func moveFlowerData(_ flower: Flower, _ isBackgroundTask: Bool = false) {
            if isBackgroundTask {
                DispatchQueue.main.async {
                    self.assignProperties(from: flower)
                }
            } else {
                assignProperties(from: flower)
            }
            
            parent.isPresented = false
            parent.isLoading = false
        }
        
        func assignProperties(from flower: Flower) {
            self.parent.flower.title = flower.title
            self.parent.flower.extract = flower.extract
            self.parent.flower.imageURL = flower.imageURL
            self.parent.flower.id = flower.id
            self.parent.flower.tag = flower.tag
            self.parent.flower.isFavorite = flower.isFavorite
        }
        
        func retrieveFlowerFromDevice(with tag: String) -> Flower {
            guard let index = self.parent.modelData.flowers.firstIndex(where: { $0.tag == tag }) else {
                fatalError("Could not find flower with name \(tag) stored in the device")
            }
            return self.parent.modelData.flowers[index]
        }
        
        func didFail(with error: Error) {
            print("Failed to retrieve flower data from wikipedia API, error: \(error)")
            
            parent.fetchingFailed = true
            parent.isPresented = false
            parent.isLoading = false
        }
    }
}
