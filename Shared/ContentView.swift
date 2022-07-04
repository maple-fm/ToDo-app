//
//  ContentView.swift
//  Shared
//
//  Created by 出口楓真 on 2022/06/09.
//

import SwiftUI

struct ContentView: View {
    @State private var newcreate = false
    var body: some View {
        VStack{
            Text("TODOリスト")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(width: 342, height: 28, alignment: .topLeading)
                .padding(EdgeInsets(
                    top:0,
                    leading: 24,
                    bottom:0,
                    trailing: 24))

            Button(action: {
                self.newcreate.toggle()
            }){
                Image("Floating Button")
                    .frame(width: 20.5, height: 30.5)

            }
            .sheet(isPresented: $newcreate){
                NewCreateView(todo: Todo(name: "", deadline: "", description: ""))
            }
            .padding(EdgeInsets(
                top: UIScreen.main.bounds.size.height-250 ,
                leading: UIScreen.main.bounds.size.width-150,
                bottom:0,
                trailing: 0))
        
            
        }
   
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

