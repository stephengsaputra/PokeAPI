//
//  ViewController.swift
//  PokeAPI
//
//  Created by Stephen Giovanni Saputra on 22/12/22.
//

import UIKit
import SnapKit
import RxMoya
import RxSwift

class PokemonTableViewVC: UIViewController {

    // MARK: - Properties
    let vm = PokemonTableViewVM()
    let dispose = DisposeBag()
    
    var pokemon: Pokemon?
    
    internal lazy var pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    internal lazy var pokemonImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.width.equalTo(200)
        }
        return image
    }()
    
    internal lazy var button: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        button.setTitle("Generate New Pokemon", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureUI()
        
        vm.pokemon.subscribe { data in
            data.map { pokemon in
                self.pokemon = pokemon
                self.pokemonNameLabel.text = String(pokemon.name.capitalized)
            }
        }
        .disposed(by: dispose)
        
        vm.pokemonImage.subscribe { data in
            data.map { image in
                self.pokemonImage.image = image
            }
        }
        .disposed(by: dispose)
    }
    
    // MARK: - Selectors
    @objc func handleButton() {
        vm.getOnePokemon(id: Int.random(in: 1...900))
    }
    
    @objc func handleTap() {
        print(pokemon?.abilities)
    }
    
    // MARK: - Helpers
    func configureUI() {
        
        view.backgroundColor = .systemYellow
        
        let stack = UIStackView(arrangedSubviews: [pokemonImage, pokemonNameLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 5
        stack.distribution = .equalSpacing
        
        view.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        stack.addGestureRecognizer(tapGesture)
        
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(10)
        }
    }
}

