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


struct ShoeDetailView: View {
  var shoe: String
  var images: Image?
 
    var body: some View {
      ZStack {
            VStack() {
              MapView()
              ShowImageView(image: self.images!).offset(y: -120)
              HStack{
                PredictionLabel(label: self.shoe).offset(y: -100)
              }
        }
//      )

      }.edgesIgnoringSafeArea(.top)
  }

}


struct ShoeDetailView_Previews: PreviewProvider {
    static var previews: some View {
      ShoeDetailView(shoe: "Hi", images: Image("photoPlaceholder"))
    }
}
