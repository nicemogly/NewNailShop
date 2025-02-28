//
//  AddNewCanvasView.swift
//  NewNailShop
//
//  Created by AD2201016P02 on 12/18/24.
//

import SwiftUI

struct AddNewCanvasView: View {
    
    @Environment (\.managedObjectContext) var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    @State private var canvasTitle = ""
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Canvas Title", text: $canvasTitle)
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationTitle(Text("Add New Canvas"))
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
            }), trailing: Button(action: {
                if !canvasTitle.isEmpty{
                    let drawing = Drawing(context: viewContext)
                    drawing.title = canvasTitle
                    drawing.id = UUID()
                    
                    do {
                        try viewContext.save()
                    }
                    catch {
                        print(error)
                    }
                    
                    self.presentationMode.wrappedValue.dismiss()
                }
            }, label: {
                Text("Save")
            }))
        }
    }
}

struct AddnewCanvasView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewCanvasView()
    }
}
