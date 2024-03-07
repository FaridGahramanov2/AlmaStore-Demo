//
//  DataBase.swift
//  AlmaStoreHW
//
//  Created by Farid Gahramanov on 14.08.22.
//

import Foundation

class DataBase {
    
    static let shareData = DataBase()
    
    let userDefaults = UserDefaults.standard
    
    var users: [ProductsAdd] = []
    
    func saveData() {
        if let encode = try? JSONEncoder().encode(users) {
            userDefaults.set(encode, forKey: "key")
            print("The Product Has Been Added")
        }
    }
    
    func readData(completion: @escaping([ProductsAdd]) -> Void) {
        if let data = userDefaults.value(forKey: "key") as? Data {
            if let users = try? JSONDecoder().decode([ProductsAdd].self, from: data) {
                self.users = users
                completion(self.users)
            }
        } else {}
    }
}
