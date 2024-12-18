//
//  DraggableView.swift
//  nailshop
//
//  Created by AD2201016P02 on 12/10/24.
//
import SwiftUI

struct DraggableView:View{
    
    @State private var isDragging:Bool = false
    @State private var location:CGPoint
    @Binding var newparts2: [NewPart2]
    @State var bgcolor : Color
    
    private let imageName:String
    
    init(location:CGPoint,imageName:String,newparts2:Binding<[NewPart2]>, bgcolor:Color){
        self._newparts2 = newparts2
        self.location = location
        self.bgcolor = bgcolor
        self.imageName = imageName
        
        
    }
    
    var dragGesture: some Gesture{
        DragGesture()
            .onChanged { value in
                self.location = value.location
                self.isDragging = true
            }
        
            .onEnded { value in
                
              
                newparts2.append(NewPart2(name: self.imageName ,  Cpoint: value.location , bgcolor: self.bgcolor))
                self.isDragging = false
                
               
            }
    }
    
    var body: some View{
      
            Image( imageName)
       
            .foregroundColor(isDragging ? .blue : .black)
            .position(location)
            
            .gesture(dragGesture)
    }
}
