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
    
        container.register(DriverProtocol.self) { _ in Driver() }
            .initCompleted { r, p in
                let driver = p as! Driver
                driver.car = r.resolve(CarProtocol.self)!
        }
        
        container.register(CarProtocol.self) { r in
            Car(driver: r.resolve(DriverProtocol.self)!)
        }
        
        container.register(BoatProtocol.self) { _ in Boat() }
            .initCompleted { r, b in
                let boat = b as! Boat
                boat.captain = r.resolve(CaptainProtocol.self)!
        }
        
        container.register(CaptainProtocol.self) { _ in Captain() }
            .initCompleted { r, c in
                let captain = c as! Captain
                captain.boat = r.resolve(BoatProtocol.self)!
        }
    }
    
}
