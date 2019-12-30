//
//  CameraButtonView.swift
//  ViperLabs
//
//  Created by David Inyangson on 12/30/19.
//  Copyright © 2019 David Inyangson. All rights reserved.
//

import SwiftUI

struct CameraButtonView: View {
  @Binding var showActionSheet: Bool
    var body: some View {
      Button(action: {
        self.showActionSheet.toggle()
      }) {
        RoundedRectangle(cornerRadius: 30).frame(width: 68, height: 68, alignment: .center).foregroundColor(Color.white).overlay(RoundedRectangle(cornerRadius: 30).frame(width: 66, height: 66, alignment: .center).foregroundColor(Color.init(red: 232/255, green: 233/255, blue: 231))).overlay(Image(systemName: "camera.fill").foregroundColor(.black))
      }
      
      
    }
}

struct CameraButtonView_Previews: PreviewProvider {
    static var previews: some View {
      CameraButtonView(showActionSheet: .constant(false)).previewLayout(.sizeThatFits).padding()
    }
}
