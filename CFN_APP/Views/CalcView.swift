//
//  CalcView.swift
//  CFN_APP
//
//  Created by Mathias Ooi on 7/2/20.
//  Copyright © 2020 Mathias Ooi. All rights reserved.
//

import Foundation
import SwiftUI

struct CalcView: View {
    @EnvironmentObject var userData : CalcData;
    var body: some View {
        VStack{
            Text(userData.calculatorDisplay[userData.calculatorDisplay.count - 1])
                .font(.title)
                .multilineTextAlignment(.trailing)
            HStack{
                BasicButtons()
                VStack{
                    Text(userData.history[userData.history.count - 1 ].joined())
                        .font(.title)
                }
            }
        }
    }
}

struct History: View {
    @EnvironmentObject var userData : CalcData;
    var body: some View{
        VStack{
            Text(userData.viewHistory()).font(.largeTitle).foregroundColor(Color.black).multilineTextAlignment(.leading)
            Button(action:{self.userData.appendToCalculator(thing: "ReturnFromHistory")}){
                Text("<-").font(.largeTitle).foregroundColor(Color.blue).multilineTextAlignment(.trailing).frame(width: 75.0, height: 75.0)
            }
        }
    }
}


struct BasicButtons: View {
    @EnvironmentObject var userData : CalcData;
    var body: some View {
        VStack{
            HStack{
                Button(action:{self.userData.appendToCalculator(thing: "7")}){
                    Text("7").font(.largeTitle).foregroundColor(Color.black).frame(width: 50.0, height: 50.0)
                }
                Button(action:{self.userData.appendToCalculator(thing: "8")}){
                    Text("8").font(.largeTitle).foregroundColor(Color.black).frame(width: 50.0, height: 50.0)
                }
                Button(action:{self.userData.appendToCalculator(thing: "9")}){
                    Text("9").font(.largeTitle).foregroundColor(Color.black).frame(width: 50.0, height: 50.0)
                }
                Button(action:{self.userData.appendToCalculator(thing: "÷")}){
                    Text("÷").font(.largeTitle).foregroundColor(Color.black).frame(width: 50.0, height: 50.0)
                }
                Button(action:{self.userData.appendToCalculator(thing: "AC")}){
                    Text("AC").font(.headline).foregroundColor(Color.black).frame(width: 50.0, height: 50.0)
                }
            }
            HStack{
                Button(action:{self.userData.appendToCalculator(thing: "4")}){
                    Text("4").font(.largeTitle).foregroundColor(Color.black).frame(width: 50.0, height: 50.0)
                }
                Button(action:{self.userData.appendToCalculator(thing: "5")}){
                    Text("5").font(.largeTitle).foregroundColor(Color.black).frame(width: 50.0, height: 50.0)
                }
                Button(action:{self.userData.appendToCalculator(thing: "6")}){
                    Text("6").font(.largeTitle).foregroundColor(Color.black).frame(width: 50.0, height: 50.0)
                }
                Button(action:{self.userData.appendToCalculator(thing: "×")}){
                    Text("x").font(.largeTitle).foregroundColor(Color.black).frame(width: 50.0, height: 50.0)
                }
                Button(action:{self.userData.appendToCalculator(thing: "DEL")}){
                    Text("DEL").font(.headline).foregroundColor(Color.black).frame(width: 50.0, height: 50.0)
                }
            }
            HStack{
                Button(action:{self.userData.appendToCalculator(thing: "1")}){
                    Text("1").font(.largeTitle).foregroundColor(Color.black).frame(width: 50.0, height: 50.0)
                }
                Button(action:{self.userData.appendToCalculator(thing: "2")}){
                    Text("2").font(.largeTitle).foregroundColor(Color.black).frame(width: 50.0, height: 50.0)
                }
                Button(action:{self.userData.appendToCalculator(thing: "3")}){
                    Text("3").font(.largeTitle).foregroundColor(Color.black).frame(width: 50.0, height: 50.0)
                }
                Button(action:{self.userData.appendToCalculator(thing: "-")}){
                    Text("-").font(.headline).foregroundColor(Color.black).frame(width: 50.0, height: 50.0)
                }
                Button(action:{self.userData.appendToCalculator(thing: "HIS")}){
                    Text("HIS").font(.headline).foregroundColor(Color.black).frame(width: 50.0, height: 50.0)
                }
            }
            HStack{
                Button(action:{self.userData.appendToCalculator(thing: "0")}){
                    Text("0").font(.largeTitle).foregroundColor(Color.black).frame(width: 50.0, height: 50.0)
                }
                Button(action:{self.userData.appendToCalculator(thing: ".")}){
                    Text(".").font(.largeTitle).foregroundColor(Color.black).frame(width: 50.0, height: 50.0)
                }
                Button(action:{self.userData.appendToCalculator(thing: "=")}){
                    Text("=").font(.largeTitle).foregroundColor(Color.black).frame(width: 50.0, height: 50.0)
                }
                Button(action:{self.userData.appendToCalculator(thing: "+")}){
                    Text("+").font(.largeTitle).foregroundColor(Color.black).frame(width: 50.0, height: 50.0)
                }
                Button(action:{self.userData.appendToCalculator(thing: "⏎")}){
                    Text("⏎").font(.largeTitle).foregroundColor(Color.black).frame(width: 50.0, height: 50.0)
                }
            }
        }
    }
}

struct CalcView_Previews: PreviewProvider {
    static var previews: some View {
        CalcView()
    }
}
        
