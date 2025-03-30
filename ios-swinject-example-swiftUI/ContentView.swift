//
//  ContentView.swift
//  ios-swinject-example-swiftUI
//
//  Created by Julio Cesar Pereira on 29/03/25.
//

import SwiftUI

struct ContentView: View {
    //MARK: Basic examples
    let car = DIContainer.shared.container.resolve(Vehicle.self)!
    let driver = DIContainer.shared.container.resolve(Person.self)!
    let driverCar : Vehicle?
    
    //MARK: Examples with Named Registration
    let coffeeDrink = DIContainer.shared.container.resolve(Drink.self, name: "coffee")!
    let teaDrink = DIContainer.shared.container.resolve(Drink.self, name: "tea")!
    
    //MARK: Registration examples with arguments
    //PS: "If the object has only one argument, use 'argument' instead of 'arguments.'"
    let book = DIContainer.shared.container.resolve(
        Product.self,
        argument: "The pragmatic programmer"
    )!
    
    init(){
        driverCar = (driver as! Driver).vehicle
    }
    
    var body: some View {
        VStack {
            Text("Basic examples:")
                .padding(.bottom)
                .fontWeight(.bold)
                
            Text(car.name)
            Text(driver.name)
            Text(driverCar?.name ?? "")
                .padding(.bottom)
            Text("Named registration examples:")
                .padding(.bottom)
                .fontWeight(.bold)
            
            Text(coffeeDrink.drinkType)
            Text(teaDrink.drinkType)
                .padding(.bottom)
            
            Text("DI registration with args examples:")
                .padding(.bottom)
                .fontWeight(.bold)
            
            Text("Book name: \(book.name) \n\nSold: \(book.sold) "
            )
            
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
