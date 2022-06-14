//
//  NewCreateView.swift
//  Todo
//
//  Created by 出口楓真 on 2022/06/14.
//

import SwiftUI

struct NewCreateView: View {
    @State private var create = false
    var body: some View {
        NavigationView{
            VStack{
                Image("Normal")
                Button(action:{
                    self.create.toggle()
                }){
                    Image("Button")
                }
                
            }
            .navigationTitle("新規作成")
                        
            
    
            
        }
        .frame(alignment: .leading)

        
    }
}

struct NewCreateView_Previews: PreviewProvider {
    static var previews: some View {
        NewCreateView()
    }
}
