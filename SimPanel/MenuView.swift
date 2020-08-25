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
                Image("throttle")
                .resizable()
                .scaledToFill()
                .frame(width: 50)
                VStack {//Two Main Screens
                    HStack(spacing:0) {
                        MapScreen()
                        MenuScreen()
                    }
                    Spacer()
                }
                ThrottleView()
            }
            
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView().previewLayout(.fixed(width:568, height:320))
    }
}

struct MenuScreen: View {
    var body: some View {
        ZStack {
            Image("main_screen")
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack() {
                Text("SimPanel").foregroundColor(.green)
                Text("————————").foregroundColor(.green)
                Text("fuelplanner.com").foregroundColor(.green)
                Text("————————").foregroundColor(.green)
                Text("About").foregroundColor(.green)
            }
        }
        .frame(width: 160, height: 160)
    }
}
struct MapScreen: View {
    var body: some View {
        ZStack {
            Image("main_screen")
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack(spacing:10) {
//                Text("fuelplanner.com").foregroundColor(.green)
//                Text("About").foregroundColor(.green)
                Spacer()
            }
        }
        .frame(width: 160, height: 160)
    }
}

struct ThrottleView: View {
    @State var throttleHandlePosition: CGSize = .zero
    var body: some View {
        ZStack {
            Image("throttle")
                .resizable()
                .scaledToFill()
                .frame(width: 50)
            VStack {
                Text("\(self.throttleHandlePosition.height)")
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                Spacer()
            }.padding(9)
            ThrottleHandle()
                .offset(y:80)
                .offset(y:self.throttleHandlePosition.height)
                .gesture(
                    DragGesture().onChanged{ value in
                        self.throttleHandlePosition = value.translation
                    }
                    
            )
        }
    }
}

struct ThrottleHandle: View {
    var body: some View {
        HStack(spacing:0) {
            Image("throttle_handle")
                .resizable()
                .scaledToFit()
                .frame(width: 40)
            Image("throttle_handle")
                .resizable()
                .scaledToFit()
                .frame(width: 40)
        }
    }
}
