//
//  ContentView.swift
//  ios-swinject-example-swiftUI
//
//  Created by Julio Cesar Pereira on 29/03/25.
//

import SwiftUI

struct ContentView: View {

    let car = DIContainer.shared.container.resolve(CarProtocol.self)!
    let boat = DIContainer.shared.container.resolve(BoatProtocol.self)!
    let captain = DIContainer.shared.container.resolve(CaptainProtocol.self)!
    
    init(){
    }
    
    var body: some View {
        injectionPatternsExamples
    }

    var injectionPatternsExamples: some View {
        VStack {
            Text(car.model)
            Text(car.driver.name)
            Text(boat.captain?.name ?? "")
            Text(captain.boat?.name ?? "")
        }
    }
}

#Preview {
    ContentView()
}
