//
//  MovieListApi.swift
//  Blockbuster
//
//  Created by Juan Armando Frías Ramírez on 29/03/23.
//

import Foundation
import Alamofire

struct MovieApi {
    private let apiManager : APIManager
    
    init(apiManager : APIManager) {
        self.apiManager = apiManager
    }
    
    func getMovieListApi(completion: @escaping(Result<MoviesModelData, ApiError>) -> Void) {
        let request = Request(method: .get, path: "movie/popular")
        apiManager.request(urlRequest: request) { (result: Swift.Result<MoviesModelData, ApiError>) in completion(result)
        }
    }
    
    func getCharactersApi(movieId : String, completion: @escaping(Result<CharactersModelData, ApiError>) -> Void) {
        let request = Request(method: .get, path: "movie/\(movieId)/credits")
        apiManager.request(urlRequest: request) { (result: Swift.Result<CharactersModelData, ApiError>) in completion(result)
        }
    }
    
    func getDescriptionApi(movieId : String, completion: @escaping(Result<MovieDescriptionModelData, ApiError>) -> Void) {
        let request = Request(method: .get, path: "movie/\(movieId)")
        apiManager.request(urlRequest: request) { (result: Swift.Result<MovieDescriptionModelData, ApiError>) in completion(result)
        }
    }
    
    
}
