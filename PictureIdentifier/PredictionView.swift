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
            AnimatedImage(url: URL(string: "https://66.media.tumblr.com/2e8ffc790d41c38669499bbfe20db0fd/tumblr_ogo3xzbmmW1r6xm5co1_400.gifv"))
            .onFailure(perform: { (error) in
                // Error
            })
          }.edgesIgnoringSafeArea(.top).overlay(
        HStack{
          Button(action:  {
            print("Hello World")
            }) {
            RoundedRectangle(cornerRadius: 40)
              .fill(Color.red)
              .overlay(
                Text("Predict")
                .fontWeight(.bold)
                  .font(.title)
                  .padding(.all, 11.0)
                  .background(Color.clear)
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(10)
            )

          }
        }
        .frame(width: 350, height: 50)
      )

    }
}

struct PredictionView_Previews: PreviewProvider {
    static var previews: some View {
        PredictionView()
    }
}
