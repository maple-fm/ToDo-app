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
        NavigationView{
            VStack{
                ZStack(){
                    ScrollView(.vertical, showsIndicators: false){

                        ForEach(1..<50){ i in
                            Image("TODOList")
                                .padding(.bottom, -30)
                         
                        }
               
                    }

                    Button(action: {
                        self.newcreate.toggle()
                    }){
                        Image("Floating Button")
                            .padding(EdgeInsets(
                            top: 550, leading: 270, bottom: 0, trailing: 0))
                    }
                    .sheet(isPresented: $newcreate){
                        NewCreateView()
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
