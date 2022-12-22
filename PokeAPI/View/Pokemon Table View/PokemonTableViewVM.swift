//
//  PokemonTableViewVM.swift
//  PokeAPI
//
//  Created by Stephen Giovanni Saputra on 22/12/22.
//

import Foundation
import Moya
import RxSwift
import RxMoya
import UIKit

class PokemonTableViewVM {
    
    let service = MoyaProvider<Service>()
    let imageService = MoyaProvider<ImageService>()
    let dispose = DisposeBag()
    
    let pokemon = PublishSubject<Pokemon>()
    let pokemonImage = PublishSubject<UIImage>()
    
    init() {
        getOnePokemon(id: Int.random(in: 1...900))
    }
    
    func getOnePokemon(id: Int) {
        
        service.rx.request(.getOnePokemon(id: id)).subscribe { event in
            
            switch event {
            case .success(let response):
                do {
                    let filter = try response.filterSuccessfulStatusCodes()
                    let mapped = try JSONDecoder().decode(Pokemon.self, from: filter.data)
                    self.pokemon.onNext(mapped)
                    self.getPokemonImage(url: mapped.sprites.frontDefault)
                } catch {
                    
                }
            case .failure(let error):
                print("DEBUG: \(error)")
            }
        }
        .disposed(by: dispose)
    }
    
    func getPokemon() {
        
        service.rx.request(.getPokemon).subscribe { event in
            
            switch event {
            case .success(let response):
                do {
                    let filter = try response.filterSuccessfulStatusCodes()
                    print(try JSONDecoder().decode(PokemonResponse.self, from: filter.data))
                } catch {
                    
                }
            case .failure(let error):
                print("DEBUG: \(error)")
            }
        }
        .disposed(by: dispose)
    }
    
    func getPokemonImage(url: String) {
        
        imageService.rx.request(.getPokemonImage(url: url)).subscribe { event in
            
            switch event {
            case .success(let response):
                do {
                    let filter = try response.filterSuccessfulStatusCodes()
                    self.pokemonImage.onNext(UIImage(data: filter.data) ?? UIImage())
                } catch {
                    
                }
            case .failure(let error):
                print("DEBUG: \(error)")
            }
        }
        .disposed(by: dispose)
    }
}
