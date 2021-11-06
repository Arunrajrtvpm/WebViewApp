//
//  File.swift
//  SwiftUIWebView
//
//  Created by Arun on 4/25/20.
//  Copyright © 2020 Arun. All rights reserved.
//

import Foundation
import Combine
class ViewModel: ObservableObject {
    var webViewNavigationPublisher = PassthroughSubject<WebViewNavigation, Never>()
    var showLoader = PassthroughSubject<Bool, Never>()
}

// For identifiying WebView's forward and backward navigation
enum WebViewNavigation {
    case backward, forward, reload
}

