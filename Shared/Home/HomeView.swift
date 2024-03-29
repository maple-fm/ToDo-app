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
    let today = Date()

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
                                Button(action: {
                                    viewModel.clickCheckButton(task: task)
                                }) {
                                    if task.done {
                                        Image(systemName: "checkmark.circle.fill")
                                            .resizable()
                                            .symbolRenderingMode(.palette)
                                            .foregroundStyle(.white, Color(UIColor(red: 0.149, green: 0.33, blue: 0.796, alpha: 1)))
                                    } else {
                                        Image(systemName: "circle.fill")
                                            .resizable()
                                            .foregroundColor(
                                                Color(UIColor(red: 0.149, green: 0.33, blue: 0.796, alpha: 0.16))
                                            )
                                    }
                                }
                                .frame(width: 24, height: 24)
                                .padding(.leading, 16)

                                VStack(alignment: .leading) {
                                    Text(task.name)
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .bold()
                                    Text(task.memo)
                                        .frame(width: 286, alignment: .leading)
                                        .lineLimit(1)
                                    HStack {
                                        if task.deadline.compare(today) == .orderedDescending {
                                            if viewModel.comparisonDate(deadline: task.deadline) == "0" {
                                                Text("今日まで")
                                                    .padding(4)
                                                    .foregroundColor(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 1)))
                                                    .background(Color(UIColor(red: 0.149, green: 0.33, blue: 0.796, alpha: 0.3)))
                                                    .cornerRadius(4)

                                            } else if viewModel.comparisonDate(deadline: task.deadline) == "1" {
                                                Text("1日前")
                                                    .padding(4)
                                                    .foregroundColor(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 1)))
                                                    .background(Color(UIColor(red: 0.975, green: 0.41, blue: 0.512, alpha: 1)))
                                                    .cornerRadius(4)
                                            }
                                        } else {
                                            Text("期限が過ぎています")
                                                .padding(4)
                                                .foregroundColor(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 1)))
                                                .background(.red)
                                                .cornerRadius(4)
                                        }
                                        Text(viewModel.changeString(deadline: task.deadline))

                                    }

                                }
                                .foregroundColor(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)))
                                .padding(.leading, 16)
                                Spacer()
                            }
                            .frame(width: 358, height: 111, alignment: .center)
                            .background(Color(colorChange(category: task.category.rawValue)))
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
            .background(Color(UIColor(red: 0.951, green: 0.956, blue: 0.97, alpha: 1)))
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

func colorChange(category: String) -> UIColor {
    var color:UIColor
    if category == "仕事" {
        color = UIColor(red: 0.307, green: 0.783, blue: 0.555, alpha: 1)
    } else if category == "勉強" {
        color = UIColor(red: 0.459, green: 0.681, blue: 0.842, alpha: 1)
    } else if category == "遊び" {
        color = UIColor(red: 0.635, green: 0.629, blue: 0.921, alpha: 1)
    } else{
        return UIColor(red: 0.31, green: 0.452, blue: 0.817, alpha: 1)
    }

    return color
}
