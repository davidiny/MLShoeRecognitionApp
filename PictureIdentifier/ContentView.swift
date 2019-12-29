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
          RotatingShoe().frame(height: 300).offset(y: -265).padding(.bottom, -100)
          VStack(alignment: .leading) {
            ProfTabs()
            ProfTabs()
            ProfTabs()
          }
          .offset(y: -180)
          .frame(height: 200)
        }
  }

}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
