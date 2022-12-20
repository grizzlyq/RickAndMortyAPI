//
//  TableViewCell.swift
//  RickAndMortyAPI
//
//  Created by Дмитрий on 18.12.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView! {
        didSet {
            characterImageView.contentMode = .scaleAspectFit
            characterImageView.clipsToBounds = true
            characterImageView.layer.cornerRadius = characterImageView.frame.height / 2
            characterImageView.backgroundColor = .white
        }
    }
    
    // MARK: - Public methods
    func configure(with character: Character?) {
        nameLabel.text = character?.name
        NetworkManager.shared.fetchImage(from: character?.image) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.characterImageView.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}

