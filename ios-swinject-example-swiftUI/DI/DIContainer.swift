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
        container.register(
            Vehicle.self,
            factory: { _ in Car(name: "Honda Civic")}
        )
        container.register(Person.self, factory: { r in
            Driver(name: "Julio Cesar", vehicle: r.resolve(Vehicle.self)!)
        })
    }
    
    
}
