//
//  CharactersRepository.swift
//  Blockbuster
//
//  Created by Juan Armando Frías Ramírez on 10/04/23.
//

import Foundation

protocol CharactersRepository {
    func getMovieCharacters(completion: @escaping (Result<[MovieListModelDomain], ApiError>) -> Void)
}
