//
//  CharactersCollectionView.swift
//  Blockbuster
//
//  Created by Juan Armando Frías Ramírez on 24/03/23.
//

import UIKit

class CharactersCollectionView: UICollectionView {
    var charactersMovieList : [CharactersListModelPresentationCollectionView] = []
    var onTap: (CharactersListModelPresentationCollectionView) -> Void = { movie in }
}

extension CharactersCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.layer.bounds.width/3
        return CGSize(width: width , height: 200)
    }
        
}

extension CharactersCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { charactersMovieList.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersItemCell.identifier, for: indexPath) as! CharactersItemCell
        let index = indexPath.item
        cell.configure(item: charactersMovieList[index], onTap: onTap)
        return cell
    }
    
}
