//
//  MovieListCollectionView.swift
//  Blockbuster
//
//  Created by Juan Armando Frías Ramírez on 15/03/23.
//

import UIKit

class MovieListCollectionView: UICollectionView {
    var collectionMovieList : [MovieListModelPresentation] = []
}

extension MovieListCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Constants.SCREEN_WIDTH, height: 150)
    }
}
 
extension MovieListCollectionView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { collectionMovieList.count }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieListItemCell.identifier, for: indexPath) as! MovieListItemCell
        let index = indexPath.item
        cell.configure(item: collectionMovieList[index])
        return cell
    }
    

}
