//
//  CarProtocol.swift
//  ios-swinject-example-swiftUI
//
//  Created by Julio Cesar Pereira on 23/07/25.
//

protocol CarProtocol {
    var driver: DriverProtocol { get set }
    var model: String { get }
}
