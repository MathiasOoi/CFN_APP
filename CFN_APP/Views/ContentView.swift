//
//  ContentView.swift
//  CFN_APP
//
//  Created by Mathias Ooi on 6/30/20.
//  Copyright © 2020 Mathias Ooi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var data : Data;
    @State var showMenu: Bool = false;
    
    var body: some View {
            
        let drag = DragGesture().onEnded {
            if ($0.translation.width < -100){
                withAnimation {
                    self.showMenu = false;
                }
            }
        }
        
        
        return NavigationView {
            GeometryReader{ geometry in
                ZStack(alignment: .leading) {
                    if(self.data.shownScreen == "menu"){
                        HomeView(showMenu: self.$showMenu).frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                    }else if(self.data.shownScreen == "calc"){
                        CalcView().frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                    }
                    else if(self.data.shownScreen == "grid"){
                        GridView().frame(width: geometry.size.width, height: geometry.size.height)
                            .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                    }
                    
                        
                
                    SideBarView()
                        .frame(width: geometry.size.width/4, height: geometry.size.height)
                        .offset(x: self.showMenu ? 0 : -geometry.size.width/4)
                }.gesture(drag)
            }.navigationBarTitle("CFN TEST APP", displayMode: .inline)
            .navigationBarItems(leading: (
                Button(action: {
                    withAnimation {
                        self.showMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                }
            ))
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
