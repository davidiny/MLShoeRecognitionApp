//
//  ImagePicker.swift
//  ViperLabs
//
//  Created by David Inyangson on 12/30/19.
//  Copyright © 2019 David Inyangson. All rights reserved.
//
import Foundation
import UIKit
import SwiftUI
import CoreML
import Vision
import ImageIO

struct ImagePicker: UIViewControllerRepresentable {
  @Binding var isVisible: Bool
  @Binding var image: Image?
  @Binding var prediction: String
  var sourceType: Int

  
  func makeCoordinator() -> Coordinator {
    Coordinator(isVisible: $isVisible, image: $image, prediction: $prediction)
  }
  
  func makeUIViewController(context: Context)  -> UIImagePickerController {
    let vc =  UIImagePickerController()
    vc.allowsEditing = true
    vc.sourceType = sourceType == 1 ? .photoLibrary : .camera
  
    
    vc.delegate = context.coordinator
    
    return vc
  }
  
  func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
     
  }
  
  class Coordinator: NSObject,  UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @Binding var isVisible: Bool
    @Binding var image: Image?
    @Binding var prediction: String

    
    init(isVisible: Binding<Bool>, image: Binding<Image?>, prediction: Binding<String>) {
      _isVisible =  isVisible
      _image = image
      _prediction = prediction
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      let uiimage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
      
      updateClassifications(for: uiimage)
      image = Image(uiImage: uiimage)
      isVisible = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
      isVisible = false
    }
    
    func classificationRequest() -> VNCoreMLRequest {
      do {
        /*
         Use the Swift class `MobileNet` Core ML generates from the model.
         To use a different Core ML classifier model, add it to the project
         and replace `MobileNet` with that model's generated Swift class.
         */
        let model = try VNCoreMLModel(for: ShoeSleuthModel().model)
        
        let request = VNCoreMLRequest(model: model, completionHandler: { [weak self] request, error in
          self?.processClassifications(for: request, error: error)
        })
        request.imageCropAndScaleOption = .centerCrop
        return request
      } catch {
        fatalError("Failed to load Vision ML model: \(error)")
      }
    }

    /// - Tag: PerformRequests
    func updateClassifications(for image: UIImage) {
      self.prediction = "Predicting..."

      guard let ciImage = CIImage(image: image) else { fatalError("Unable to create \(CIImage.self) from \(image).") }

      DispatchQueue.global(qos: .userInitiated).async {
        let handler = VNImageRequestHandler(ciImage: ciImage)
        do {
          try handler.perform([self.classificationRequest()])
        } catch {
          /*
           This handler catches general image processing errors. The `classificationRequest`'s
           completion handler `processClassifications(_:error:)` catches errors specific
           to processing that request.
           */
          print("Failed to perform classification.\n\(error.localizedDescription)")
        }
      }
    }

    /// Updates the UI with the results of the classification.
    /// - Tag: ProcessClassifications
    func processClassifications(for request: VNRequest, error: Error?) {
      DispatchQueue.main.async {
        guard let results = request.results else {
          self.prediction = "Unable to classify image.\n\(error!.localizedDescription)"
          return
        }
        // The `results` will always be `VNClassificationObservation`s, as specified by the Core ML model in this project.
        let classifications = results as! [VNClassificationObservation]
        
        if classifications.isEmpty {
          self.prediction = "Nothing recognized."
        } else {
          // Display top classifications ranked by confidence in the UI.
          let topClassifications = classifications.prefix(2)
          let shoeModel = topClassifications.map { classification in
            return String(classification.identifier)
          }
          let descriptions = topClassifications.map { classification in
            // Formats the classification for display; e.g. "(0.37) cliff, drop, drop-off".
            return [Double(classification.confidence)]
          }
          if shoeModel[0] == "Nike" {
            let modelConfidence = Double(descriptions[0][0])
            if modelConfidence > 0.70 {
              self.prediction = "We're Pretty Sure These are Nike Shoes"
            }
            else{
              self.prediction = "These Might Be Nike shoes"
            }
          }
          if shoeModel[0] == "Adidas" {
            let modelConfidence = Double(descriptions[0][0])
            if modelConfidence > 0.70 {
              self.prediction = "We're Pretty Sure These are Adidas Shoes"
            }
            else{
              self.prediction = "These Might Be Adidas shoes"
            }
          }
          if shoeModel[0] == "UnderArmour" {
            let modelConfidence = Double(descriptions[0][0])
            if modelConfidence > 0.70 {
              self.prediction = "We're Pretty Sure These are UnderArmour Shoes"
            }
            else{
              self.prediction = "These Might Be UnderArmour shoes"
            }
          }
        }
      }

    }
    
  }
  
  



}

 

