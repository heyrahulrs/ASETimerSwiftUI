//
//  SeparatorView.swift
//  ASETimerSwiftUI
//
//  Created by Rahul Sharma on 8/30/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//

import SwiftUI

struct SeparatorView: View {
    var body: some View {
        Text(":")
            .bold()
            .font(.largeTitle)
            .frame(height: 52.7)
            .offset(y: -2)
    }
}

struct SeparatorView_Previews: PreviewProvider {
    static var previews: some View {
        SeparatorView()
    }
}
