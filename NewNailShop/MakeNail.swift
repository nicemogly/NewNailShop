//
//  temp.swift
//  NewNailShop
//
//  Created by AD2201016P02 on 12/19/24.
//

import SwiftUI
import CoreData

//enum TabIndex {
//    case home, design, store, mypage
//}

struct MakeNail: View {

@Environment(\.managedObjectContext) private var viewContext

@FetchRequest(entity: Drawing.entity() , sortDescriptors: [])  var drawings: FetchedResults<Drawing>

@State private var showSheet = false

var body: some View {
    ZStack(alignment: .top){
        //backgroundColor.ignoresSafeArea()
        
        
        HStack{
            
            Text("네일디자인")
                .font(.system(size:30))
          
            
            Spacer()
            
            //   NavigationLink(destination: MakeNail()){
            Image(systemName: "pencil.tip.crop.circle.badge.arrow.forward")
                .font(.largeTitle)
            //  }
            
            Image(systemName: "magnifyingglass.circle.fill")
                .font(.largeTitle)
        }.padding(20)
            .padding(.top , 50)
        
        
        VStack{
            NavigationView {
                
                VStack{
                    List {
                        ForEach(drawings){drawing in
                            NavigationLink(destination: DrawingView(id: drawing.id, data: drawing.canvasData, title: drawing.title), label: {
                                Text(drawing.title ?? "Untitled")
                            })
                            
                        }
                        .onDelete(perform: deleteItem)
                        
                        
                        Button(action: {
                            self.showSheet.toggle()
                        }, label: {
                            HStack {
                                Image(systemName: "plus")
                                Text("Add Canvas")
                            }
                        })
                        .foregroundColor(.blue)
                        .sheet(isPresented: $showSheet, content:{
                            AddNewCanvasView().environment(\.managedObjectContext, viewContext)
                        })
                           
                    }
                  //  .navigationTitle(Text("Drawing"))
                    .toolbar {
                        EditButton()
                    }
                 
                }
                VStack{
                    Image(systemName: "scribble.variable")
                        .font(.largeTitle)
                    Text("No canvas has been selected")
                        .font(.title)
                }
            }
            .navigationViewStyle(DoubleColumnNavigationViewStyle())
        }.padding(.top , 120)
    }
    
}

func deleteItem(at offset: IndexSet){
    for index in offset {
        let itemToDelete = drawings[index]
        viewContext.delete(itemToDelete)
        do{
            try viewContext.save()
        }
        catch{
            print(error)
        }
    }
}


}
