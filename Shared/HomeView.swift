//
//  HomeView.swift
//  Shared
//
//  Created by 出口楓真 on 2022/06/09.
//

import SwiftUI

struct HomeView: View {
    @State private var newcreate = false
    @ObservedObject var viewModel = NewCreateViewModel()

    private var frameWidth: CGFloat {
        UIScreen.main.bounds.width
    }

    private var frameHeight: CGFloat {
        UIScreen.main.bounds.height / 20
    }

    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(viewModel.todoList) { task in
                        Text(task.name)
                    }
                }
                .navigationTitle("TODOリスト")

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

