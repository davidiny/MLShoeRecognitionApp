//
//  PredictionView.swift
//  ViperLabs
//
//  Created by David Inyangson on 12/28/19.
//  Copyright © 2019 David Inyangson. All rights reserved.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct PredictionView: View {
   @State var showImagePicker: Bool = false
   @State var showActionSheet: Bool = false
   @State var image: Image?
   @State var sourceType: Int = 0
 
    var body: some View {
      ZStack {
      VStack{
        Group {
            // Network
            AnimatedImage(url: URL(string: "https://i.pinimg.com/originals/f0/5b/67/f05b6701811dfd9cfdc96456eadcf1ab.gif"))
            .onFailure(perform: { (error) in
                // Error
            })
          }.edgesIgnoringSafeArea(.top).overlay(
            VStack() {
              image?.resizable().frame(width: 300, height: 200).offset(y: -150)
          HStack{
            CameraButtonView(showActionSheet: $showActionSheet)
          }
          .frame(width: 150, height: 50).offset(y:-100)
        }
      )

      }.actionSheet(isPresented: $showActionSheet) { () -> ActionSheet in
        ActionSheet(title: Text("Select Image"), message: Text("Please select an image from the gallery or use the camera"), buttons: [ActionSheet.Button.default(Text("Camera"), action: {
          self.showImagePicker.toggle()
          self.sourceType = 0
        }),
        ActionSheet.Button.default(Text("Photo Gallery"), action: {
          self.showImagePicker.toggle()
          self.sourceType = 1
        }),
        ActionSheet.Button.cancel()]
      )}
        if showImagePicker {
          ImagePicker(isVisible: $showImagePicker, image: $image, sourceType: sourceType)
        }
      }.edgesIgnoringSafeArea(.top).onAppear {self.image = Image("rotating")}
  }
}

struct PredictionView_Previews: PreviewProvider {
    static var previews: some View {
        PredictionView()
    }
}
