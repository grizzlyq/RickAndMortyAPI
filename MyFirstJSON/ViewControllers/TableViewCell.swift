//
//  TableViewCell.swift
//  RickAndMortyAPI
//
//  Created by Дмитрий on 18.12.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var characterImageLabel: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    func configure(with result: Result) {

        nameLabel.text = result.name
        statusLabel.text = result.status
        genderLabel.text = result.gender
        locationLabel.text = result.location.name
        
        guard let url = URL(string: Link.testImageURL.rawValue) else { return }
        
        DispatchQueue.global().async { [weak self] in
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self?.characterImageLabel.image = UIImage(data: imageData)
            }
        }
    }
}

