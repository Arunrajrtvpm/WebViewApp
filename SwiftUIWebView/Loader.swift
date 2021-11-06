//
//  Loader.swift
//  SwiftUIWebView
//
//  Created by Arun on 4/25/20.
//  Copyright © 2020 Arun. All rights reserved.
//

import SwiftUI

struct Loader: View {
    @State var spinCircle = false
    
    var body: some View {
        ZStack {
            if #available(iOS 14.0, *) {
                Color(.systemBackground)
                    .ignoresSafeArea().opacity(0.5)
            } else {
                Color(.systemBackground).opacity(0.5)
            }
            
            if #available(iOS 14.0, *) {
                ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .blue)).scaleEffect(2).onAppear{
                    self.spinCircle = true
                }
            } else {
                Circle()
                    .trim(from: 0.3, to: 1)
                    .stroke(Color.black, lineWidth:3)
                    .frame(width:40, height: 40)
                    .padding(.all, 8)
                    .rotationEffect(.degrees(spinCircle ? 0 : -360), anchor: .center)
                    .animation(Animation.linear(duration: 0.6).repeatForever(autoreverses: false))
                    .onAppear {
                        self.spinCircle = true
                    }
            }
        }
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Loader()
    }
}
