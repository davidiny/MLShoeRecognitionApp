//
//  ShoeList.swift
//  ViperLabs
//
//  Created by David Inyangson on 12/30/19.
//  Copyright © 2019 David Inyangson. All rights reserved.
//

import SwiftUI

struct ShoeList: View {
    var body: some View {
      NavigationView {
        List(landmarkData) { shoe in
          NavigationLink(destination: ContentView()) {
                ShoeRow(shoe: shoe)
          }
        
        }.navigationBarTitle(Text("Navigation"))
      
      }
    }
}


struct ShoeList_Previews: PreviewProvider {
    static var previews: some View {
        ShoeList()
    }
}




