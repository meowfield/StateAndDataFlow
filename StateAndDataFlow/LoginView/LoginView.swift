//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 06.03.2024.
//

import SwiftUI

struct LoginView: View {
    @Bindable private var loginViewVM: LoginViewViewModel
    
    init(loginViewVM: LoginViewViewModel) {
        _loginViewVM = Bindable(wrappedValue: loginViewVM)
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $loginViewVM.name)
                    .multilineTextAlignment(.center)
                Text("\(nameCounter())")
                    .foregroundColor(nameCounter() > 2 ? .green : .red)
            }
            .padding()
            
            Button(action: login) {
                Label("OK", systemImage: "checkmark.circle")
                    .disabled(nameCounter() > 2 ? false : true)
            }
        }
    }
    
    private func login() {
        if !loginViewVM.name.isEmpty, loginViewVM.name.count > 2 {
            loginViewVM.isLoggedIn = true
        }
    }
    
    private func nameCounter() -> Int {
        let counter = loginViewVM.name.count
        return counter
    }
}



#Preview {
    LoginView(loginViewVM: LoginViewViewModel())
}
