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
                LeftView()
                    .padding(.leading, 5.0)
                    .frame(width: 80)
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
            
//            AboutView()
//                .aspectRatio(contentMode: .fit)
//                .background(Color.white)
//                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                
            
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView().previewLayout(.fixed(width:568, height:320))
    }
}

struct MenuScreen: View {
    @State var showAboutPage: Bool = false
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
                Text("About")
                    .foregroundColor(.green)
                    .onTapGesture() {
                        print("About page should appear")
                        self.showAboutPage = true
                    }
                    .sheet(isPresented: $showAboutPage, content: {
                        AboutView(showAboutPage: self.$showAboutPage)
                    })
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
    @EnvironmentObject var client:Client
    @State var throttleHandleCurrentPosition: CGPoint = .zero
    @State var throttleHandleNewPosition: CGPoint = .zero
    var body: some View {
        ZStack {
            Image("throttle")
                .resizable()
                .scaledToFill()
            VStack {
                Text("\(self.throttleHandleCurrentPosition.y)")
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                    .padding(.top,8)
                Spacer()
            }
            //.padding(9)
            ThrottleHandle()
                //.offset(y:80)
                .offset(y:(self.throttleHandleCurrentPosition.y + 80))
                .animation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.1))
                .gesture(
                    DragGesture().onChanged{ value in
                        let translation = value.translation
                        self.throttleHandleCurrentPosition.y = translation.height + self.throttleHandleNewPosition.y
                        
                        //Clipping the throttle handle
                        if(self.throttleHandleCurrentPosition.y <= -200){
                            self.throttleHandleCurrentPosition.y = -200
                        }
                        if(self.throttleHandleCurrentPosition.y >= 0){
                           self.throttleHandleCurrentPosition.y = 0
                        }
                        
                        self.client.updateThrottleData(rawThrottleData: Float(self.throttleHandleCurrentPosition.y))
                    
                    }
                    .onEnded{ value in
                        self.throttleHandleNewPosition = self.throttleHandleCurrentPosition
                        self.client.updateThrottleData(rawThrottleData: Float(self.throttleHandleCurrentPosition.y))
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
        Text("────────") //Box Drawings Light Horizontal, U+2500
            .font(.body)
            .foregroundColor(.green)
            .lineLimit(0)
            .frame(width: 200.0, height: 10.0).scaledToFit()
    }
}

struct LeftView: View {
    var body: some View {
        VStack(spacing:0) {
            Image("info_block")
                .resizable()
                .scaledToFit()
            Image("info_block")
                .resizable()
                .scaledToFit()
            Image("info_block")
                .resizable()
                .scaledToFit()
            Image("info_block")
                .resizable()
                .scaledToFit()
        }
    }
}
