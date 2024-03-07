//
//  ViewController.swift
//  AlmaStoreHW
//
//  Created by Farid Gahramanov on 07.08.22.
//

import UIKit

class ViewController: UIViewController {
    
    let dataBaseVC = DataBase.shareData
    
    var productsApp: [Products] = [
    
        Products(image: "img_1", amount: "3 850 AZN", describtion: "Apple MacBook Pro\n14-inch, MKGR3RU/A", location: "Baki,", date: "bugun,", time: "8:40"),
        Products(image: "img_2", amount: "2 170 AZN", describtion: "Apple MacBook Pro\n14-inch, MKGR3RU/A", location: "Baki,", date: "bugun,", time: "8:40"),
        Products(image: "img_3", amount: "4 675 AZN", describtion: "Apple MacBook Pro\n14-inch, MKGR3RU/A", location: "Baki,", date: "bugun,", time: "8:40"),
        Products(image: "img_4", amount: "2 099 AZN", describtion: "Apple MacBook Pro\n14-inch, MKGR3RU/A", location: "Baki,", date: "bugun,", time: "8:40"),
        Products(image: "img_5", amount: "3 434 AZN", describtion: "Apple MacBook Pro\n14-inch, MKGR3RU/A", location: "Baki,", date: "bugun,", time: "8:40"),
        Products(image: "img_6", amount: "2 450 AZN", describtion: "Apple MacBook Pro\n14-inch, MKGR3RU/A", location: "Baki,", date: "bugun,", time: "8:40"),
        Products(image: "img_7", amount: "5 779 AZN", describtion: "Apple MacBook Pro\n14-inch, MKGR3RU/A", location: "Baki,", date: "bugun,", time: "8:40"),
        Products(image: "img_1", amount: "3 850 AZN", describtion: "Apple MacBook Pro\n14-inch, MKGR3RU/A", location: "Baki,", date: "bugun,", time: "8:40"),
        Products(image: "img_2", amount: "3 850 AZN", describtion: "Apple MacBook Pro\n14-inch, MKGR3RU/A", location: "Baki,", date: "bugun,", time: "8:40"),
        Products(image: "img_3", amount: "3 850 AZN", describtion: "Apple MacBook Pro\n14-inch, MKGR3RU/A", location: "Baki,", date: "bugun,", time: "8:40"),
        Products(image: "img_4", amount: "3 850 AZN", describtion: "Apple MacBook Pro\n14-inch, MKGR3RU/A", location: "Baki,", date: "bugun,", time: "8:40"),
        Products(image: "img_5", amount: "3 850 AZN", describtion: "Apple MacBook Pro\n14-inch, MKGR3RU/A", location: "Baki,", date: "bugun,", time: "8:40")

    ]
        
    let introLabel: UILabel = {
        let label = UILabel()
        label.text = "Istifadəçinin digər elanları"
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.layer.cornerRadius = 20
        view.delegate = self
        view.dataSource = self
        view.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.description())
        view.showsVerticalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var stackViewAdd: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.spacing = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let productNameTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Name of the product"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let productPriceTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Price of the product"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Product", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 7
        button.addTarget(self, action: #selector(didTapAddPage), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(collectionView)
       
       
 
        NSLayoutConstraint.activate([
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: introLabel.topAnchor, constant: 50),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -110),

        ])
        
    }
    
    @objc private func didTapAddPage() {
        guard let nameOfProduct = productNameTextField.text, !nameOfProduct.isEmpty else { return }
        guard let priceOfProduct = productPriceTextField.text, !priceOfProduct.isEmpty else { return }

        if nameOfProduct != priceOfProduct {
            
            let userData = ProductsAdd(describtionOfProduct: nameOfProduct, amoutOfProduct: priceOfProduct)
            dataBaseVC.users.append(userData)
            dataBaseVC.saveData()
        }
        else {
           
        }
    }
}
    

extension ViewController: CollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsApp.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.description(), for: indexPath) as? CollectionCell {
            cell.item = productsApp[indexPath.item]
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(productsApp[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2, height: 200)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}
