//
//  MyProfileView.swift
//  SwiftUITest03-Todo
//
//  Created by jae hwan choo on 2020/10/20.
//

import SwiftUI

struct MyProfileView: View {
    
    @Binding var isNavHidden: Bool
    
    init(isNavHidden: Binding<Bool> = .constant(false)) {
        _isNavHidden = isNavHidden
    }
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                Image("MyImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300, alignment: .center)
                    .clipShape(Circle())
                    .shadow(color: .gray, radius: 20, x: 0.0, y: 10.0)
                    .overlay(Circle().foregroundColor(.black).opacity(0.4))
                    .overlay(Circle().stroke(Color.blue, lineWidth: 10))
                    .overlay(Circle().stroke(Color.yellow, lineWidth: 10).padding())
                    .overlay(Circle().stroke(Color.red, lineWidth: 10).padding(.all, 34))
                    .overlay(
                        Text("사용자")
                            .font(.system(size: 50))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                    )
                
                HStack {
                        NavigationLink(
                            destination: MyWebview(urlToLoad: "https://www.naver.com")
                                .navigationBarTitle("네이버", displayMode: .inline)
                                .edgesIgnoringSafeArea(.all),
                            label: {
                                Text("네이버")
                                    .fontWeight(.bold)
                                    .font(.system(size: 20))
                                    .padding(20)
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                            })
                        NavigationLink(
                            destination: MyWebview(urlToLoad: "https://www.daum.net")
                                .navigationBarTitle("다음", displayMode: .inline)
                                .edgesIgnoringSafeArea(.all),
                            label: {
                                Text("다음")
                                    .fontWeight(.bold)
                                    .font(.system(size: 20))
                                    .padding(20)
                                    .background(Color.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                            })
                }
                .padding(.top, 20)
            }
            .navigationTitle("내 프로필")
            .navigationBarItems(trailing:
                NavigationLink(
                    destination: Text("넘어온 화면 입니다."),
                    label: {
                        Image(systemName: "gear")
                            .font(.system(size: 25))
                    })
            )
            .onAppear{
                self.isNavHidden = false
            }
        
        }
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}
