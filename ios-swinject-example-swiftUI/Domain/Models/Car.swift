//
//  Car.swift
//  ios-swinject-example-uiKit
//
//  Created by Julio Cesar Pereira on 29/03/25.
//

import Foundation

class Car: CarProtocol {
    var driver: DriverProtocol
    var model: String = "Civic"
    
    init(driver: DriverProtocol) {
        self.driver = driver
    }
}
