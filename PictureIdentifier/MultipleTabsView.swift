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
          GalleryView()
            .tabItem{
              Image(systemName: "photo.fill")
              Text("Gallery")
          }
        }
    }
}

struct MultipleTabsView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleTabsView()
    }
}
