//
//  CharactersItemCell.swift
//  Blockbuster
//
//  Created by Juan Armando Frías Ramírez on 24/03/23.
//

import UIKit
class CharactersItemCell : UICollectionViewCell {
    static let identifier = "CharactersItemCell"
    
    
    @IBOutlet var shadow: UIView!
    @IBOutlet var card: UIView!
    @IBOutlet var image: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var alias: UILabel!
    
    var item: CharactersListModelPresentationCollectionView? = nil
    var onTap: (CharactersListModelPresentationCollectionView) -> Void = { movie in }

    func configure(
        item: CharactersListModelPresentationCollectionView,
        onTap: @escaping (CharactersListModelPresentationCollectionView) -> Void
    ) {
        self.item = item
        self.onTap = onTap
        
        name.text = item.name
        alias.text = item.alias
        image.load(url: item.image)
    
        card.roundCorners()
        shadow.addShadow()
     
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
    }
   
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let item = item else { return }
        onTap(item)
    }
    
}
    
    
    
    
    
    
    
    
    
