//
//  ContentView.swift
//  SwiftUIWebView
//
//  Created by Arun on 4/24/20.
//  Copyright © 2020 Arun. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    @State var showLoader = false
    
    // For WebView's forward and backward navigation
    var webViewNavigationBar: some View {
        
        Button(action: {
            self.viewModel.webViewNavigationPublisher.send(.backward)
        }) {
            Image(systemName: "chevron.left")
                .font(.system(size: 20, weight: .regular))
                .imageScale(.large)
                .foregroundColor(.gray)
        }.frame(width: 0, height: 35, alignment: .center)
        
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
              
                /* This is our WebView.*/
                WebView(viewModel: viewModel).overlay (
                    RoundedRectangle(cornerRadius: 4, style: .circular)
                        .stroke(Color.gray, lineWidth: 0.0)
                )
                
                webViewNavigationBar
            }.onReceive(self.viewModel.showLoader.receive(on: RunLoop.main)) { value in
                self.showLoader = value
            }
            
            // A simple loader that is shown when WebView is loading any page and hides when loading is finished.
            if showLoader {
                Loader()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
