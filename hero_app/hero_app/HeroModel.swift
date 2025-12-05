//
//  HeroModel.swift
//  hero_app
//
//  Created by Артур Култышев on 02.12.2025.
//

import Foundation

struct HeroModel: Decodable {
    let id: Int
    let name: String
    let powerstats: Powerstats
    let biography: Biography
    let appearance: Appearance
    let images: Images

    struct Powerstats: Decodable {
        let intelligence: Int
        let strength: Int
        let speed: Int
        let durability: Int
        let power: Int
        let combat: Int
    }

    struct Biography: Decodable {
        let fullName: String
        let placeOfBirth: String
        let publisher: String?
    }

    struct Appearance: Decodable {
        let gender: String
        let race: String?
    }

    struct Images: Decodable {
        let md: String
    }
}
