//
//  ViewController.swift
//  Blockbuster
//
//  Created by Juan Armando Frías Ramírez on 15/03/23.
//

import UIKit

class MovieListVC: UIViewController {
    
    @IBOutlet var movieListCollectionView: MovieListCollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Movie List"
        
        movieListCollectionView.register(UINib(nibName: MovieListItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: MovieListItemCell.identifier)
        movieListCollectionView.dataSource = movieListCollectionView
        movieListCollectionView.delegate = movieListCollectionView
        
        movieListCollectionView.onTap = { movie in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MovieDescriptionVC") as! MovieDescriptionVC
            vc.movieId = movie.id
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.show(vc, sender: self)
        }
        
   
        self.movieListCollectionView.collectionMovieList = fakeList
        self.movieListCollectionView.reloadData()

     
    }
    
}

private let fakeList = [
    MovieListModelPresentation(
        id: 1452,
        posterPath: "https://pics.filmaffinity.com/Scream_VI-477367531-large.jpg",
        popularity: 8,
        originalTittle: "Scream 6",
        releaseDate: "20 Marzo 23"),
    MovieListModelPresentation(
        id: 1452,
        posterPath: "https://pics.filmaffinity.com/Scream_VI-477367531-large.jpg",
        popularity: 86,
        originalTittle: "Scream 6",
        releaseDate: "20 Marzo 23"),
    MovieListModelPresentation(
        id: 1452,
        posterPath: "https://pics.filmaffinity.com/Scream_VI-477367531-large.jpg",
        popularity: 86,
        originalTittle: "Scream 6",
        releaseDate: "20 Marzo 23"),
    MovieListModelPresentation(
            id: 1452,
            posterPath: "https://pics.filmaffinity.com/Scream_VI-477367531-large.jpg",
            popularity: 86,
            originalTittle: "Scream 6",
            releaseDate: "20 Marzo 23"),
    MovieListModelPresentation(
        id: 1452,
        posterPath: "https://pics.filmaffinity.com/Scream_VI-477367531-large.jpg",
        popularity: 86,
        originalTittle: "Scream 6",
        releaseDate: "20 Marzo 23"),
    MovieListModelPresentation(
        id: 1452,
        posterPath: "https://pics.filmaffinity.com/Scream_VI-477367531-large.jpg",
        popularity: 86,
        originalTittle: "Scream 6",
        releaseDate: "20 Marzo 23")
]
