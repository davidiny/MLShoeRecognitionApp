//
//  PredictionLabel.swift
//  ViperLabs
//
//  Created by David Inyangson on 12/30/19.
//  Copyright © 2019 David Inyangson. All rights reserved.
//

import SwiftUI

struct ShowImageView: View {
  var image:Image
    var body: some View {
      RoundedRectangle(cornerRadius:30).frame(width: 230.0, height: 230.0).overlay(RoundedRectangle(cornerRadius: 30).fill(Color.white)).shadow(radius: 5).overlay(image.resizable().frame(width: 210, height: 210).cornerRadius(30))
    }
}

struct ShowImageView_Previews: PreviewProvider {
    static var previews: some View {
      ShowImageView(image: Image("photoPlaceholder"))
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
