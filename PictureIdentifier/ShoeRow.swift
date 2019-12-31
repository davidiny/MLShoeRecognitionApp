//
//  ShoeRow.swift
//  ViperLabs
//
//  Created by David Inyangson on 12/30/19.
//  Copyright © 2019 David Inyangson. All rights reserved.
//

import SwiftUI

struct ShoeRow: View {
  var shoe: Prediction
    var body: some View {
      HStack {
        (shoe.image!.resizable()).frame(width: 100, height: 100)
        Text(shoe.name)
        Spacer()
      }
    }
}

struct ShoeRow_Previews: PreviewProvider {
    static var previews: some View {
      Group{
        ShoeRow(shoe: shoes[0])
        ShoeRow(shoe: shoes[1])
      }.previewLayout(.fixed(width: 300, height: 70))
    }
}
