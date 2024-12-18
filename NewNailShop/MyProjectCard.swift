//
//  MyProjectCard.swift
//  nailshop
//
//  Created by AD2201016P02 on 12/9/24.
//

import SwiftUI

struct MyProjectCard : View {
    
    @State var shouldShowAlert: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0){
            
            Rectangle().frame(height: 0)
            
            Text("이달의 우수 Nail Shop")
                .font(.system(size: 23))
                .fontWeight(.black)
                .padding(.bottom, 5)
            Text("영덕 강구면 남정리점")
                .foregroundColor(.secondary)
            
            Spacer().frame(height: 20)
            HStack{
                Image("1")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 5)
                            .foregroundColor(Color.red)
                )
                Image("2")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Image("3")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                Spacer()
                
                //
                Button(action: {
                    print("확인 버튼이 클릭되었다.")
                    
                    self.shouldShowAlert = true
                    
                }){
                    Text("확인")
                    .fontWeight(.bold)
                    
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 80)
                    .background(Color.blue)
                    .cornerRadius(20)
                }.alert(isPresented: $shouldShowAlert){
                    Alert(title: Text("이달의 우수 네일샵 이동!"))
                }
                
                
                    
            }
        }
        .padding(20)
        .background(Color.yellow)
        .cornerRadius(20)
        
        
    }
    
}

struct MyProjectCard_Previews: PreviewProvider {
    static var previews: some View {
        MyProjectCard()
    }
}
