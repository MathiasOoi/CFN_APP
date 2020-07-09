//
//  SideBarView.swift
//  CFN_APP
//
//  Created by Mathias Ooi on 7/2/20.
//  Copyright © 2020 Mathias Ooi. All rights reserved.
//

import Foundation
import SwiftUI

struct SideBarView: View {
    @EnvironmentObject var data : Data;

    var body: some View {
        VStack(alignment: .leading){
            Spacer().frame(height:100.0)
            HStack(){
                Button(action: {self.data.shownScreen = "menu"}){
                    Text("Home")
                }
            }
            Divider()
            HStack(){
                Button(action: {self.data.shownScreen = "calc"}){
                    Text("Calc")
                }
            }
            Divider()
            HStack(){
                Button(action: {}){
                    Text("___")
                }
            }
            Spacer()
        }.padding().frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(Color(red: 32/255, green: 32/255, blue: 32/255))
        .edgesIgnoringSafeArea(.all)
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
    }
}

