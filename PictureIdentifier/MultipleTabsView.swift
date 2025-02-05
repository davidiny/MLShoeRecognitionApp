//
//  MultipleTabsView.swift
//  ViperLabs
//
//  Created by David Inyangson on 12/28/19.
//  Copyright © 2019 David Inyangson. All rights reserved.
//

import SwiftUI

struct MultipleTabsView: View {
    var body: some View {
        TabView {
          ContentView()
            .tabItem{
              Image(systemName: "house.fill")
              Text("Home")
            }
          PredictionView()
            .tabItem{
              Image(systemName: "camera.fill")
              Text("Predict")
          }
          ShoeList()
            .tabItem{
              Image(systemName: "star.fill")
              Text("Trending")
          }
        }.edgesIgnoringSafeArea(.top)
    }
}

struct MultipleTabsView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleTabsView()
    }
}
