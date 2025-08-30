//
//  BussProtocol.swift
//  ios-swinject-example-swiftUI
//
//  Created by Julio Cesar Pereira on 03/08/25.
//

protocol BussProtocol {
    var driver: DriverProtocol { get set }
    var lineNumber: Int { get }
}
