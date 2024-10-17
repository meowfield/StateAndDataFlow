//
//  ContentViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 06.03.2024.
//

import SwiftUI

@Observable
final class ContentViewViewModel {
    
    var counter = 3
    
    var startButtonTitle = "Start"
    var logoutButtonTitle = "Log Out"
    
    var startButtonColor = Color.red
    var logoutButtonColor = Color.blue
    
    private var timer: Timer?
    
    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }
        buttonDidTapped()
    }
    
    func logout() {
        
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            startButtonTitle = "Reset"
        }
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func buttonDidTapped() {
        if startButtonTitle == "Reset" {
            counter = 3
            startButtonTitle = "Start"
        } else {
            startButtonTitle = "Wait..."
        }
    }
}
