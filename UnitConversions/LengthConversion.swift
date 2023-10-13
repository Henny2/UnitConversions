//
//  LengthConversion.swift
//  UnitConversions
//
//  Created by Henrieke Baunack on 10/12/23.
//

import SwiftUI

struct LengthConversion: View {
    @State private var length = 0.0
    @State private var inputUnit = "ft"
    @State private var conversionUnit = "m"
    let lengthUnits = ["mm", "m", "km", "in", "ft"]
    var convertedLength: Double {
        if inputUnit == conversionUnit {
            return length
        }
        else if inputUnit == "m" && conversionUnit == "mm"{
            return length * 1000
        }
        else if inputUnit == "m" && conversionUnit == "km"{
            return length / 1000
        }
        else if inputUnit == "m" && conversionUnit == "in"{
            return length * 39.37
        }
        else if inputUnit == "m" && conversionUnit == "ft"{
            return length * 3.281
        }
        else if inputUnit == "mm" && conversionUnit == "m"{
            return length / 1000
        }
        else if inputUnit == "mm" && conversionUnit == "km"{
            return length * 1000000
        }
        else if inputUnit == "mm" && conversionUnit == "ft"{
            return length / 304.8
        }
        else if inputUnit == "mm" && conversionUnit == "in"{
            return length / 25.4
        }
        else if inputUnit == "km" && conversionUnit == "m"{
            return length * 1000
        }
        else if inputUnit == "km" && conversionUnit == "mm"{
            return length * 1000000
        }
        else if inputUnit == "km" && conversionUnit == "ft"{
            return length * 3280.84
        }
        else if inputUnit == "km" && conversionUnit == "in"{
            return length * 39370
        }
        else if inputUnit == "ft" && conversionUnit == "mm"{
            return length * 304.8
        }
        else if inputUnit == "ft" && conversionUnit == "m"{
            return length / 3.281
        }
        else if inputUnit == "ft" && conversionUnit == "km"{
            return length / 3281
        }
        else if inputUnit == "ft" && conversionUnit == "in"{
            return length * 12
        }
        else if inputUnit == "in" && conversionUnit == "mm"{
            return length * 25.4
        }
        else if inputUnit == "in" && conversionUnit == "m"{
            return length / 39.37
        }
        else if inputUnit == "in" && conversionUnit == "km"{
            return length / 39370
        }
        else if inputUnit == "in" && conversionUnit == "ft"{
            return length / 12
        }
        else{
            return 0.0
        }
    }
    
    var body: some View {
        NavigationStack{
            Form {
                Section("Put in a length"){
                    HStack{
                        TextField("Length", value: $length, format: .number).keyboardType(.decimalPad)
                        Spacer(minLength: 5)
                        Picker("Pick a unit", selection: $inputUnit) {
                            ForEach(lengthUnits, id: \.self){
                                Text($0)
                            }
                        }.frame(width: 150)
                    }
                    
                }
                Section("Your converted length"){
                    HStack{
                        Text(convertedLength, format: .number  )
                        Spacer(minLength: 5)
                        Picker("Pick a unit", selection: $conversionUnit) {
                            ForEach(lengthUnits, id: \.self){
                                Text($0)
                            }
                        }.frame(width: 150)
                    }
                }
            }.navigationTitle("Unit Conversion")
        }
    }
}

#Preview {
    LengthConversion()
}
