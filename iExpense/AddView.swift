//
//  AddView.swift
//  iExpense
//
//  Created by Omar Alejandro Robles Altamirano on 04/07/20.
//  Copyright © 2020 Omar Alejandro Robles Altamirano. All rights reserved.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    static let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Name", text: $name)
                Picker("Type", selection: $type){
                    ForEach(Self.types, id: \.self){
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
        .navigationBarTitle("Add new expense")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
