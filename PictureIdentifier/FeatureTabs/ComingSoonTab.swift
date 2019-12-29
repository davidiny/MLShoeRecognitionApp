//
//  ProfTabs.swift
//  ViperLabs
//
//  Created by David Inyangson on 12/28/19.
//  Copyright © 2019 David Inyangson. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import SDWebImage

struct ComingSoonTab: View {
    var body: some View {
      HStack {
        Image("Logo")
                   .resizable()
                   .padding()
                   .frame(width: 100, height: 100)
        VStack(alignment: .leading){
          Text("Identify Everything").font(.headline).multilineTextAlignment(.leading)
          Text("Coming soon...")
            .multilineTextAlignment(.leading)
            .font(.caption)
        }
        }.frame(width: 350, height: 75).overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.red, lineWidth: 1))
    }
}

struct ComingSoonTab_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoonTab()
    }
}
