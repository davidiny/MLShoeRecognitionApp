//
//  PredictionLabel.swift
//  ViperLabs
//
//  Created by David Inyangson on 12/30/19.
//  Copyright © 2019 David Inyangson. All rights reserved.
//

import SwiftUI

struct PredictionLabel: View {
  var label:String
    var body: some View {
      RoundedRectangle(cornerRadius:30).frame(width: 350.0, height: 100.0).overlay(RoundedRectangle(cornerRadius: 30).fill(Color.white)).shadow(radius: 5).overlay(Text(label).font(.body).foregroundColor(.red).multilineTextAlignment(.center).padding(.all, 5))
    }
}

struct PredictionLabel_Previews: PreviewProvider {
    static var previews: some View {
      PredictionLabel(label: "This is the predictionThis is the prediction")
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
