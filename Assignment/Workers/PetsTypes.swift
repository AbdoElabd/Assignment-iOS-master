//
//  PetsTypes.swift
//  SwiftVIPER
//
//  Created by apple on 22/12/2022.
//  Copyright © 2022 abdelrahman elabd. All rights reserved.
//

import Foundation

// MARK: - PetsTypes
struct PetsTypes: Codable {
    let types: [TypeElement]
}

// MARK: - TypeElement
struct TypeElement: Codable {
    let name: String
    let coats, colors: [String?]
    let genders: [String]
    let links: Links

    enum CodingKeys: String, CodingKey {
        case name, coats, colors, genders
        case links = "_links"
    }
}

//enum Gender: String, Codable {
//    case female = "Female"
//    case male = "Male"
//    case unknown = "Unknown"
//}

// MARK: - Links
struct Links: Codable {
    let linksSelf, breeds: BreedsType

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case breeds
    }
}

// MARK: - Breeds
struct BreedsType: Codable {
    let href: String
}

struct TypeViewModel{
    var name : String
    
    init(animal : TypeElement ) {
        name = animal.name
    }
}
