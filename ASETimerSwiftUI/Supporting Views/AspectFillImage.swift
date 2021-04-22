//
//  AspectFillImage.swift
//  ASETimerSwiftUI
//
//  Created by Rahul Sharma on 14/04/21.
//  Copyright © 2021 Rahul Sharma. All rights reserved.
//

import SwiftUI

struct AspectFillImage: View {

    var imageName: String

    init(_ imageName: String) {
        self.imageName = imageName
    }

    var body: some View {
        GeometryReader { geometry in
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(
                    width: geometry.size.width,
                    height: geometry.size.width
                )
                .clipped()
        }
    }

}

struct AspectFillImage_Previews: PreviewProvider {
    static var previews: some View {
        AspectFillImage("girl")
    }
}
