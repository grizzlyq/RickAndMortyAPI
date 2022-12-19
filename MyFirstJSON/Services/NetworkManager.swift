//
//  NetworkManager.swift
//  RickAndMortyAPI
//
//  Created by Дмитрий on 16.12.2022.
//

import Foundation

enum Link: String {
    case baseURL = "https://rickandmortyapi.com/api/character"
    case testImageURL = "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    private let baseURL = "https://rickandmortyapi.com/api"
    private let testImageURL = "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
    
    private init() {}
        
    
    func fetchCharacters(page: Int, completed: @escaping (Swift.Result<Character, Error>) -> Void) {

        let endpoint = baseURL + "/character/?page=\(page)"

        guard let url = URL(string: endpoint) else {

            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

            if let _ = error { return }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }

            guard let data = data else { return }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let characters = try decoder.decode(Character.self, from: data)
                completed(.success(characters))
            } catch {
                return
            }
        }

        task.resume()
    }

    func fetchCharacterCount(completed: @escaping (Swift.Result<Character, Error>) -> Void) {

        let endpoint = baseURL + "/character)"

        guard let url = URL(string: endpoint) else {

            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

            if let _ = error { return }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }

            guard let data = data else { return }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let characterCount = try decoder.decode(Character.self, from: data)
                completed(.success(characterCount))
            } catch {
                return
            }
        }

        task.resume()
    }

}
