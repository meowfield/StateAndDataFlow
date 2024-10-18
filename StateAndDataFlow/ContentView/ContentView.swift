//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 06.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    private let contentViewMV = ContentViewViewModel()
    
    var body: some View {
        VStack {
            Text("Hi, \(loginViewVM.user.name)!")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Text(contentViewMV.counter.formatted())
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            
            Spacer()
            
            VStack {
                Spacer()
                
                ButtonView(
                    title: contentViewMV.buttonTitle,
                    action: contentViewMV.startTimer,
                    color: .red
                )
                
                Spacer()
                
                ButtonView(
                    title: "Log Out",
                    action: loginViewVM.logout,
                    color: .blue
                )
            }
        }
    }
}
    
#Preview {
    ContentView()
        .environment(ContentViewViewModel())

}

struct ButtonView: View {
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
