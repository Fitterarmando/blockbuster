//
//  CharactersListModelPresentation.swift
//  Blockbuster
//
//  Created by Juan Armando Frías Ramírez on 24/03/23.
//

import Foundation


struct CharactersListModelPresentationCollectionView {
    let image: String?
    let name: String
    let alias: String
}

extension CharacterModelDomain {
    func toPresentation() -> CharactersListModelPresentationCollectionView {
        let imageUrl : String?
        
        if profilePath == nil {
            imageUrl = "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ303bo2Il2JnLpEfDpV9vUU7sJm6GdFptrMAcsLWzD6Mtzuq-g"
        } else {
            imageUrl = "https://image.tmdb.org/t/p/w300_and_h450_bestv2/\(self.profilePath!)"
        }
        
        return CharactersListModelPresentationCollectionView(
            image: imageUrl,
            name: self.name,
            alias: self.alias
        )
    }
    
}


