//
//  ContentView.swift
//  BetterRest
//
//  Created by Omar Alejandro Robles Altamirano on 29/06/20.
//  Copyright © 2020 Omar Alejandro Robles Altamirano. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = Date()
    @State private var sleepAmount = 8.0
    @State private var coffeAmount = 1
    
    var body: some View {

        NavigationView{
            VStack{
                Text("¿A que hora quieres despertar?")
                    .font(.headline)
                DatePicker("Por favor indica el tiempo",
                           selection: $wakeUp,
                           displayedComponents: .hourAndMinute)
                .labelsHidden()
                
                Text("Cantidad deseada de sueño")
                    .font(.headline)
                
                Stepper(value: $sleepAmount, in: 4...12, step: 0.25){
                    Text("\(sleepAmount, specifier: "%g") hours")
                }
                
                Text("Ingesta diaria de café")
                    .font(.headline)
                
                Stepper(value: $coffeAmount, in: 1...20){
                        Text(coffeAmount == 1 ? "1 Taza" : "\(coffeAmount) Tazas")
                }
            }
            .navigationBarTitle("Better Rest")
            .navigationBarItems(trailing:
                Button(action: calculateBedtime){
                    Text("Calcular")
                }
            )
        }
    }
    
    func calculateBedtime(){
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
