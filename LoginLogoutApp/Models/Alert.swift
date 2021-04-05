//
//  Alert.swift
//  LoginLogoutApp
//
//  Created by macbook on 5.04.21.
//

struct Alert {
    let title: String
    let message: String
    
    static func getAlert() -> Alert {
        Alert(
            title: "Error",
            message: "The username or password is incorrect. Please check your username and password and try again."
        )
    }
}
