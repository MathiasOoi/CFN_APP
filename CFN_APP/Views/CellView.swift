//
//  CellView.swift
//  CFN_APP
//
//  Created by Mathias Ooi on 7/31/20.
//  Copyright © 2020 Mathias Ooi. All rights reserved.
//

import Foundation
import SwiftUI

struct CellView: View {
    @EnvironmentObject var GridData: GridData;
    let i: Int
    let k: Int
    
    var body: some View {
        Button(action:{self.GridData.selectGrid(i: self.i, k: self.k)}){
            VStack{
                Text(self.GridData.cells[self.i][self.k].0).font(.largeTitle)
            }
        }.frame(width: 75, height: 75).border(Color(red: 114/255.0, green: 206/255.0, blue: 227/255.0), width: 2).background(Color(red: 248/255.0, green: 242/255.0, blue: 132/255.0, opacity: self.GridData.cells[self.i][self.k].1))
    }
}


