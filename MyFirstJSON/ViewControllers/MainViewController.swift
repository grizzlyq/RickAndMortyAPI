//
//  ViewController.swift
//  MyFirstJSON
//
//  Created by Дмитрий on 14.12.2022.
//

import UIKit



class MainViewController: UITableViewController {
    
    
    var characterCount = 0
    var page = 1
    var hasMoreContent = true
    var characters: Character?
    var results: [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRickAndMorty()
//        fetchCharacters(page: page)
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        let result = results[indexPath.row]
        cell.configure(with: result)
        

        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
//    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        let offsetY = scrollView.contentOffset.y
//        let contentHeight = scrollView.contentSize.height
//        let height = scrollView.frame.size.height
//        
//        if offsetY > contentHeight - height {
//            guard hasMoreContent else { return }
//            page += 1
//            fetchCharacters(page: page)
//        }
//    }
}

// MARK: - Network Call

//extension MainViewController {
//    
//    func fetchCharacters(page: Int) {
//        
//        NetworkManager.shared.fetchCharacters(page: page) { [weak self]
//            result in
//            guard let self = self else { return }
//            
//            switch result {
//            case .success(let response):
//                if self.results.count < self.characterCount { self.hasMoreContent = false }
//                
//                self.results += response.results
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            case .failure(_):
//                return
//            }
//        }
//    }
//}

    

extension MainViewController {
    private func fetchRickAndMorty() {
        guard let url = URL(string: Link.baseURL.rawValue) else { return }

        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let character = try JSONDecoder().decode(Character.self, from: data)
                DispatchQueue.main.sync {
                    self?.tableView.reloadData()
                }
                print(character)
            } catch let error {
                print(error)
            }

        }.resume()
    }
}


