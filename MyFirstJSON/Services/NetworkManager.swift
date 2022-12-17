//
//  NetworkManager.swift
//  RickAndMortyAPI
//
//  Created by Дмитрий on 16.12.2022.
//

import Foundation


//enum Link: String {
//    case imageURL = "https://applelives.com/wp-content/uploads/2016/03/iPhone-SE-11.jpeg"
//    case courseURL = "https://swiftbook.ru//wp-content/uploads/api/api_course"
//    case coursesURL = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
//    case aboutUsURL = "https://swiftbook.ru//wp-content/uploads/api/api_website_description"
//    case aboutUsURL2 = "https://swiftbook.ru//wp-content/uploads/api/api_missing_or_wrong_fields"
//    case postRequest = "https://jsonplaceholder.typicode.com/posts"
//    case courseImageURL = "https://swiftbook.ru/wp-content/uploads/sites/2/2018/08/notifications-course-with-background.png"
//}

//enum Linkq: String {
//   case
//}
//
//
//enum NetworkError: Error {
//    case invalidURL
//    case noData
//    case decodingError
//}
//
//class NetworkManager {
//    static let shared = NetworkManager()
//    
//    private init() {}
//    
//    
//    
//    func fetchImage(from url: String?, completion: @escaping(Result<Data, NetworkError>)  -> Void ) {
//        guard let url = URL(string: url ?? "") else {
//            completion(.failure(.invalidURL))
//            return
//        }
//        
//        DispatchQueue.global().async {
//            guard let imageData = try? Data(contentsOf: url) else {
//                completion(.failure(.noData))
//                return
//            }
//            DispatchQueue.main.async {
//                completion(.success(imageData))
//            }
//        }
//    }
//    
//    func fetch<T: Decodable>(_ type: T.Type, from url: String, completion: @escaping(Result<T, NetworkError>)  -> Void) {
//        guard let url = URL(string: url) else {
//            completion(.failure(.invalidURL))
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data else {
//                completion(.failure(.noData))
//                return
//            }
//            
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let type = try decoder.decode(T.self, from: data)
//                DispatchQueue.main.async {
//                    completion(.success(type))
//                }
//            } catch {
//                completion(.failure(.decodingError))
//            }
//        }.resume()
//    }
//}
