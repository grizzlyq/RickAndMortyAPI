//
//  Model.swift
//  MyFirstJSON
//
//  Created by Дмитрий on 14.12.2022.
//

//
//enum Link: String {
//    case secondLink = "https://rickandmortyapi.com/api/character"
//}

// MARK: - Character
struct Character: Codable {
    let info: Info
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let location: Location
    let image: String
}

// MARK: - Location
struct Location: Codable {
    let name: String
}

// MARK: - Info
struct Info: Codable {
    let count: Int
    let next: String
}
