//
//  MyView.swift
//  nailshop
//
//  Created by AD2201016P02 on 12/9/24.
//

import SwiftUI

struct MyView : View {
    
    var title: String
    
    var bgColor: Color
    
    var body: some View{
        
        ZStack{
            
            bgColor
//            .edgesIgnoringSafeArea(.all)
            
            if(title == "홈"){
                Home()
            }else if(title == "네일디자인"){
                MakeNail()
      
            }else if(title == "매장검색"){
                Store()
                
            }else if(title == "마이페이지"){
                Mypage()
                          
            }
            
//            Text(title)
//                .font(.largeTitle)
//                .fontWeight(.black)
//                .foregroundColor(Color.white)
            
        }.animation(.none)
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView(title: "마이뷰", bgColor: Color.orange)
    }
}
