//
//  MyProjectCard.swift
//  SwiftUITest03-Todo
//
//  Created by jae hwan choo on 2020/10/19.
//

import SwiftUI

struct MyProjectCard: View {
    
    @State var shouldShowAlert: Bool = false
    
    var body: some View {
    
        VStack(alignment: .leading) {
            Rectangle().frame(height: 0)

            Text("ToDo 할일 프로젝트")
                .font(.system(size: 23))
                .padding(.bottom, -6) // 최소 패딩값 10이 들어간다.
            Text("10 AM ~ 11 PM")
                .foregroundColor(.secondary)
                
            
            HStack {
                Image("1")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle()
                                .stroke(lineWidth: 4)
                                .foregroundColor(.red))
                Image("2")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle()
                                .stroke(lineWidth: 4)
                                .foregroundColor(.blue))
                Image("3")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle()
                                .stroke(lineWidth: 4)
                                .foregroundColor(.green))
                
                Spacer()
                
                // 버튼
                Button(action: {
                    print("확인 버튼이 클릭 되었다.")
                    
                    self.shouldShowAlert = true
                    
                }, label: {
                    Text("확인")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .frame(width: 60)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(20)
                }).alert(isPresented: $shouldShowAlert, content: {
                    Alert(title: Text("알림창 입니다."))
                })
                

            }
            
        }
        .padding(30)
        .background(Color.yellow)
        .cornerRadius(30)
        
    }
}

struct MyProjectCard_Previews: PreviewProvider {
    static var previews: some View {
        MyProjectCard()
    }
}
