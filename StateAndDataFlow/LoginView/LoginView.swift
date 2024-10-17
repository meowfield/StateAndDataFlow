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
            TextField("Enter your name", text: $loginViewVM.name)
                .multilineTextAlignment(.center)
            
            Button(action: login) {
                Label("OK", systemImage: "checkmark.circle")
            }
        }
    }
    
    private func login() {
        if !loginViewVM.name.isEmpty {
            loginViewVM.isLoggedIn = true
        }
    }
}

#Preview {
    LoginView(loginViewVM: LoginViewViewModel())
}
