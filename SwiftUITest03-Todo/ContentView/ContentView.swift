//
//  ContentView.swift
//  SwiftUITest03-Todo
//
//  Created by jae hwan choo on 2020/10/19.
//

import SwiftUI

struct ContentView: View {
    
    @State var isNavHidden = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack(alignment: .bottomTrailing) {
                VStack(alignment: .leading) {
                    
                    HStack {
                        NavigationLink(
                            destination: MyList(isNavHidden: self.$isNavHidden),
                            label: {
                                Image(systemName: "line.horizontal.3")
                                    .font(.largeTitle)
                                    .foregroundColor(.black)
                            })
                        
                        Spacer()
                            NavigationLink(
                                destination: MyProfileView(isNavHidden: self.$isNavHidden),
                                label: {
                                    Image(systemName: "person.circle.fill")
                                        .font(.largeTitle)
                                        .foregroundColor(.black)
                                })
                        
                    }.padding(.horizontal, 20)
                    
                    Text("한타 할 일 목록")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .padding(.top, 20)
                        .padding(.horizontal, 20)
                        
                    ScrollView {
                        VStack {
                            MyProjectCard()
                            MyBasicCard(icon: "tray.fill", title: "책상정리", start: "1 PM", end: "3 PM", bgColor: .blue)
                            MyBasicCard(icon: "tv.fill", title: "영화시청", start: "1 PM", end: "3 PM", bgColor: .red)
                            MyBasicCard(icon: "cart.fill", title: "장보기", start: "1 PM", end: "3 PM", bgColor: .purple
                            )
                            MyBasicCard(icon: "gamecontroller.fill", title: "게임하기", start: "1 PM", end: "3 PM", bgColor: .orange)
                        }
                        .padding()
                    }
                }
                
                Circle()
                    .foregroundColor(.red)
                    .frame(width: 60, height: 60, alignment: .center)
                    .overlay(
                        Image(systemName: "plus")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    )
                    .padding(.trailing, 10)
                    .shadow(radius: 20)
            }// ZStack
            .navigationTitle("뒤로가기")
            .navigationBarHidden(self.isNavHidden)
            .onAppear{
                self.isNavHidden = true
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
