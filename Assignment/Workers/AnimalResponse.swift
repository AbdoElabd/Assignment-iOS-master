//
//  AnimalResponse.swift
//  SwiftVIPER
//
//  Created by apple on 21/12/2022.
//  Copyright © 2022 Tsubasa Hayashi. All rights reserved.
//

import Foundation

// MARK: - Token
struct Animals: Codable {
    let animals: [Animal]
    let pagination: Pagination
}

// MARK: - Animal
struct Animal: Codable {
    let id: Int
    let organizationID: String
    let url: String
    let type, species: String?
    let breeds: Breeds
    let colors: Colors
    let age: String
    let gender: String?
    let size: String?
    let coat: String?
    let attributes: Attributes
    let environment: Environment
    let tags: [String]
    let name: String
    let animalDescription, organizationAnimalID: String?
    let photos: [Photo]
    let primaryPhotoCropped: Photo?
    let videos: [Video]
    let status: Status
    let statusChangedAt, publishedAt: String
    let distance: JSONNull?
    let contact: Contact?
    let links: AnimalLinks

    enum CodingKeys: String, CodingKey {
        case id
        case organizationID = "organization_id"
        case url, type, species, breeds, colors, age, gender, size, coat, attributes, environment, tags, name
        case animalDescription = "description"
        case organizationAnimalID = "organization_animal_id"
        case photos
        case primaryPhotoCropped = "primary_photo_cropped"
        case videos, status
        case statusChangedAt = "status_changed_at"
        case publishedAt = "published_at"
        case distance, contact
        case links = "_links"
    }
}

enum Age: String, Codable {
    case adult = "Adult"
    case baby = "Baby"
    case young = "Young"
}

// MARK: - Attributes
struct Attributes: Codable {
    let spayedNeutered, houseTrained, declawed, specialNeeds: Bool?
    let shotsCurrent: Bool

    enum CodingKeys: String, CodingKey {
        case spayedNeutered = "spayed_neutered"
        case houseTrained = "house_trained"
        case declawed
        case specialNeeds = "special_needs"
        case shotsCurrent = "shots_current"
    }
}

// MARK: - Breeds
struct Breeds: Codable {
    let primary: String
    let secondary: String?
    let mixed, unknown: Bool
}

// MARK: - Colors
struct Colors: Codable {
    let primary, secondary, tertiary: String?
}

// MARK: - Contact
struct Contact: Codable {
    let email: String?
    let phone: String?
    let address: Address?
}

// MARK: - Address
struct Address: Codable {
    let address1, address2: String?
    let city, state, postcode: String?
    let country: String?
}

enum Country: String, Codable {
    case us = "US"
}

// MARK: - Environment
struct Environment: Codable {
    let children, dogs, cats: Bool?
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
}

// MARK: - AnimalLinks
struct AnimalLinks: Codable {
    let linksSelf, type, organization: Next

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case type, organization
    }
}

// MARK: - Next
struct Next: Codable {
    let href: String
}

// MARK: - Photo
struct Photo: Codable {
    let small, medium, large, full: String
}

enum Size: String, Codable {
    case large = "Large"
    case medium = "Medium"
    case small = "Small"
}

enum Species: String, Codable {
    case cat = "Cat"
}

enum Status: String, Codable {
    case adoptable = "adoptable"
}

// MARK: - Video
struct Video: Codable {
    let embed: String
}

// MARK: - Pagination
struct Pagination: Codable {
    let countPerPage, totalCount, currentPage, totalPages: Int
    let links: PaginationLinks

    enum CodingKeys: String, CodingKey {
        case countPerPage = "count_per_page"
        case totalCount = "total_count"
        case currentPage = "current_page"
        case totalPages = "total_pages"
        case links = "_links"
    }
}

// MARK: - PaginationLinks
struct PaginationLinks: Codable {
    let next: Next
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let token = try? newJSONDecoder().decode(Token.self, from: jsonData)


struct AnimalViewModel{
    var imageUrl : URL?
    var name : String
    var gender : String
    var type : String
    var size : String
    var color : String
    var address : String
    
    init(animal : Animal ) {
        if animal.photos.count != 0 {
            imageUrl = URL(string: animal.photos[0].medium ) ?? URL(string: "")!
        }
        name = animal.name
        gender = animal.gender ?? "NA"
        type = animal.type ?? "NA"
        size = animal.size ?? "NA"
        color = animal.colors.primary ?? "NA"
        address = animal.contact?.address?.address1 ?? "NA"
        
    }
}

