//
//  User.swift
//  Login
//
//  Created by Виталий Оранский on 03.04.2021.
//

import Foundation

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(login: "biz",
             password: "123",
             person: Person(name: "Vitaly",
                            lastName: "Oransky",
                            photo: "myPhoto",
                            hobbies: """
                                    There is a lot of different information about my hobbies.
                                    """,
                            work: """
                                  There is a lot of different information about my current work and,
                                  in general, about my experience in life.
                                  """,
                            family: """
                                    There is a lot of different information about my family.
                                    what is my wife's name, how many children do we have and what do they like to do
                                    """,
                            goals: """
                                      Goals for the nearest future:
                                   1) Complete training on swiftbook
                                   2) get a job as a junior iso developer
                                   3) create / work on a worthy project
                                   """))
    }
    
}

struct Person {
    let name: String
    let lastName: String
    let photo: String
    let hobbies: String
    let work: String
    let family: String
    let goals: String
}
    
