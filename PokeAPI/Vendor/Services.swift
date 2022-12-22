//
//  Services.swift
//  PokeAPI
//
//  Created by Stephen Giovanni Saputra on 22/12/22.
//

import Foundation
import Moya

enum Service {
    case getPokemon
    case getOnePokemon(id: Int)
}

extension Service: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://pokeapi.co")!
    }
    
    var path: String {
        switch self {
        case .getPokemon:
            return "/api/v2/pokemon"
        case .getOnePokemon(let id):
            return "/api/v2/pokemon/\(id)"
        }
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
