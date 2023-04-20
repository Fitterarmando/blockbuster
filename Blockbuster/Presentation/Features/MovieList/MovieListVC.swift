//
//  ViewController.swift
//  Blockbuster
//
//  Created by Juan Armando Frías Ramírez on 15/03/23.
//

import UIKit
import Resolver

class MovieListVC: UIViewController {
    @Injected var movieListRepository: MovieRepository
    
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var movieListCollectionView: MovieListCollectionView!
    
    @IBOutlet var emptyState: UIScrollView!
    @IBOutlet var emptyStateImage: UIImageView!
    @IBOutlet var emptyStateMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Popular Movies"
        emptyState.isHidden = true
        movieListCollectionView.isHidden = true
        
        movieListCollectionView.register(UINib(nibName: MovieListItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: MovieListItemCell.identifier)
        movieListCollectionView.dataSource = movieListCollectionView
        movieListCollectionView.delegate = movieListCollectionView
        
        activityIndicator.startAnimating()
        updateMovieList()
        
        
        
        configureRefreshControl()
        
        movieListCollectionView.onTap = { movie in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MovieDescriptionVC") as! MovieDescriptionVC
            vc.movieId = movie.id
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.show(vc, sender: self)
        }
    }
    
    private func setCollectionView(movieList: [MovieListModelDomain]) {
        movieListCollectionView.isHidden = false
        emptyState.isHidden = true
        
        //
        let movieListPresentation = movieList.map { value in value.toPresentation() }
        self.movieListCollectionView.collectionMovieList = movieListPresentation
        self.movieListCollectionView.reloadData()
    }
    
    private func setEmptyState(imageName: String , errorDescription: String ) {
        movieListCollectionView.isHidden = true
        emptyState.isHidden = false
        
        emptyStateImage.image = UIImage(named: imageName)
        self.emptyStateMessage.text = errorDescription
    }
    
    private func hideActivityIndicator() {
        self.activityIndicator.stopAnimating()
    }
    
    func configureRefreshControl () {
        // Add the refresh control to your UIScrollView object.
        emptyState.refreshControl = UIRefreshControl()
        emptyState.refreshControl?.addTarget(self, action:
                                                #selector(updateMovieList),
                                             for: .valueChanged)
        movieListCollectionView.refreshControl = UIRefreshControl()
        movieListCollectionView.refreshControl?.addTarget(self, action:
                                                            #selector(updateMovieList),
                                                          for: .valueChanged)
    }
    
    @objc func updateMovieList () {
        movieListRepository.getMovieList { result in
            self.hideActivityIndicator()
            self.emptyState.refreshControl?.endRefreshing()
            self.movieListCollectionView.refreshControl?.endRefreshing()
            
            switch result {
            case.success(let movieList):
                
                if movieList.isEmpty {
                    self.setEmptyState(imageName: "empty_list", errorDescription: "No hay peliculas por el momento")
                } else {
                    self.setCollectionView(movieList: movieList)
                }
                
            case .failure(let error):
                self.setEmptyState(imageName: "empty_list", errorDescription: "Algo salio mal, vuelve a intentarlo mas tarde")
                print("Error")
            }
        }
    }
}
