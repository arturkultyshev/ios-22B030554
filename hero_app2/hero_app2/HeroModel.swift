//
//  HeroModel.swift
//  hero_app2
//
//  Created by Артур Култышев on 05.12.2025.
//

import Foundation

struct HeroModel: Codable {
    let id: Int
    let name: String
    let powerstats: Powerstats
    let biography: Biography
    let appearance: Appearance
    let images: Images

    struct Powerstats: Codable {
        let intelligence: Int
        let strength: Int
        let speed: Int
        let durability: Int
        let power: Int
        let combat: Int
    }

    struct Biography: Codable {
        let fullName: String
        let placeOfBirth: String
        let publisher: String?
    }

    struct Appearance: Codable {
        let gender: String
        let race: String?
    }

    struct Images: Codable {
        let md: String
    }
}
