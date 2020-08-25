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
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            HStack {
                ThrottleView()
                    .padding(.leading, 5.0)
                Spacer()
                VStack {//Two Main Screens
                    HStack(spacing:0) {
                        MapScreen()
                        MenuScreen()
                    }
                    Spacer()
                }
                Spacer()
                ThrottleView()
                    .padding(.trailing, 5.0)
            }
            .frame(maxWidth: 550)
            
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
                MenuDivider()
                Text("fuelplanner.com").foregroundColor(.green)
                MenuDivider()
                Text("Settings").foregroundColor(.green)
                MenuDivider()
                Text("About").foregroundColor(.green)
            }
            .frame(width: 200.0)
        }
        .frame(width: 200, height: 200)
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
        .frame(width: 200, height: 200)
    }
}

struct ThrottleView: View {
    @State var throttleHandlePosition: CGSize = .zero
    var body: some View {
        ZStack {
            Image("throttle")
                .resizable()
                .scaledToFill()
            VStack {
                Text("\(self.throttleHandlePosition.height)")
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                    .padding(.top,8)
                Spacer()
            }
            //.padding(9)
            ThrottleHandle()
                //.offset(y:80)
                .offset(y:(self.throttleHandlePosition.height + 80))
                .gesture(
                    DragGesture().onChanged{ value in
                        self.throttleHandlePosition = value.translation
                        if(value.translation.height <= -100){
                            self.throttleHandlePosition = .init(width: 0, height: -100)
                        }
                    }
                    .onEnded{ value in
                        
                    }
            )
        }
        .frame(width: 80)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ThrottleHandle: View {
    var body: some View {
        HStack(spacing:0) {
            Image("throttle_handle")
                .resizable()
                .scaledToFit()
            Image("throttle_handle")
                .resizable()
                .scaledToFit()
        }
    }
}

struct MenuDivider: View {
    var body: some View {
        Text("———————").foregroundColor(.green).lineLimit(0).frame(width: 200.0, height: 10.0).scaledToFit()
    }
}
