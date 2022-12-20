//
//  Model.swift
//  MyFirstJSON
//
//  Created by Дмитрий on 14.12.2022.
//


struct RickAndMorty: Codable {
    let info: Info
    let results: [Character]
}

struct Info: Codable{
    let pages: Int
    let next: String?
    let prev: String?
}

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    
    init(value: [String: Any]) {

        let diction = value["location"] as? [String: Any]

        id = value["id"] as? Int ?? 1
        name = value["name"] as? String ?? ""
        status = value["status"] as? String ?? ""
        species = value["species"] as? String ?? ""
        gender = value["gender"] as? String ?? ""
        origin = Location(value: diction ?? ["":""] )
        location = Location(value: diction ?? ["":""])
        image = value["image"] as? String ?? ""
        episode = value["episode"] as? [String] ?? []
        url = value["url"] as? String ?? ""
     }
    
    var description: String {
        """
    Name: \(name)
    Status: \(status)
    Species: \(species)
    Gender: \(gender)
    Origin: \(String(describing: origin.name))
    Location: \(String(describing: location.name))
    """
    }
}

struct Location: Codable {
    let name: String
    
    init(value: [String:Any]) {
        name = value["name"] as? String ?? ""
    }
}
enum Link: String {
    case rickAndMortyApi = "https://rickandmortyapi.com/api/character/2" 
}

//struct Episode: Decodable {
//    let name: String
//    let date: String
//    let episode: String
//    let characters: [String]
//
//    var description: String {
//        """
//    Title: \(name)
//    Date: \(date)
//    """
//    }
//
//    enum CodingKeys: String, CodingKey {
//        case name = "name"
//        case date = "air_date"
//        case episode = "episode"
//        case characters = "characters"
//    }
//}
