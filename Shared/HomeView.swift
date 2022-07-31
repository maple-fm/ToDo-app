//
//  HomeView.swift
//  Shared
//
//  Created by 出口楓真 on 2022/06/09.
//

import SwiftUI

struct HomeView: View {
    @State private var newcreate = false

    private var frameWidth: CGFloat {
        UIScreen.main.bounds.width
    }

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea(.all)
            VStack{
                Text("TODOリスト")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(width: frameWidth, height: 0, alignment: .leading)
                    .padding(EdgeInsets(
                        top:0,
                        leading: 60,
                        bottom:0,
                        trailing: 0))

                Button(action: {
                    self.newcreate.toggle()
                }){
                    Image("Floating Button")
                        .frame(width: 20.5, height: 30.5)

                }
                .sheet(isPresented: $newcreate){
                    NewCreateView(input: Todo())
                }
                .padding(EdgeInsets(
                    top: UIScreen.main.bounds.size.height-250 ,
                    leading: UIScreen.main.bounds.size.width-150,
                    bottom:0,
                    trailing: 0))

            }
        }
    }

}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

