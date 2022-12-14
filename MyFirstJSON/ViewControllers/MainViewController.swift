//
//  ViewController.swift
//  MyFirstJSON
//
//  Created by Дмитрий on 14.12.2022.
//

import UIKit

//enum Link: String {
//    case firstLink = "https://random.dog/woof.json"
//}

class MainViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchImage()
        fetchRickAndMorty()
    }

    private func fetchImage() {
        guard let url = URL(string: Link.firstLink.rawValue) else { return }

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in

            guard let data, let response else {
                print(error?.localizedDescription ?? "No error description")
                return
            }

            print(response)

            guard let image = UIImage(data: data) else { return }

            DispatchQueue.main.async {
                self?.imageView.image = image
            }

        }.resume()
    }
    
//    private func fetchData() {
//        guard let url = URL(string: Link.secondLink.rawValue) else { return }
//
//        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
//
//            guard let data, let response else {
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//
//            print(response)
//
//            guard let bitcoinPrice = UI
//        }
//    }
    

}

extension MainViewController {
    private func fetchRickAndMorty() {
        guard let url = URL(string: Link.secondLink.rawValue) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let character = try JSONDecoder().decode(RickAndMortyCharacters.self, from: data)
                print(character)
            } catch let error {
                print(error.localizedDescription)
            }


        }.resume()
    }
}


