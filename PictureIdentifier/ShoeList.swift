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
        List(shoes) { shoe in
          NavigationLink(destination: ShoeDetailView(shoe: shoe)) {
                ShoeRow(shoe: shoe)
          }

        }.navigationBarTitle(Text("Trending Shoes"))

      }
    }
}


struct ShoeList_Previews: PreviewProvider {
    static var previews: some View {
        ShoeList()
    }
}




