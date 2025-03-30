//
//  Book.swift
//  ios-swinject-example-swiftUI
//
//  Created by Julio Cesar Pereira on 29/03/25.
//

import Foundation

class Book: Product {
    var name: String
    var sold: Bool
    
    init(name: String, sold: Bool) {
        self.name = name
        self.sold = sold
    }
}
