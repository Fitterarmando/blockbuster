//
//  MovieDescription .swift
//  Blockbuster
//
//  Created by Juan Armando Frías Ramírez on 24/03/23.
//

import UIKit
import Resolver

class MovieDescriptionVC: UIViewController {
    @Injected var  movieDescriptionRepository: MovieRepository
    
    var movieId: Int? = nil
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var shadow: UIView!
    @IBOutlet var card: UIView!
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var genre: UILabel!
    @IBOutlet var duration: UILabel!
    @IBOutlet var overView: UILabel!
    @IBOutlet var descriptionOverView: UILabel!
    @IBOutlet var charactersCollectionView : CharactersCollectionView!
    
    var isMovieDescriptionDone = false
    var isCharactersDone = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        charactersCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
        charactersCollectionView.register(UINib(nibName: CharactersItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: CharactersItemCell.identifier)
        charactersCollectionView.dataSource = charactersCollectionView
        charactersCollectionView.delegate = charactersCollectionView
        
        activityIndicator.startAnimating()
        shimmering()
        
        self.shadow.addShadow()
        self.card.roundCorners()
        
        movieDescriptionRepository.getMovieCharacters(movieId: "\(movieId!)" ) { result in
            self.isCharactersDone = true
            self.hideActivityIndicator()
            
            switch result {
            case.success(let characters):
                self.charactersCollectionView.charactersMovieList = characters.map { character in
                    character.toPresentation()
                }
                
                self.charactersCollectionView.reloadData()
                
            case .failure(let error):
                print("Error")
            }
        }
    }
    
    private func hideActivityIndicator() {
        if isMovieDescriptionDone && isCharactersDone {
            self.activityIndicator.stopAnimating()
        }
    }
    
    private func shimmering() {
        movieImage.startShimmering()
        movieDescriptionRepository.getMovieDescription(movieId: "\(movieId!)" ) { result in
            self.isMovieDescriptionDone = true
            self.hideActivityIndicator()
            
            switch result {
            case.success(let description):
                var descriptionPresentation = description.toPresentation()
                
        
                self.movieImage.load(url: descriptionPresentation.movieImage) {
                    self.movieImage.stopShimmering()
                }
                
                self.movieTitle.text = descriptionPresentation.title
                self.date.text = descriptionPresentation.date
                self.genre.text = descriptionPresentation.genre.joined(separator: ",")
                self.duration.text = "\(descriptionPresentation.duration)"
                self.descriptionOverView.text = descriptionPresentation.description
                
            case .failure(let error):
                print("Error")
            }
            
        }
        
    }
    
    /* private let descriptionFakeList = [
     CharactersListModelPresentationCollectionView(
     image: "https://static.wikia.nocookie.net/disney/images/1/1c/Jessica_Chastain.jpg/revision/latest?cb=20190827205115",
     name: "Jessica Chastain",
     alias: "Annie"),
     CharactersListModelPresentationCollectionView(
     image: "https://people.com/thmb/pzxY5GquwpKVdX5heGDH2NXfEjE=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(732x659:734x661)/nikolaj-coster-waldau-2000-5fdb3f8e7efb4455a37042a268941ead.jpg",
     name: "Nikolaj Coster-Waldau",
     alias: "Lucas Desange"),
     CharactersListModelPresentationCollectionView(
     image: "https://m.media-amazon.com/images/M/MV5BYTQ4YjM2OTUtNTA1MS00YjUyLWJiMzAtMTA2OGJkN2JlZmI1XkEyXkFqcGdeQXVyMTg1NDg3MDE@._V1_.jpg",
     name: "Megan Charpentier",
     alias: "Victoria Desange"),
     CharactersListModelPresentationCollectionView(
     image: "https://static.wikia.nocookie.net/doblaje/images/0/08/Gettyimages-841285846.jpg/revision/latest?cb=20201108145001&path-prefix=es",
     name: "Javier Botet",
     alias: "Mama")
     ]
     
     
     private let infoMovieFakeList =
     MovieDescriptionModelPresentation(
     movieImage: "https://upload.wikimedia.org/wikipedia/en/1/11/Mama_2012_poster.jpg",
     title: "Mama",
     date: "2013",
     genre: ["Terror"],
     duration: 1 ,
     description: "Hace cinco años, el mismo día en que su madre fue asesinada, las pequeñas Victoria y Lilly desaparecieron en el bosque. Buscadas incansablemente por su tío Lucas y su novia Annabel, son encontradas unos años más tarde en una cabaña en medio de la naturaleza, donde han vivido aisladas de toda civilización. Comienza entonces una nueva vida para las niñas de la mano de Lucas y Annabel, pero éstos pronto descubren que alguien o algo misterioso las sigue arropando por las noches.")
     
     
     
     
     /*CharactersListModelPresentation(
      movieImage: "https://m.media-amazon.com/images/I/71joHYm1vWL._AC_SL1000_.jpg",
      title: "Una esposa de Mentira",
      date: "2011",
      genre: "Comedy",
      duration: "1h 17m",
      description: "El cirujano Danny decide contratar a su ayudante Katherine, una madre soltera con hijos, para que finjan ser su familia. Su intención es demostrarle a Palmer que su amor por ella es tan grande que está a punto de divorciarse de su mujer.")*/
     
     */
}
