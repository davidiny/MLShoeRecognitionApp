//
//  RotatingShoe.swift
//  PictureIdentifier
//
//  Created by David Inyangson on 12/27/19.
//  Copyright © 2019 David Inyangson. All rights reserved.
//

import SwiftUI


struct RotatingShoe: View {
  let image = UIImage.gif(name: "rotating")
    var body: some View {
      Image(uiImage: image!).resizable().frame(width: 200.0, height: 200.0).clipShape(Circle()).overlay(Circle().stroke(Color.white, lineWidth: 4)).shadow(radius: 10)
    }
}

struct RotatingShoe_Previews: PreviewProvider {
    static var previews: some View {
        RotatingShoe()
    }
}
