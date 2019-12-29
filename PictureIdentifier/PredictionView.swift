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
    var body: some View {
        Group {
            // Network
            AnimatedImage(url: URL(string: "https://i.pinimg.com/originals/f0/5b/67/f05b6701811dfd9cfdc96456eadcf1ab.gif"))
            .onFailure(perform: { (error) in
                // Error
            })
          }.edgesIgnoringSafeArea(.top).overlay(
        HStack{
          Button(action:  {
            print("Hello World")
            }) {
            RoundedRectangle(cornerRadius: 40)
              .fill(Color.white)
              .overlay(
                Text("Predict")
                .fontWeight(.bold)
                  .font(.title)
                  .padding(.all, 11.0)
                  .background(Color.clear)
                .foregroundColor(.red)
            )
          }
        }
        .frame(width: 150, height: 50)
      )

    }
}

struct PredictionView_Previews: PreviewProvider {
    static var previews: some View {
        PredictionView()
    }
}
