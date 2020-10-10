//
//  AboutView.swift
//  SimPanel
//
//  Created by 梁思地 on 2020/10/10.
//  Copyright © 2020 梁思地. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    @Binding var showAboutPage:Bool
    var body: some View {
        VStack {
            HStack {
                Button("< Back") {
                    self.showAboutPage = false;
                }.padding([.top, .leading, .trailing])
                Spacer()
            }
            HStack {
                FGPRC_logo_image()
                    //.offset(y:-70)
                    .padding()
                    .scaleEffect(0.7)
                Spacer()
                VStack(alignment:.leading) {
                    Text("SimPanel")
                        .font(.largeTitle)
                    Text("Version 0.1 alpha")
                        .font(.footnote)
                    Text("\nDeveloped by FGPRC\n")
                    Text("Programming: Sidi Liang")
                    Text("Design: Qiyuan Luo \n              Sidi Liang")
                    //.foregroundColor(Color.red)
                    //.bold()
                    /*HStack {
                        Text("My first swiftUI app")
                            .font(.subheadline)
                        Spacer()
                        Text("For real")
                    }*/
                }
                .padding([.top, .bottom, .trailing], 30.0)
            }
                //.frame(width: 0.0, height: 50.0)
        }
    }
}

struct FGPRC_logo_image: View {
    var body: some View {
        Image("fgprc")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 10))
            .shadow(radius: 20)
            .scaleEffect(1)
            
    }
}

/*struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        //AboutView().previewLayout(.fixed(width:568, height:320))
    }
}*/
