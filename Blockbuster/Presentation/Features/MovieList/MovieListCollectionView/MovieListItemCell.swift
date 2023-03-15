//
//  MovieListItemCell.swift
//  Blockbuster
//
//  Created by Juan Armando Frías Ramírez on 15/03/23.
//

import UIKit

class MovieListItemCell: UICollectionViewCell {
    static let identifier = "MovieListItemCell"
    
    
    @IBOutlet var shadow: UIView!
    @IBOutlet var card: UIView!
    @IBOutlet var posterPath: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var releaseDate: UILabel!
    @IBOutlet var popularity: UILabel!
    
    var item: MovieListModelPresentation? = nil
    
    func configure(item: MovieListModelPresentation) {
        self.item = item
        
        
    }
    
    
    
    
    
    
    
}
