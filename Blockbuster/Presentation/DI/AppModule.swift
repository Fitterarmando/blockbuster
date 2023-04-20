//
//  AppModule.swift
//  Blockbuster
//
//  Created by Juan Armando Frías Ramírez on 04/04/23.
//

import Foundation
import Alamofire
import Resolver

extension Resolver: ResolverRegistering {
    
    public static func registerAllServices() {
        register { RequestInterceptor() }.implements(Alamofire.RequestInterceptor.self)
        register { Session(interceptor: optional()) }
        register { APIManager(sessionManager: resolve()) }
        
        register { MovieApi(apiManager: resolve()) }
        register { MovieRepositoryImpl(movieListApi: resolve()) }.implements(MovieRepository.self)
        
        register { MovieApi(apiManager: resolve()) }
        register { MovieRepositoryImpl(movieListApi: resolve()) }.implements(MovieRepository.self)
    }
    
}
