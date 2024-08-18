//
//  ContentView.swift
//  USCurrencyConverterApp
//
//  Created by Charlie Kisylia on 8/15/24.
//

import SwiftUI

struct ContentView: View {
    @State var total = ""
    @State var  currentCountry = "USD"
    let countriesDict = ["USD": 1, "Euro": 0.91, "Sol(Peru)": 3.73, "Colombian Peso": 3999.12, "Pound Strerling": 0.77, "Russian Ruble": 89.38, "Indian Rupee": 83.88]
    
    var convertedAmount: Double {
        let amountInUSD = Double(total) ?? 0
        let conversionRate = countriesDict[currentCountry] ?? 1.0
        return amountInUSD * conversionRate
    }
    
    var body: some View {
        ZStack {  // Use ZStack to layer the background and content
            Color.green.opacity(0.3) // Set the entire screen background to light green
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                HStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("US Currency Converter").font(.headline)
                }
                
                HStack {
                    Text("$").bold()
                    TextField("Type in an amount", text: $total).keyboardType(.decimalPad)
                }.padding()
                
                Picker("Select Currency", selection: $currentCountry) {
                    ForEach(countriesDict.keys.sorted(), id: \.self) { country in
                        Text(country).tag(country)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                
                if Double(total) != nil {
                    Text("Converted Amount: \(String(format: "%.2f", convertedAmount)) \(currentCountry)")
                        .padding()
                } else {
                    Text("Please enter a valid amount.")
                        .foregroundColor(.red)
                        .padding()
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
