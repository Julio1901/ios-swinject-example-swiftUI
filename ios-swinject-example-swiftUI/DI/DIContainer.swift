//
//  DIContainer.swift
//  ios-swinject-example-uiKit
//
//  Created by Julio Cesar Pereira on 29/03/25.
//

import Foundation
import Swinject

class DIContainer {
    static let shared = DIContainer()
    let container = Container()
    
    private init () {
        
        //MARK: Basic examples
        container.register(
            Vehicle.self,
            factory: { _ in Car(name: "Honda Civic")}
        )
        container.register(Person.self, factory: { r in
            Driver(name: "Julio Cesar", vehicle: r.resolve(Vehicle.self)!)
        })
        
        
        //MARK: Examples with Named Registration
        container.register(Drink.self, name: "coffee", factory: { _ in
            Coffee(drinkType: "Coffee")
        })
        
        container.register(Drink.self, name: "tea", factory: { _ in
            Tea(drinkType: "tea")
        })
        
        //MARK: Registration examples with arguments
        container.register(Product.self, factory: { _, name, sold in
            Book(name: name, sold: sold)
        })
        
        //MARK: overwritten example
        container.register(Product.self, factory: { _, name, sold in
            let test: String = name
            return Book(name: "overwritten", sold: sold)
        })
        
    }
    
    
}
