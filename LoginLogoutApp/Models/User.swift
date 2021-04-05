//
//  User.swift
//  LoginLogoutApp
//
//  Created by macbook on 4.04.21.
//

struct User {
    let userName: String
    let password: String
    let person: Person
    
    static func getLogInInfo() -> User {
        User(userName: "User",
             password: "Password",
             person: Person(
                name: "Ivan",
                surname: "Demchenko",
                age: 24,
                hobby: "Photos, writing, old cinema, indie music",
                nationality: "Belarus",
                photo: "userPhoto",
                links: "tg: jdemchenko\n" +
                    "inst: jdemchenko\n" +
                    "github: jdemchenko\n" +
                    "mail: vanuademchenko@gmail.com"
             )
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let age: Int
    let hobby: String
    let nationality: String
    let photo: String
    let links: String
}


