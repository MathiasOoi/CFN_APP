//
//  GridView.swift
//  CFN_APP
//
//  Created by Mathias Ooi on 7/9/20.
//  Copyright © 2020 Mathias Ooi. All rights reserved.
//

import Foundation
import SwiftUI

struct GridView: View {
    @EnvironmentObject var GridData: GridData;

    
    
    var body: some View {
        VStack{
            ForEach(0..<5){ i in
                HStack{
                    ForEach(0..<5){ k in
                        Button(action:{}){
                            self.GridData.grid[i][k]
                        }.lineSpacing(0)
                    }
                }.lineSpacing(0)
            }
        }.lineSpacing(0)
    }
}


struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
