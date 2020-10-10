//
//  ContentView.swift
//  SimPanel
//
//  Created by 梁思地 on 2020/8/23.
//  Copyright © 2020 梁思地. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            MenuView()
        }
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width:568, height:320))
    }
}
