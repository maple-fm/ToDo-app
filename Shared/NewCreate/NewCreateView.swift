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
        NavigationView{
            VStack{
                Form{
//                    Color(UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)).edgesIgnoringSafeArea(.all)
                    Section(header: Text("タスク名")
                        .NewItem()
                    ) {
                        TextField("20文字以内で入力してください", text: $viewModel.name)
                    }
                    .frame(width: frameWidth, height: frameHeight-adjust, alignment: .leading)
                    
                    Section(header: Text("期日")
                        .NewItem()
                    ) {
                        DatePicker(
                        "年/月/日",
                        selection: $viewModel.deadline,
                        displayedComponents: [.date]
                        )
                        .frame(width: frameWidth-adjust*8)
                    }
                    .frame(width: frameWidth, height: adjust, alignment: .leading)

                    Section(header: Text("カテゴリー")
                        .NewItem()
                        .frame(width: frameWidth, height: frameHeight-adjust, alignment: .leading)

                    ) {
                        Picker("選択してください", selection: $viewModel.category) {
                            ForEach(Category.allCases, id: \.self) { (index) in
                                Text(index.rawValue).tag(index)
                            }
                        }
                    }

                    Section(header: Text("詳細")
                        .NewItem()
                    ) {
                        TextField("入力してください", text: $viewModel.description)
                    }
                    .frame(width: frameWidth, height: frameHeight-adjust, alignment: .leading)
                }

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
            //            .border(Color.gray, width: 0.5)
//                        .padding(.top, 10)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(
                        trailing:
                            Button("×"){
                                dismiss()
                            }
                            .foregroundColor(Color.blue)
                            .font(.largeTitle)
                    )
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
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(Color.black)
            .padding(.leading, 25)

    }
}
