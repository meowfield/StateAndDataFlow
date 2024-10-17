//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 06.03.2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(ContentViewViewModel.self) private var contentViewVM
    @Environment(LoginViewViewModel.self) private var loginViewVM
    
    var body: some View {
        VStack {
            Text("Hi, \(loginViewVM.name)!")
                .padding(.top, 100)
                .font(.largeTitle)
            Text(contentViewVM.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            
            Spacer()
            
            ButtonView(
                //contentViewVM: contentViewVM,
                title: contentViewVM.startButtonTitle,
                action: contentViewVM.startTimer,
                color: contentViewVM.startButtonColor
            )
            
            Spacer()
            
            ButtonView(
                //contentViewVM: contentViewVM,
                title: contentViewVM.logoutButtonTitle,
                action: logout,
                color: contentViewVM.logoutButtonColor
            )
            
        }
    }
    
    private func logout(){
        loginViewVM.isLoggedIn = false
        loginViewVM.name = ""
    }
}

#Preview {
    ContentView()
        .environment(ContentViewViewModel())
        .environment(LoginViewViewModel())
}

struct ButtonView: View {
    //var contentViewVM: ContentViewViewModel
    
    
    let title: String
    let action: () -> Void
    let color: Color
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}
