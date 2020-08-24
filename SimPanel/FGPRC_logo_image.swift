//
//  FGPRC_logo_image.swift
//  SimPanel
//
//  Created by 梁思地 on 2020/8/24.
//  Copyright © 2020 梁思地. All rights reserved.
//

import SwiftUI

struct FGPRC_logo_image: View {
    var body: some View {
        Image("fgprc")
            .clipShape(Circle())
            .overlay(
            Circle().stroke(Color.white, lineWidth: 40))
            .shadow(radius: 100)
            .scaleEffect(0.07)
            
    }
}

struct FGPRC_logo_image_Previews: PreviewProvider {
    static var previews: some View {
        FGPRC_logo_image()
    }
}
