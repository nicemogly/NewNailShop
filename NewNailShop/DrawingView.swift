//
//  DrawingView.swift
//  NewNailShop
//
//  Created by AD2201016P02 on 12/18/24.
//

import SwiftUI
import PencilKit

struct DrawingView: View {
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.undoManager) private var undoManager
 
    
    @State private var canvasView = PKCanvasView()
    @State var id:UUID?
    @State var data:Data?
    @State var title:String?
    
    let pkCntrl = DrawingCanvasViewController()
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    var body: some View {
        VStack(alignment: .leading){
//            HStack{
//                    Button("Clear") {
//                        pkCntrl.clear()
//                    }.background(Color.black)
//                        .foregroundStyle(Color.white)
//                        .frame(width:50, height:50 , alignment: .leading)
//                        .padding(10)
//                    Button("Undo") {
//                        undoManager?.undo()
//                    }.background(Color.black)
//                        .foregroundStyle(Color.white)
//                        .frame(width:50, height:50 , alignment: .leading)
//                        .padding(10)
//                    Button("Redo") {
//                        undoManager?.redo()
//                    }.background(Color.black)
//                        .foregroundStyle(Color.white)
//                        .frame(width:50, height:50 , alignment: .leading)
//                        .padding(10)
//                    Button("Image") {
//                        pkCntrl.onImage()
//                    }.background(Color.black)
//                        .foregroundStyle(Color.white)
//                        .frame(width:80, height:50 , alignment: .leading)
//                        .padding(10)
//               
//            }.frame(width: width, height: 30 , alignment: .leading)
//             .background(Color.gray)
//             .padding(.top , 20)
            HStack(spacing: 5) {
                           Spacer(minLength: 1)
                           Button("Clear") {
                               canvasView.drawing = PKDrawing()
                           }.buttonStyle(.borderedProminent)
                           Spacer(minLength: 1)
                           Button("Undo") {
                               undoManager?.undo()
                           }.buttonStyle(.borderedProminent)
                           Spacer(minLength: 1)
                           Button("Redo") {
                               undoManager?.redo()
                           }.buttonStyle(.borderedProminent)
                           Spacer(minLength: 1)
                           Button("Image") {
                               self.canvasView.tool = PKEraserTool(.vector);
                           }.buttonStyle(.borderedProminent)
                           Spacer(minLength: 1)
                         
                       }
               
                
            DrawingCanvasView(canvasView: $canvasView , data: data ?? Data() , id: id ?? UUID())
                .environment(\.managedObjectContext, viewContext)
                .navigationBarTitle(title ?? "Untitled", displayMode: .inline)
        }
        
    }
}

