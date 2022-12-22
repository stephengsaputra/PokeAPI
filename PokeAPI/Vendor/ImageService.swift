//
//  ImageService.swift
//  PokeAPI
//
//  Created by Stephen Giovanni Saputra on 22/12/22.
//

import Foundation
import Moya

enum ImageService {
    case getPokemonImage(url: String)
}

extension ImageService: TargetType {
    
    var baseURL: URL {
        switch self {
        case .getPokemonImage(let url):
            return URL(string: url)!
        }
    }
    
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return [:]
    }
}
