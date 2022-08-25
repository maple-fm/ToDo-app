//
//  HomeView.swift
//  Shared
//
//  Created by 出口楓真 on 2022/06/09.
//

import SwiftUI


struct HomeView: View {
    @State private var newcreate = false
    @State var isChecked = false
    @ObservedObject var viewModel = HomeViewModel()

    

    private var frameWidth: CGFloat {
        UIScreen.main.bounds.width
    }

    private var frameHeight: CGFloat {
        UIScreen.main.bounds.height / 20
    }

    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.tasks, id:\.self) { task in
                            HStack(alignment: .center) {
                                Spacer()
                                Button(action: {
                                    viewModel.clickCheckButton(task: task)
                                    // ここが無理矢理感がある
                                    viewModel.dismissActionSheet()
                                }) {
                                    Image(systemName: task.done ? "checkmark.circle" : "circle")
                                        .foregroundColor(.black)
                                }

                                Spacer()
                                VStack(alignment: .leading) {
                                    Text(task.name)
                                        .font(.title)
                                        .bold()
                                    Text(viewModel.changeString(deadline: task.deadline))
                                    Text(task.category.rawValue).tag(task.category)
                                    Text(task.memo)

                                }
                                .padding(.trailing, 180)

                            }
                            .frame(width: 358, height: 111, alignment: .center)
                            .background(colorChange(category: task.category.rawValue))
                            .cornerRadius(16)
                        }
                        .padding(.top, 24)
                    }
                }
                .navigationTitle("TODOリスト")

                Button(action: {
                    self.newcreate.toggle()
                }){
                    Image("Floating Button")
                        .frame(width: 20.5, height: 30.5)

                }
                .sheet(isPresented: $newcreate, onDismiss: viewModel.dismissActionSheet){
                    NewCreateView()
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

func colorChange(category: String) -> Color {
    if category == "仕事" {
        return Color.blue
    } else if category == "勉強" {
        return Color.green
    } else if category == "遊び" {
        return Color.red
    } else if category == "その他" {
        return Color.gray
    }
    return Color.clear
}
