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
    @IBOutlet var popularityView: UIView!
    
    var item: MovieListModelPresentation? = nil
    var onTap: (MovieListModelPresentation) -> Void = { movie in }
    
    func configure(
        item: MovieListModelPresentation,
        onTap: @escaping (MovieListModelPresentation) -> Void
    ) {
        
        self.item = item
        self.onTap = onTap
        
        title.text = item.originalTittle
        releaseDate.text = "\(item.releaseDate)"
        posterPath.load(
            url: item.posterPath,
            contentMode: .scaleAspectFill
        )
        popularity.text = "\(item.popularity)"
        
        card.roundCorners()
        shadow.addShadow()
        popularityView.roundCorners()
        
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
    
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let item = item else { return }
        onTap(item)
    }
    
}
