//
//  Supjects.swift
//  Moallem
//
//  Created by Mohamed Adel on 6/13/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import Foundation


struct Subject {
    let title: String
    let imageName: String
}

let database: [Subject] = [
    Subject(title: "Algebra", imageName: "algebra"),
    Subject(title: "Biology", imageName: "biology"),
    Subject(title: "History", imageName: "history"),
    Subject(title: "Physics", imageName: "physics")
]
