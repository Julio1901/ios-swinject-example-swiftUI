//
//  ContentView.swift
//  ios-swinject-example-swiftUI
//
//  Created by Julio Cesar Pereira on 29/03/25.
//

import SwiftUI

struct ContentView: View {
    
    let car = DIContainer.shared.container.resolve(Vehicle.self)!
    
    var body: some View {
        VStack {
            Text(car.name)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
