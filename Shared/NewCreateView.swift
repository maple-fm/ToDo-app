//
//  NewCreateView.swift
//  Todo
//
//  Created by 出口楓真 on 2022/06/14.
//

import SwiftUI

struct NewCreateView: View {
    var categories = ["仕事", "遊び", "勉強","その他" ]

    @ObservedObject var viewModel = NewCreateViewModel()
    @State private var close = false
    @State var todo: Todo
    @State private var data = Data()
    private var adjust: CGFloat = 10
    @Environment(\.dismiss) var dismiss



    private var frameWidth: CGFloat {
        UIScreen.main.bounds.width
    }

    private var frameHeight: CGFloat {
        UIScreen.main.bounds.height / 20
    }
    
    init(input: Todo) {
        _todo = State(initialValue: input)
        UITableView.appearance().backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
    }

    var body: some View {

        VStack{
            NavigationView{
                Form{
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
                            ForEach(0..<categories.count, id: \.self) { index in
                                Text(self.categories[index])
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
                .navigationTitle(Text("新規作成"))
                .border(Color.gray, width: 0.5)
                .padding(.top, 10)
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
            
            Section{
                Button(action:{
                    viewModel.clickButton()

                    dismiss()

                }) {
                    Text("作成する")
                        .frame(width: frameWidth, height: 60)

                }
                .frame(width: frameWidth - 100, height: 60)
                .foregroundColor(!viewModel.canCreate ? Color.black : Color.white)
                .background(!viewModel.canCreate ? Color.gray : Color.blue)
                .disabled(!viewModel.canCreate)
                .cornerRadius(15)
                
            }
        }
    }
}

struct NewCreateView_Previews: PreviewProvider {
    static var previews: some View {
        NewCreateView(input: Todo())
            
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
