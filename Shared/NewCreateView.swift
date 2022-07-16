//
//  NewCreateView.swift
//  Todo
//
//  Created by 出口楓真 on 2022/06/14.
//

import SwiftUI
import UIKit

struct NewCreateView: View {
    var categories = ["仕事", "遊び", "勉強","その他" ]
    @State private var close = false
    @State private var kijitu = ""
    @State private var aCategory = 0
    @State var todo: Todo
    @Environment(\.dismiss) var dismiss
    
    init(input: Todo) {
        _todo = State(initialValue: input)
        UITableView.appearance().backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        
    }
    
    
    

    var body: some View {
        VStack{
            NavigationView{
                Form{
                   
                    Section(header: Text("タスク名")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    ) {
                        TextField("20文字以内で入力してください", text: $todo.name)
                    }
                    .padding(EdgeInsets(
                        top: 0,
                        leading:5,
                        bottom: 10,
                        trailing: 0 ))
                    
                    Section(header: Text("期日")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)) {
                        TextField("年/月/日", text: $kijitu)
                            
                    }
                        .padding(EdgeInsets(
                            top: 5,
                            leading:5,
                            bottom: 10,
                            trailing: 0 ))
                
                    
//                    DatePicker("期日",
//                               selection: $todo.deadline,
//                               displayedComponents: [.date])
//                    //                    .background(Color(red: 0.15, green: 0.33, blue: 0.8, opacity: 0.04))
//                    .padding(EdgeInsets(
//                        top: 33,
//                        leading: 20,
//                        bottom: 30,
//                        trailing: 28))
                    
                    
                    Section(header: Text("カテゴリー")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    ) {
                        Picker("選択してくだいさい", selection: $aCategory) {
                            ForEach(0..<categories.count, id: \.self) { index in
                                Text(self.categories[index])
                            }
                        }
                    }
                    .padding(EdgeInsets(
                        top: 0,
                        leading:5,
                        bottom: 10,
                        trailing: 0 ))
                    
                    Section(header: Text("詳細")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)) {
                        TextField("入力してください", text: $todo.description)
//                            .background(Color(red: 0.15, green: 0.33, blue: 0.8, opacity: 0.04))
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding(EdgeInsets(
                        top: 0,
                        leading:5,
                        bottom: 10,
                        trailing: 0 ))
                    //                            .padding(.top, 0)
//                    TextField("入力してください", text: $todo.description)
//                        .background(Color(red: 0.15, green: 0.33, blue: 0.8, opacity: 0.04))
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .navigationTitle("新規作成")
                .border(Color.gray, width: 0.5)
//                .navigationBarHidden(false)
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
//            .frame(alignment: .leading)
            

            
            Section{
                Button(action:{}){
                    Text("作成する")
                        .frame(width: 310, height: 60)
                }
                .frame(width: 342, height: 60)
                .foregroundColor(todo.name.isEmpty ? Color.black : Color.white)
                .background(todo.name.isEmpty ? Color.gray : Color.blue)
                .disabled(todo.name.isEmpty)

                .cornerRadius(15)
                
            }
            .padding(EdgeInsets(
                top: 0,
                leading: 0,
                bottom: 0,
                trailing: 0))
        }
            

    }
}


        
    



struct NewCreateView_Previews: PreviewProvider {
    static var previews: some View {
        NewCreateView(input: Todo(name: "", deadline: Date.now, description: ""))
            
    }
}
