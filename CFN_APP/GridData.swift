//
//  GridData.swift
//  CFN_APP
//
//  Created by Mathias Ooi on 7/5/20.
//  Copyright © 2020 Mathias Ooi. All rights reserved.
//

import Foundation

final class GridData: ObservableObject{
    @Published var grid: [[String]] = Array(repeating: Array(repeating: "", count: 5), count: 5)

}
