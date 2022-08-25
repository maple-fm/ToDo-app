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
                Color(UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)).edgesIgnoringSafeArea(.all)
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
                                        .foregroundColor(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)))
                                    Text(viewModel.changeString(deadline: task.deadline))
                                        .foregroundColor(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)))
                                }
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
