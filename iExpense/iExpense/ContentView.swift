//
//  ContentView.swift
//  iExpense
//
//  Created by Omar Alejandro Robles Altamirano on 04/07/20.
//  Copyright © 2020 Omar Alejandro Robles Altamirano. All rights reserved.
//

import SwiftUI

struct ExpenseItem: Identifiable{
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject{
    @Published var items = [ExpenseItem]()
}

struct ContentView: View {
    
    @ObservedObject var expenses = Expenses()
    
    var body: some View {
        NavigationView{
            
            List{
                ForEach(expenses.items){ item in
                    Text(item.name)
                }
            .onDelete(perform: removeItems)
            }
            .navigationBarTitle("iExpese")
        .navigationBarItems(trailing:
            Button(action: {
                let expense = ExpenseItem(name: "Text", type: "Personal", amount: 5)
                self.expenses.items.append(expense)
            }){
                Image(systemName: "plus")
            }
        )
        }
    }
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
