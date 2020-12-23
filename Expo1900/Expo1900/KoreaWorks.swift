//
//  KoreaWorks.swift
//  Expo1900
//
//  Created by sole on 2020/12/21.
//

import Foundation
import UIKit

struct KoreaWorks: Decodable {
    var name: String
    private var imageName: String
    var shortDescription: String
    var description: String
    
    var image: UIImage? {
        return UIImage(named: self.imageName)
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
    
    init(name: String) {
        self.name = name
        self.imageName = "aslkdjf"
        self.shortDescription = "dklfsdlkf"
        self.description = "sdkjfhsdlfkhjklcxn"
    }
}
