//
//  GitHubRepository.swift
//  Calc-iosTestText
//
//  Created by kazunori.aoki on 2022/02/01.
//

import Foundation

struct GitHubRepository: Codable, Equatable {
    let id: Int
    let star: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case id
        case star = "stargazers_count"
        case name
    }
}
