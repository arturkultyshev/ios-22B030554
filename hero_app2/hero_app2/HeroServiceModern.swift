//
//  HeroServiceModern.swift
//  hero_app2
//
//  Created by Артур Култышев on 05.12.2025.
//

import Foundation
import Alamofire

struct HeroServiceModern {

    func fetchRandomHero(completion: @escaping (Result<HeroModel, Error>) -> Void) {
        let randomId = Int.random(in: 1...563)
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(randomId).json"

        AF.request(urlString)
            .validate()
            .responseDecodable(of: HeroModel.self) { response in
                switch response.result {
                case .success(let hero):
                    completion(.success(hero))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
