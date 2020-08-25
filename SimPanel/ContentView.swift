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
            AboutView()
            MenuView()
        }
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width:568, height:320))
    }
}

struct AboutView: View {
    var body: some View {
        VStack {
            FGPRC_logo_image()
                .offset(y:-70)
                .padding(.bottom, -130)
                .frame(width: /*@START_MENU_TOKEN@*/0.0, height: 130.0/*@END_MENU_TOKEN@*/)
            
            VStack(alignment:.leading) {
                Text("Hello, World!")
                    .font(.title)
                //.foregroundColor(Color.red)
                //.bold()
                HStack {
                    Text("My first swiftUI app")
                        .font(.subheadline)
                    Spacer()
                    Text("For real")
                }
            }
            .padding()
        }
    }
}
