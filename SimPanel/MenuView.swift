//
//  menuView.swift
//  SimPanel
//
//  Created by 梁思地 on 2020/8/24.
//  Copyright © 2020 梁思地. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ZStack {
            Image("leather")
                .resizable()
                .scaledToFill()
            HStack {
                Image("main_screen")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView().previewLayout(.fixed(width:568, height:320))
    }
}
