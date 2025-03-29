//
//  Driver.swift
//  ios-swinject-example-uiKit
//
//  Created by Julio Cesar Pereira on 29/03/25.
//

import Foundation

class Driver: Person {
    let name: String
    let vehicle: Vehicle
    
    init(name: String, vehicle: Vehicle) {
        self.name = name
        self.vehicle = vehicle
    }
}
