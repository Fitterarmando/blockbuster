//
//  MovieDescriptionRepository.swift
//  Blockbuster
//
//  Created by Juan Armando Frías Ramírez on 30/03/23.
//

import Foundation

import Foundation

protocol MovieRepository {
    func getMovieDescription(movieId : String, completion: @escaping (Result<MovieDescriptionModel, ApiError>) -> Void)
    
    func getMovieList(completion: @escaping (Result<[MovieListModelDomain], ApiError>) -> Void)
    
    func getMovieCharacters(movieId: String, completion: @escaping (Result<[CharacterModelDomain], ApiError>) -> Void)
}
