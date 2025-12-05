//
//  HeroServiceModern.swift
//  hero_app
//
//  Created by Артур Култышев on 02.12.2025.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidStatusCode(Int)
}

struct HeroServiceModern {

    func fetchHero() async throws -> HeroModel {
        let randomId = Int.random(in: 1...563)
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(randomId).json"

        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }

        let request = URLRequest(url: url)

        let (data, response) = try await URLSession.shared.data(for: request)

        if let httpResponse = response as? HTTPURLResponse,
           httpResponse.statusCode != 200 {
            throw NetworkError.invalidStatusCode(httpResponse.statusCode)
        }

        let decoder = JSONDecoder()
        let hero = try decoder.decode(HeroModel.self, from: data)
        return hero
    }
}
