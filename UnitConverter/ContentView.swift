//
//  ContentView.swift
//  UnitConverter
//
//  Created by Angel on 01/04/25.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber:Double=0.0
    @State private var inputUnit:String="m"
    @State private var outputUnit:String="km"
    let units=["Meters","Kilometers","Feet","Yards","Miles"]
    
    var convert:Double{
        let Base:Double
        let Result:Double
        if(inputUnit=="Meters"){
            Base=inputNumber
        }
        else if(inputUnit=="Kilometers"){
            Base=inputNumber*1000
        }
        else if(inputUnit=="Feet"){
            Base=inputNumber*0.3048
        }
        else if(inputUnit=="Yards"){
            Base=inputNumber*0.9144
        }
        else if(inputUnit=="Miles"){
            Base=inputNumber*1609.344
        }
        else {Base=0.0}
        
        if(outputUnit=="Meters"){
            Result=Base
        }
        else if(outputUnit=="Kilometers"){
            Result=Base/1000
        }
        else if(outputUnit=="Feet"){
            Result=Base/0.3048
        }
        else if(outputUnit=="Yards"){
            Result=Base/0.9144
        }
        else if(outputUnit=="Miles"){
            Result=Base/1609.344
        }
        else {Result=0.0}
        return Result
    }
    var body: some View {
        NavigationStack{
            Form{
                Section("Enter a number"){
                    TextField("Enter a Number",value:$inputNumber,format:.number)
                        .keyboardType(.decimalPad)
                }
                Section("Select the input unit")
                {
                    Picker("Input Unit",selection:$inputUnit){
                        ForEach(units,id:\.self){
                            unit in Text(unit)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section("Select the output unit"){
                    Picker("Output unit",selection:$outputUnit){
                        ForEach(units,id:\.self){
                            unit in Text(unit)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section("Converted Unit is:"){
                    Text("\(convert.formatted())")
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}

#Preview {
    ContentView()
}
