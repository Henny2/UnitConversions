//
//  ContentView.swift
//  UnitConversions
//
//  Created by Henrieke Baunack on 10/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var temp = 0.0
    @State private var inputUnit = "°C"
    @State private var conversionUnit = "°F"
    let tempUnits = ["K", "°C", "°F"]
    var convertedTemp: Double {
        if inputUnit == conversionUnit {
            return temp
        }
        else if inputUnit == "°C" && conversionUnit == "°F"{
            return (temp * 1.8) + 32
        }
        else if inputUnit == "°F" && conversionUnit == "°C"{
            return (temp-32)*5/9
        }
        else if inputUnit == "K" && conversionUnit == "°F"{
            return (temp - 273.15) * 9/5 + 32
        }
        else if inputUnit == "°F" && conversionUnit == "K"{
            return ((temp - 32)*5/9)+273.15
        }
        else if inputUnit == "°C" && conversionUnit == "K"{
            return temp + 273.15
        }
        else if inputUnit == "K" && conversionUnit == "°C"{
            return temp - 273.15
        }
        else{
            return 0.0
        }
    }
    
    var body: some View {
        NavigationStack{
            Form {
                Section("Put in a temperature"){
                    HStack{
                        TextField("Temperature", value: $temp, format: .number).keyboardType(.decimalPad)
                        Spacer(minLength: 0)
                        Picker("inputUnitPicker", selection: $inputUnit) {
                            ForEach(tempUnits, id: \.self){
                                Text($0)
                            }
                        }.pickerStyle(.segmented).frame(width: 150)
                    }
                    
                }
                Section("Your converted temperature"){
                    HStack{
                        Text(convertedTemp, format: .number  )
                        Spacer(minLength: 0)
                        Picker("inputUnitPicker", selection: $conversionUnit) {
                            ForEach(tempUnits, id: \.self){
                                Text($0)
                            }
                        }.pickerStyle(.segmented).frame(width: 150)
                    }
                }
            }.navigationTitle("Unit Conversion")
        }
    }
}

#Preview {
    ContentView()
}
