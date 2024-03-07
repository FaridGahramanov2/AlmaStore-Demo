//
//  DataCollection.swift
//  AlmaStoreHW
//
//  Created by Farid Gahramanov on 07.08.22.
//

import Foundation

struct Products {
    let image: String
    let amount: String
    let describtion: String
    let location: String
    let date: String
    let time: String
}

struct ProductsAdd: Codable {
    let describtionOfProduct: String
    let amoutOfProduct: String
}

