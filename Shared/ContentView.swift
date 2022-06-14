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
                ZStack(){
                    ScrollView(.vertical, showsIndicators: false){

                        ForEach(1..<50){ i in
                            Image("TODOList")
                                .padding(.bottom, -30)
                         
                        }
               
                    }

                    ScrollView([]){
                        Image("Floating Button")
                            .padding(.trailing)
                            .frame(alignment: .bottomTrailing)
                            
                    }
                    
                    
                }
  
            }
            .navigationTitle("TODOリスト")
            
            
        }

            
       
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
