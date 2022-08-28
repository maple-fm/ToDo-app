//
//  NewCreateView.swift
//  Todo
//
//  Created by 出口楓真 on 2022/06/14.
//

import SwiftUI

struct NewCreateView: View {
    let coloredNavAppearance = UINavigationBarAppearance()
    @ObservedObject var viewModel = NewCreateViewModel()
    @State private var close = false
    @Environment(\.dismiss) var dismiss
    private var adjust: CGFloat = 10

    private var frameWidth: CGFloat {
        UIScreen.main.bounds.width
    }

    private var frameHeight: CGFloat {
        UIScreen.main.bounds.height / 20
    }

    var body: some View {
        NavigationView {
            VStack{
                Form{
                    Section(header: Text("タスク名")
                        .NewItem()
                    ) {
                        ZStack(alignment: .leading) {
                            if viewModel.name.isEmpty {
                                Text("20文字以内で入力してください")
                                    .foregroundColor(Color(UIColor(red: 0.161, green: 0.176, blue: 0.212, alpha: 0.3)))
                            }
                            TextField("", text: $viewModel.name)
                        }

                    }
                    .listRowBackground(Color(UIColor(red: 0.149, green: 0.33, blue: 0.796, alpha: 0.04)))
                    .frame(width: frameWidth, height: frameHeight+adjust, alignment: .leading)
                    .listRowInsets(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 0))

                    Section(header: Text("期日")
                        .NewItem()
                    ) {
                        DatePicker(
                        "年/月/日",
                        selection: $viewModel.deadline,
                        displayedComponents: [.date]
                        )
                        .foregroundColor(Color(UIColor(red: 0.161, green: 0.176, blue: 0.212, alpha: 0.3)))
                        .frame(width: frameWidth-adjust*8)
                    }
                    .listRowBackground(Color(UIColor(red: 0.149, green: 0.33, blue: 0.796, alpha: 0.04)))
                    .frame(width: frameWidth, height: adjust*5, alignment: .leading)
                    .listRowInsets(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 0))

                    Section(header: Text("カテゴリー")
                        .NewItem()
//                        .padding(.leading, -25)
                    ) {
                        Picker("選択してください", selection: $viewModel.category) {
                            ForEach(Category.allCases, id: \.self) { (index) in
                                Text(index.rawValue).tag(index)
                                    .foregroundColor(Color(UIColor(red: 0.161, green: 0.176, blue: 0.213, alpha: 1)))
                            }
                        }
                    }
                    .foregroundColor(Color(UIColor(red: 0.161, green: 0.176, blue: 0.212, alpha: 0.3)))
                    .listRowBackground(Color(UIColor(red: 0.149, green: 0.33, blue: 0.796, alpha: 0.04)))
                    .listRowInsets(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 0))
                    .frame(width: frameWidth-adjust*7, height: adjust*5, alignment: .center)


                    Section(header: Text("詳細")
                        .NewItem()
                    ) {
                        ZStack(alignment: .leading) {
                            if viewModel.description.isEmpty {
                                Text("入力してください")
                                    .foregroundColor(Color(UIColor(red: 0.161, green: 0.176, blue: 0.212, alpha: 0.3)))
                            }
                            TextField("", text: $viewModel.description)
                        }
                    }
                    .listRowBackground(Color(UIColor(red: 0.149, green: 0.33, blue: 0.796, alpha: 0.04)))
                    .listRowInsets(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 0))
                    .frame(width: frameWidth, height: frameHeight+adjust, alignment: .leading)
                }
                .padding(.top, 0)

                Button(action:{
                    viewModel.clickButton()
                    dismiss()

                }) {
                    Text("作成する")
                        .bold()
                        .frame(width: frameWidth, height: 60)

                }
                .frame(width: frameWidth - 100, height: 60)
                .foregroundColor(!viewModel.canCreate ?
                                 Color(UIColor(red: 0.161, green: 0.176, blue: 0.212, alpha: 0.3)) :
                                 Color(UIColor(red: 1, green: 1, blue: 1, alpha: 1)))
                .background(!viewModel.canCreate ?
                            Color(UIColor(red: 0.161, green: 0.176, blue: 0.212, alpha: 0.08)) :
                            Color(UIColor(red: 0.149, green: 0.33, blue: 0.796, alpha: 1)))
                .disabled(!viewModel.canCreate)
                .cornerRadius(15)
            }
            .navigationTitle(Text("新規作成"))
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(
                        trailing:
                            Button("×"){
                                dismiss()
                            }
                            .foregroundColor(Color.blue)
                            .font(.largeTitle)
                    )
            .background(Color(UIColor(red: 0.951, green: 0.956, blue: 0.97, alpha: 1)))
        }

    }
}

struct NewCreateView_Previews: PreviewProvider {
    static var previews: some View {
        NewCreateView()
            
    }
}

extension Text {
    func NewItem() -> some View {
        self
            .frame(width: 342, height: 60, alignment: .leading)
            .font(.system(size:17, weight: .bold))
            .foregroundColor(Color(UIColor(red: 0.161, green: 0.176, blue: 0.212, alpha: 0.5)))
            .padding(EdgeInsets(
                top: 33,
                leading: 28,
                bottom:12,
                trailing: 0))
    }
}
