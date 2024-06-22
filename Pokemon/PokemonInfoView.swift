//
//  PokemonInfoView.swift
//  Pokemon
//
//  Created by Vitor Henrique Barreiro Marinho on 02/05/24.
//

import UIKit

protocol InfoViewDelegate {
    func dismiss(with pokemon: Pokemon, flow: PokemonFlow)
    func showMoreDetails(with pokemon: Pokemon)
}

class PokemonInfoView: UIView {
    
    var delegate: InfoViewDelegate?
    var pokemon: Pokemon? {
        didSet {
            configureView()
        }
    }
    
    private lazy var nameContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainPink
        view.addSubview(nameLabel)
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .mainPink
        return label
    }()
    
    private let pokedexIdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .mainPink
        return label
    }()
    
    private let defenseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .mainPink
        return label
    }()
    
    private let heightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Height: 6"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .mainPink
        return label
    }()
    
    private let attackLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .mainPink
        return label
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Weight: 85"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .mainPink
        return label
    }()
    
    private let firstSeparatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        return view
    }()
    
    private let secondSeparatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        return view
    }()
    
    private let thirdSeparatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        return view
    }()
    
    private let fourthSeparatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        return view
    }()
    
    private let moreInfoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .mainPink
        button.setTitle("View More Info", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        layer.masksToBounds = true
        backgroundColor = .white
        
        configureLabels()
        configureImage(with: pokemon?.imageUrl)
        addSubViews()
        configureConstraints()
    }
    
    private func configureLabels() {
        guard let name = pokemon?.name,
              let type = pokemon?.type,
              let id = pokemon?.id,
              let defense = pokemon?.defense,
              let height = pokemon?.height,
              let attack = pokemon?.attack ,
              let weight = pokemon?.weight   else { return }
        
        nameLabel.text = name
        typeLabel.configureAttributedText(title: "type", details: type)
        pokedexIdLabel.configureAttributedText(title: "Pokedex Id", details: String(id))
        defenseLabel.configureAttributedText(title: "defense", details: String(defense))
        heightLabel.configureAttributedText(title: "height", details: String(height))
        attackLabel.configureAttributedText(title: "attack", details: String(attack))
        weightLabel.configureAttributedText(title: "weight", details: String(weight))
    }
    
    private func addSubViews() {
        addSubview(nameContainerView)
        addSubview(imageView)
        addSubview(typeLabel)
        addSubview(defenseLabel)
        addSubview(heightLabel)
        addSubview(pokedexIdLabel)
        addSubview(attackLabel)
        addSubview(weightLabel)
        addSubview(moreInfoButton)
        addSubview(firstSeparatorView)
        addSubview(secondSeparatorView)
        addSubview(thirdSeparatorView)
        addSubview(fourthSeparatorView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            nameContainerView.topAnchor.constraint(equalTo: topAnchor),
            nameContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameContainerView.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.centerXAnchor.constraint(equalTo: nameContainerView.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: nameContainerView.centerYAnchor),
            
            imageView.heightAnchor.constraint(equalToConstant: 60),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.topAnchor.constraint(equalTo: nameContainerView.bottomAnchor,constant: 30),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            typeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            typeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            typeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            pokedexIdLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            pokedexIdLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            firstSeparatorView.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 20),
            firstSeparatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            firstSeparatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            firstSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            
            secondSeparatorView.topAnchor.constraint(equalTo: pokedexIdLabel.bottomAnchor, constant: 20),
            secondSeparatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            secondSeparatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            secondSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            
            
            heightLabel.topAnchor.constraint(equalTo: secondSeparatorView.bottomAnchor, constant: 20),
            heightLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            heightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            weightLabel.topAnchor.constraint(equalTo: secondSeparatorView.bottomAnchor, constant: 20),
            weightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            
            thirdSeparatorView.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 20),
            thirdSeparatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            thirdSeparatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            thirdSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            
            
            
            
            
            fourthSeparatorView.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 20),
            fourthSeparatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            fourthSeparatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            fourthSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            
            
            attackLabel.topAnchor.constraint(equalTo: fourthSeparatorView.bottomAnchor, constant: 30),
            attackLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            
            
            
            defenseLabel.topAnchor.constraint(equalTo: fourthSeparatorView.bottomAnchor, constant: 30),
            defenseLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            
            moreInfoButton.topAnchor.constraint(equalTo: attackLabel.bottomAnchor, constant: 40),
            
            moreInfoButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            moreInfoButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            moreInfoButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func configureImage(with urlString: String?) {
        guard let imageUrl = urlString,
              let url = URL(string: imageUrl) else { return }
        
        imageView.sd_setImage(with: url)
    }
    
    private func configureButton() {
        moreInfoButton.addTarget(self, action: #selector(showMoreInfo), for: .touchUpInside)
    }
    
    @objc private func showMoreInfo() {
        guard let pokemon = pokemon else { return }
        delegate?.dismiss(with: pokemon, flow: .info)
        delegate?.showMoreDetails(with: pokemon)
                
    }
    
    
}


extension UILabel {
    func configureAttributedText(title: String, details: String) {
        
        let attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: "\(title): ", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.mainPink]) )
        
        attributedText.append(NSAttributedString(string: "\(details)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        self.attributedText = attributedText
    }
    
}
