//
//  ContentView.swift
//  ios-swinject-example-swiftUI
//
//  Created by Julio Cesar Pereira on 29/03/25.
//

import SwiftUI

struct ContentView: View {

    var car = DIContainer.shared.container.resolve(CarProtocol.self)!
    let buss = DIContainer.shared.container.resolve(BussProtocol.self)!
    let boat = DIContainer.shared.container.resolve(BoatProtocol.self)!
    let captain = DIContainer.shared.container.resolve(CaptainProtocol.self)!
   
//    var driverOne = DIContainer.shared.container.resolve(DriverProtocol.self)
//    let driverTwo = DIContainer.shared.container.resolve(DriverProtocol.self)
    
    init(){
//        driverOne?.name = "Julio Cesar"
        car.driver.name = "Nome alterado do motorista do carro"
    }
    
    var body: some View {
        injectionPatternsExamples
    }

    var injectionPatternsExamples: some View {
        VStack {
//            Text(car.model)
//            Text(car.driver.name)
//            Text(boat.captain?.name ?? "")
//            Text(captain.boat?.name ?? "")
//            Text("Driver name: \(driverOne?.name ?? "")")
//            Text("Driver name: \(driverTwo?.name ?? "")")
            
//
            Text("Driver buss name: \(buss.driver.name)")
            Text("Driver car name: \(car.driver.name)")
        }
    }
}

#Preview {
    ContentView()
}
