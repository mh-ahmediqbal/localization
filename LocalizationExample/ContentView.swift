//
//  ContentView.swift
//  LocalizationExample
//
//  Created by Ahmad Iqbal on 01/12/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack{
            VStack {
                Image(systemName: "language")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello World!".localized(language))
                
                VStack {
                    TextField(text: $email) {
                        Text("Email".localized(language))
                    }
                    
                    TextField(text: $password) {
                        Text("Password".localized(language))
                    }
                    HStack {
                        Spacer()
                        Text("Forgot Password?".localized(language)).font(.callout)
                    }
                }.textFieldStyle(.roundedBorder)
                
                Button {
                    print("Login Button Pressed")
                } label: {
                    Text("Login".localized(language))
                }.padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                 .buttonStyle(.borderedProminent)

                Button(action: {
                    print("Button pressed!")
                    if AppState.shared.isRTL {
                        LocalizationService.shared.language = .english_us
                        AppState.shared.isRTL = false
                        print(AppState.shared.isRTL)
                    } else {
                        LocalizationService.shared.language = .arabic
                        AppState.shared.isRTL = true
                        print(AppState.shared.isRTL)
                    }
                }, label: {
                    Text("Language")
                })
            }.padding()
                
        }
    }
}

#Preview {
    ContentView()
}
