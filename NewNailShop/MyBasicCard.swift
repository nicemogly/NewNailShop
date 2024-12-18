//
//  MyBasicCard.swift
//  nailshop
//
//  Created by AD2201016P02 on 12/9/24.
//

import SwiftUI

struct MyBasicCard : View {
    
    var body: some View{
        
        HStack(spacing: 20){
            
            Image(systemName: "medal.fill")
                .font(.system(size: 40))
                .foregroundColor(Color.white)
            
            VStack(alignment: .leading, spacing: 0){
                Divider().opacity(0)
//                Rectangle().frame(height: 0)
                Text("이달의 우수 네일 디자인")
                    .fontWeight(.bold)
                    .font(.system(size: 23))
                    .foregroundColor(Color.white)
                
                Spacer().frame(height: 5)
                
                Text("경주 건천 Lv9. 박연학 회원님!!! Congratureration!!!!")
                    .foregroundColor(Color.white)
                
            }
            
            
            
        }
        .padding(20)
        .background(Color.purple)
        .cornerRadius(20)
        
    }
    
    
}

struct MyBasicCard_Previews: PreviewProvider {
    static var previews: some View {
        MyBasicCard()
    }
}
