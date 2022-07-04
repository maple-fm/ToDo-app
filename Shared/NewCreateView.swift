//
//  NewCreateView.swift
//  Todo
//
//  Created by 出口楓真 on 2022/06/14.
//

import SwiftUI

struct NewCreateView: View {
    @State private var close = false
    @State private var aTask = ""
    @State private var Date = ""
    @State private var aCategory = UIColor.red
    @State private var description = ""
    @Environment(\.dismiss) var dismiss
    


    var body: some View {
        VStack{
            HStack(spacing: 97.51){
                Text("新規作成")
                    .font(.title2)
                    .fontWeight(.bold)

                Button("×"){
                    
                    dismiss()

                }
                .foregroundColor(Color.blue)
                .font(.largeTitle)
                
                
            }
            .frame(alignment: .top)
            .padding(EdgeInsets(
                top: 880-UIScreen.main.bounds.size.height,
                leading:500-UIScreen.main.bounds.size.width,
                bottom:0,
                trailing: 0))
            Divider()
       
            Group{
            
                Text("タスク名")
                    .padding(.top, 33)
                TextField("20文字以内で入力してください", text: $aTask)
                    .frame(width: 326, height: 60)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    

                Text("期日")
                    .padding(.top, 33)
                TextField("年/月/日", text: $Date)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("カテゴリー")
                    .padding(.top, 33)
            
                NavigationView{
                    Form{
                        Picker("選択してください", selection: $aCategory){
                            Text("仕事").tag(UIColor.red)
                            Text("勉強").tag(UIColor.blue)
                            Text("遊び").tag(UIColor.yellow)
                            Text("その他").tag(UIColor.gray)
                        }
                    }
                }
                
                
                
                Text("期日")
                    .padding(.top, 33)
                TextField("詳細", text: $description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 155)
                
                
            }
            .frame(width: 326, alignment: .leading)
//            .padding(EdgeInsets(
//                top:0,
//                leading: 0,
//                bottom:33,
//                trailing: 0
//            ))
            
            Button(action:{}){
                Text("作成する")
                    .frame(width: 310, height: 60)
            }
            .foregroundColor(Color.black)
            .frame(width: 342, height: 60)
            .background(Color.gray)
            .cornerRadius(15)
            
            
          
            
            
        }
        
    }
}

struct NewCreateView_Previews: PreviewProvider {
    static var previews: some View {
        NewCreateView()
    }
}
