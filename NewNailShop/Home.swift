//
//  Home.swift
//  nailshop
//
//  Created by AD2201016P02 on 12/9/24.
//

import SwiftUI

struct Home: View {
    @State var isNavigationBarHidden : Bool = false
    var body: some View {
        GeometryReader{ geometry in
            NavigationView {
                ZStack(alignment:  .bottom){
                    
                    VStack(alignment: .leading, spacing:0){
                        
                        HStack{
                            
                            Text("링링네일")
                                .font(.system(size:30))
                                .fontWeight(.black)
                            
                            
                            //NavigationLink(destination: MyList(isNavigationBarHidden: self.$isNavigationBarHidden)){
                            //                            Image(systemName: "line.horizontal.3")
                            //                                .font(.largeTitle)
                            //                                .foregroundColor(Color.black)
                            // }
                            
                            Spacer()
                            
                         //   NavigationLink(destination: MakeNail()){
                                Image(systemName: "pencil.tip.crop.circle.badge.arrow.forward")
                                    .font(.largeTitle)
                          //  }
                            
                            Image(systemName: "magnifyingglass.circle.fill")
                                .font(.largeTitle)
                        }.padding(20)
                        
                        
                        
                        ScrollView {
                            VStack(alignment: .leading){
                                MyProjectCard()
                                MyBasicCard()
                                
                                Text("링링네일 신규 회원샵")
                                    .font(.system(size:25))
                                    .fontWeight(.black)
                                    .padding(.top, 20)
                                    .padding(.bottom, 10)
                                
                                MyCard(icon: "tray.fill", title: "청담동점", start: "10 AM" , end: "20 PM", bgColor: Color.blue)
                                MyCard(icon: "tray.fill", title: "압구정점", start: "10 AM" , end: "20 PM", bgColor: Color.red)
                                MyCard(icon: "tray.fill", title: "강남역점", start: "10 AM" , end: "20 PM", bgColor: Color.orange)
                                MyCard(icon: "tray.fill", title: "아화점", start: "10 AM" , end: "20 PM", bgColor: Color.blue)
                            }.padding()
                            
                        }
                    }
                    
//                    Circle()
//                        .foregroundColor(Color.yellow)
//                        .frame(width:60, height: 60)
//                        .overlay(
//                            Image(systemName: "plus")
//                                .font(.system(size: 30))
//                                .foregroundColor(.white)
//                        )
//                    
//                        .padding(10)
//                        .shadow(radius: 20)
                    
                } //ZStack
                .navigationTitle("뒤로가기")
                .navigationBarHidden(self.isNavigationBarHidden)
                .onAppear{
                    self.isNavigationBarHidden = true
                }
                
            }// NavigationView
        }//GeometryReader
    }
}
