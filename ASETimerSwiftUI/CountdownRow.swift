//
//  CountdownRow.swift
//  ASETimerSwiftUI
//
//  Created by Rahul Sharma on 8/30/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//

import SwiftUI

struct CountdownRow: View {
    
    var number: Int
    var text: RowType
    
    var body: some View {
        VStack {
            Text(String(format: "%02d", number))
                .fontWeight(.black)
                .font(Font.system(size: 38.0).monospacedDigit())
            Text(text.rawValue.uppercased())
                .fontWeight(.bold)
                .font(.caption)
                .opacity(0.7)
        }
    }
    
}

struct CountdownRow_Previews: PreviewProvider {
    static var previews: some View {
        CountdownRow(number: 12, text: .hours)
    }
}
