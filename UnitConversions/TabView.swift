//
//  TabView.swift
//  UnitConversions
//
//  Created by Henrieke Baunack on 10/12/23.
//

import SwiftUI

struct UnitConversionView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Temperature", systemImage: "thermometer.sun")
                }
            LengthConversion()
                .tabItem {
                    Label("Lenght", systemImage: "ruler.fill")
                }
        }
    }
}

#Preview {
    UnitConversionView()
}
