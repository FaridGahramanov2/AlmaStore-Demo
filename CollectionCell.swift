//
//  CollectionCell.swift
//  AlmaStoreHW
//
//  Created by Farid Gahramanov on 07.08.22.
//

import UIKit

class CollectionCell: BaseCollectionCell {
    
    var item: Products? {
        didSet {
            guard let item = item else { return }
            imageView.image = UIImage(named: item.image)
            moneyLabel.text = item.amount
            describitionLabel.text = item.describtion
            locationLabel.text = item.location
            dataLabel.text = item.date
            timeLabel.text = item.time
        }
    }
    
    let containerView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.shadow(cornerRadius: 6, offset: CGSize(width: 0, height: 0.2), color: .systemGray3, radius: 3, opacity: 0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let moneyLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let describitionLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var stackViewIntro: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.spacing = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let locationLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dataLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupView() {
        super.setupView()

        contentView.addSubview(containerView)
        contentView.addSubview(imageView)
        contentView.addSubview(moneyLabel)
        contentView.addSubview(describitionLabel)
        contentView.addSubview(stackViewIntro)
        stackViewIntro.addArrangedSubview(locationLabel)
        stackViewIntro.addArrangedSubview(dataLabel)
        stackViewIntro.addArrangedSubview(timeLabel)

        NSLayoutConstraint.activate([
            
            
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
 
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
// imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -90),
            imageView.heightAnchor.constraint(equalToConstant: 110),
            
            moneyLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            moneyLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            
            describitionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            describitionLabel.topAnchor.constraint(equalTo: moneyLabel.bottomAnchor, constant: 6),
            
            stackViewIntro.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            stackViewIntro.topAnchor.constraint(equalTo: describitionLabel.bottomAnchor, constant: 4),
            
            
        ])
        
        
    }
    
    
    
}

extension UIView {
    
    func shadow(cornerRadius: CGFloat = 4,  offset: CGSize = CGSize(width: -1.1, height: 1.1), color: UIColor = UIColor.black.withAlphaComponent(0.3), radius: CGFloat = 1, opacity: Float = 0.5) {
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowOffset = offset
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
    }
}
