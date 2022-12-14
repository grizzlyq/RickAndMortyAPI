//
//  Model.swift
//  MyFirstJSON
//
//  Created by Дмитрий on 14.12.2022.
//


enum Link: String {
    case firstLink = "https://http.cat/401"
    case secondLink = "https://rickandmortyapi.com/api/character/108"
}

struct RickAndMortyCharacters: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: [String: String]
    let location: [String: String]
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
