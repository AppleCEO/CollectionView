//
//  Model.swift
//  tabling
//
//  Created by joon-ho kil on 2021/05/12.
//

import Foundation

// MARK: - ModelElement
struct ModelElement: Codable {
    let id, author: String
    let width, height: Int
    let url, downloadURL: String

    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
}

typealias Model = [ModelElement]
