//
//  MovieListRepositoryImpl.swift
//  Blockbuster
//
//  Created by Juan Armando Frías Ramírez on 29/03/23.
//

import Foundation

class MovieRepositoryImpl : MovieRepository {
    
    private let movieApi : MovieApi
    
    init(movieListApi : MovieApi) {
        self.movieApi = movieListApi
    }
    
    func getMovieList(completion: @escaping (Result<[MovieListModelDomain], ApiError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.movieApi.getMovieListApi { result in
                switch result {
                case.success(let response):
                    completion(.success(response.results.map { value in value.toDomain() }))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    
    func getMovieCharacters(movieId: String, completion: @escaping (Result<[CharacterModelDomain], ApiError>) -> Void) {
        movieApi.getCharactersApi(movieId: movieId) { result in
            switch result {
            case.success(let response):
                completion(.success(response.cast.map { value in value.toDomain() }))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
    func getMovieDescription(movieId : String,  completion: @escaping (Result<MovieDescriptionModel, ApiError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            self.movieApi.getDescriptionApi(movieId: movieId) { result in
                switch result {
                case.success(let response):
                    completion(.success(response.toDomain()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
            
        }
    }
    
}


