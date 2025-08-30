//
//  Buss.swift
//  ios-swinject-example-swiftUI
//
//  Created by Julio Cesar Pereira on 03/08/25.
//

class Buss: BussProtocol {
    var driver: DriverProtocol
    var lineNumber: Int = 147
    
    init(driver: DriverProtocol, lineNumber: Int) {
        self.driver = driver
        self.lineNumber = lineNumber
    }
    
}
