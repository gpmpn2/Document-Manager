//
//  Document.swift
//  Document Manager
//
//  Created by Grant Maloney on 4/19/19.
//  Copyright © 2019 Grant Maloney. All rights reserved.
//

import Foundation

struct Document: Codable {
    let uuid: String
    let dates: Dates
    let title, summary: String
    let metadata: Metadata
    let authors: [Author]
    let copyright: Copyright
    let entities: [Entity]
}

struct Author: Codable {
    let name, contribution: String
    let contacts: [Contact]
}

struct Contact: Codable {
    let method, label: String
    let address, number: String?
}

struct Copyright: Codable {
    let owner: String
    let startYear, endYear: Int
    let license: String
    
    enum CodingKeys: String, CodingKey {
        case owner
        case startYear = "start-year"
        case endYear = "end-year"
        case license
    }
}

struct Dates: Codable {
    let created, updated: String
}

struct Entity: Codable {
    let type: String
    let label: String?
    let properties: Properties?
    let content: Content?
    let source: Source?
}

struct Content: Codable {
    let contentType, contentEncoding, data: String
    
    enum CodingKeys: String, CodingKey {
        case contentType = "content-type"
        case contentEncoding = "content-encoding"
        case data
    }
}

struct Properties: Codable {
    let size: Int?
    let width, height: String?
}

struct Source: Codable {
    let url: String
}

struct Metadata: Codable {
    let topic, field: String
}

