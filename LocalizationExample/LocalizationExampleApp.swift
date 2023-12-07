//
//  LocalizationExampleApp.swift
//  LocalizationExample
//
//  Created by Ahmad Iqbal on 01/12/2023.
//

import SwiftUI

class AppState: ObservableObject {
    static let shared = AppState()
    @Published var isRTL = false
}

@main
struct LocalizationExampleApp: App {
    
    private var language = LocalizationService.shared.language
    @ObservedObject var appState = AppState.shared
    
    init() {
        appState.isRTL = language == .english_us ? false : true
    }
    var body: some Scene {
        WindowGroup {
            ContentView().id(appState.isRTL)
                .environment(\.layoutDirection, appState.isRTL ? .rightToLeft : .leftToRight)
        }
    }
}
