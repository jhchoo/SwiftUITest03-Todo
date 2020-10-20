//
//  MyList.swift
//  SwiftUITest03-Todo
//
//  Created by jae hwan choo on 2020/10/20.
//

import SwiftUI

struct MyList: View {
    
    @Binding var isNavHidden: Bool
    
    init(isNavHidden: Binding<Bool> = .constant(false)) {
        if #available(iOS 14.0, *) {
            
        } else {
            UITableView.appearance().tableFooterView = UIView()
        }
        
        UITableView.appearance().separatorStyle = .none
        
        _isNavHidden = isNavHidden
    }
    
    var body: some View {
        
        List {
            Section(header:
                        Text("오늘 할 일")
                        .font(.headline)
                        .foregroundColor(Color.black)
                    ,footer:
                        Text("풋터") ){
                ForEach(1...3, id: \.self) { itemIndex in
                    //Text("마이리스트")
                    MyBasicCard(icon: "book.fill", title: "책읽기 \(itemIndex)", start: "1 PM", end: "3 PM", bgColor: .red)
                }
            }
            .listRowInsets(EdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            
            
            Section(header:
                        Text("내일 할 일")
                        .font(.headline)
                        .foregroundColor(Color.black) ){
                ForEach(1...30, id: \.self) { itemIndex in
                    //Text("마이리스트")
                    MyBasicCard(icon: "book.fill", title: "게임하기 \(itemIndex)", start: "1 PM", end: "3 PM", bgColor: .blue)
                }
            }
            .listRowInsets(EdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            .listRowBackground(Color.yellow)
           
        }
        .listStyle(GroupedListStyle())
        .navigationTitle("내 목록")
        .onAppear{
            self.isNavHidden = false
        }
        
    }
}

struct MyList_Previews: PreviewProvider {
    static var previews: some View {
        MyList()
    }
}
