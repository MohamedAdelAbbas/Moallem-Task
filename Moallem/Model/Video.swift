//
//  Video.swift
//  Moallem
//
//  Created by Mohamed Adel on 6/13/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import Foundation

struct Video {
    let imageName: String
    let url: URL
}


let videoDB: [Video] = [
    Video(imageName: "overlay", url: URL(fileURLWithPath: Bundle.main.path(forResource: "Demo 1", ofType: "mp4")!)),
    Video(imageName: "overlay", url: URL(fileURLWithPath: Bundle.main.path(forResource: "Demo 1", ofType: "mp4")!)),
    Video(imageName: "overlay", url: URL(fileURLWithPath: Bundle.main.path(forResource: "Demo 1", ofType: "mp4")!)),
    Video(imageName: "overlay", url: URL(fileURLWithPath: Bundle.main.path(forResource: "Demo 1", ofType: "mp4")!))
    
]
