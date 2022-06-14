//
//  ContentView.swift
//  Shared
//
//  Created by 出口楓真 on 2022/06/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                ScrollView(.vertical, showsIndicators: false){
                    ForEach(1..<6){ i in
                        Image("TODOList")
                            .padding(.bottom, -30)
                            
                            
                        
                    }
                    
                    .navigationTitle("TODOリスト")
                }
            }
        }

            
       


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
