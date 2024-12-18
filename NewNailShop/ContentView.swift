//
//  ContentView.swift
//  NewNailShop
//
//  Created by AD2201016P02 on 12/18/24.
//

import SwiftUI
import CoreData

enum TabIndex {
    case home, design, store, mypage
}

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: Drawing.entity() , sortDescriptors: [])  var drawings: FetchedResults<Drawing>
    
    @State private var showSheet = false
    
    
        @State var isNavigationBarHidden : Bool = false
        @State var tabIndex : TabIndex
        @State var largerScale : CGFloat = 1.2
            
            func changeMyView(tabIndex: TabIndex) -> MyView{
                switch tabIndex {
                case .home:
                    return MyView(title: "홈", bgColor: Color.green)
                case .design:
                    return MyView(title: "네일디자인", bgColor: Color.white)
                case .store:
                    return MyView(title: "매장검색", bgColor: Color.yellow)
                case .mypage:
                    return MyView(title: "마이페이지", bgColor: Color.blue)
                    
                      
                default:
                    return MyView(title: "홈", bgColor: Color.green)
                }
            }
            
            func changeIconColor(tabIndex: TabIndex) -> Color {
                switch tabIndex {
                case .home:
                    return Color.green
                case .design:
                    return Color.purple
                case .store:
                    return Color.yellow
                case .mypage:
                    return Color.blue
                default:
                    return Color.green
                }
            }
            
            func calcCircleBgPosition(tabIndex: TabIndex,geometry: GeometryProxy) -> CGFloat{
                switch tabIndex {
                case .home:
                    return -(geometry.size.width / 4)*2
                case .design:
                    return 0
                case .store:
                    return geometry.size.width / 4
                case .mypage:
                    return (geometry.size.width / 4)*2
                default:
                    return -(geometry.size.width / 4)*2
                }
            }
            

        var body: some View {
            GeometryReader{ geometry in
                
                ZStack(alignment: .bottom){
                    
                    self.changeMyView(tabIndex: self.tabIndex)
                    
    //                Circle()
    //                    .frame(width: 90, height: 90)
    //                    .offset(x: self.calcCircleBgPosition(tabIndex: self.tabIndex,geometry: geometry),y: UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 20 : 0)
    //                    .foregroundColor(Color.white)
                    
                    VStack(spacing: 0){
                        HStack(spacing: 0){
                            Button(action:{
                                print("홈 버튼 클릭")
                                
                                withAnimation{
                                    self.tabIndex = .home
                                }
                                
                            }){
                                Image(systemName: "house.fill")
                                    .font(.system(size: 25))
                                    .scaleEffect(self.tabIndex == .home ? self.largerScale : 1.0)
                                    .foregroundColor(self.tabIndex == .home ? self.changeIconColor(tabIndex: self.tabIndex) : Color.gray)
                                    .frame(width: geometry.size.width / 4, height: 50)
                                    .offset(y: self.tabIndex == .home ? -5 : 0)
                            }
                            .background(Color.white)
                            
                            Button(action:{
                                print("design 버튼 클릭")
                                withAnimation{
                                    self.tabIndex = .design
                                }
                                
                            }){
                                Image(systemName: "hand.raised.app")
                                    .font(.system(size: 25))
                                    .scaleEffect(self.tabIndex == .design ? self.largerScale : 1.0)
                                    .foregroundColor(self.tabIndex == .design ? self.changeIconColor(tabIndex: self.tabIndex) : Color.gray)
                                    .frame(width: geometry.size.width / 4, height: 50)
                                    .offset(y: self.tabIndex == .design ? -10 : 0)
                            }
                            .background(Color.white)
                            
                            Button(action:{
                                print("store 버튼 클릭")
                                withAnimation{
                                    self.tabIndex = .store
                                }
                                
                            }){
                                Image(systemName: "storefront")
                                    .font(.system(size: 25))
                                    .scaleEffect(self.tabIndex == .store ? self.largerScale : 1.0)
                                    .foregroundColor(self.tabIndex == .store ? self.changeIconColor(tabIndex: self.tabIndex) : Color.gray)
                                    .frame(width: geometry.size.width / 4, height: 50)
                                    .offset(y: self.tabIndex == .store ? -10 : 0)
                            }.background(Color.white)
                            
                            Button(action:{
                                print("mypage 버튼 클릭")
                                withAnimation{
                                    self.tabIndex = .mypage
                                }
                                
                            }){
                                Image(systemName: "person.circle.fill")
                                    .font(.system(size: 25))
                                    .scaleEffect(self.tabIndex == .mypage ? self.largerScale : 1.0)
                                    .foregroundColor(self.tabIndex == .mypage ? self.changeIconColor(tabIndex: self.tabIndex) : Color.gray)
                                    .frame(width: geometry.size.width / 4, height: 50)
                                    .offset(y: self.tabIndex == .mypage ? -10 : 0)
                            }.background(Color.white)
                            
                            
                        }// HStack
                        Rectangle()
                            .foregroundColor(Color.white)
                            .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 0 : 20)
                        
                        
                    }
                    
                    
                    
                    
                }
            }.edgesIgnoringSafeArea(.all)
                       
            //Geometry
        }
    }
    
    
    
    


#Preview {
    ContentView(tabIndex: .home).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
