//
//  ContentView.swift
//  PictureIdentifier
//
//  Created by David Inyangson on 12/27/19.
//  Copyright © 2019 David Inyangson. All rights reserved.
//

import SwiftUI
import SwiftGifOrigin

struct ContentView: View {
  let predictImage = UIImage(named: "Button")
    var body: some View {
      VStack{
        MapView().frame(height: 500).edgesIgnoringSafeArea(.top).offset(y: -100)
        RotatingShoe().frame(height: 300).offset(y: -300).padding(.bottom, -100)
        VStack(alignment: .leading) {
          Text("See a shoe that looks cool but dont know what it is?")
          .font(.title)
            .multilineTextAlignment(.center)
            .lineLimit(nil)
            .padding(.bottom, 15.0)
            .padding(.leading, 16.0)
            .padding(.horizontal, 10.0)
          HStack {
            Text("Lets predict that shoe!")
              .padding(.horizontal)
            Spacer()
            Text("Press that button")
              .padding(.trailing)
              
          }
        }
        .offset(y: -200)
        .frame(height: 200)
        HStack{
          Button(action:  {
            print("Hello World")
          }) {
            RoundedRectangle(cornerRadius: 40)
              .fill(Color.orange)
              .overlay(
                Text("Predict")
                .fontWeight(.bold)
                  .font(.title)
                  .padding(.all, 11.0)
                  .background(Color.clear)
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(10)
                .frame(width: 380)
            )

          }
        }
        .offset(y: -200)
        .frame(width: 350, height: 50)

      }
  }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
