//
//  GridData.swift
//  CFN_APP
//
//  Created by Mathias Ooi on 7/5/20.
//  Copyright © 2020 Mathias Ooi. All rights reserved.
//

import Foundation

final class GridData: ObservableObject{
    @Published var length: Int = 5
    @Published var width: Int = 5
    @Published var grid: [[CellView]] = []
    @Published var cells: [[(String, Double)]] = []
    @Published var selectedGrid: (Int, Int) = (0, 0)
    
    init(){
        for _ in (0..<self.length){
            self.grid.append([])
            self.cells.append([])
        }
        for i in (0..<self.length){
            for k in (0..<self.width){
                self.grid[i].append(CellView(i: i, k: k))
                self.cells[i].append(("", 0.0))
            }
        }
    }
    
    func selectGrid(i: Int, k: Int){
        print(i, k)
        self.selectedGrid = (i, k)
    }
}

