//
//  Exposition.swift
//  Expo1900
//
//  Created by 김지혜 on 2020/12/22.
//

import Foundation

struct Exposition {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
}

struct Entry {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
