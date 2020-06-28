//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Omar Alejandro Robles Altamirano on 28/06/20.
//  Copyright © 2020 Omar Alejandro Robles Altamirano. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Alemania", "Brasil", "Canada", "España", "Francia", "Inglaterra", "Italia", "Japon", "Mexico", "Rusia", "Uk", "Usa"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...4)
    
    @State private var showingScored = false
    @State private var scoredTitle = ""
    
    var body: some View {
        
        ZStack{
            
            LinearGradient(
                gradient: Gradient(
                    colors: [Color.black, Color.blue]
                        ),
                startPoint: .bottom,
                endPoint: .top
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                VStack{
                    Text("Presiona la bandera de")
                        .foregroundColor(Color.white)
                        .font(.title)
                    Text(countries[correctAnswer])
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                
                ForEach(0..<5){ number in
                    Button(action: {
                        self.flagTapped(number)
                        
                    }){
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 100)
                            .clipped()
                            .shadow(color: Color.white, radius: 9, x: 0, y: 0)
                            .padding(.all, 5)
                    }
                }
                Spacer()
            }
        }
        .alert(isPresented: $showingScored) {
            Alert(title: Text(scoredTitle).foregroundColor(.red), message: Text("Your score is ???"), dismissButton: .default(Text("Continue")){
                    self.askQuestion()
                })
        }
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer{
            scoredTitle = "Correcto"
        }
        else{
            scoredTitle = "Incorrecto"
        }
        showingScored = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...4)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
