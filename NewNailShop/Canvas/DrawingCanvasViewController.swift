//
//  DrawingCanvasViewController.swift
//  NewNailShop
//
//  Created by AD2201016P02 on 12/18/24.
//

import SwiftUI
import PencilKit

class DrawingCanvasViewController: UIViewController {
    
   
    var drawings = [PKDrawing]()
    var didRemove = false
    
    lazy var canvas: PKCanvasView = {
        let view = PKCanvasView()
        view.drawingPolicy = .anyInput
        view.minimumZoomScale = 1
        view.maximumZoomScale = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tool = PKInkingTool(.pen, color: .black , width:15)
        
        view.isOpaque = false
        view.backgroundColor = UIColor.clear
        //view.delegate = context.coordinator
        view.becomeFirstResponder()
        
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let imageView = UIImageView(image: UIImage(named: "hands2"))
        imageView.contentMode = .scaleAspectFill
        //imageView.clipsToBounds = true
        imageView.frame = CGRect(x: 0 , y:0, width: 400  , height: 600)
       
        let contentView = view.subviews[0]
        contentView.addSubview(imageView)
        contentView.sendSubviewToBack(imageView)
       
        let imageView1 = UIImageView(image: UIImage(systemName: "square.and.arrow.up.fill"))
       
        imageView1.contentMode = .scaleAspectFill
        //imageView.clipsToBounds = true
        imageView1.frame = CGRect(x: 0 , y:0, width: 50  , height: 50)
       
        let contentView1 = view.subviews[1]
        contentView1.addSubview(imageView1)
        contentView1.sendSubviewToBack(imageView1)

        
        
  
        
        return view
    }()
    
    lazy var toolPicker: PKToolPicker = {
        let toolPicker = PKToolPicker()
        toolPicker.addObserver(self)
        return toolPicker
    }()
    
    var drawingData = Data()
    var drawingChanged: (Data) -> Void = {_ in}
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(canvas)
        NSLayoutConstraint.activate([
            canvas.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            canvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            canvas.topAnchor.constraint(equalTo: view.topAnchor),
            canvas.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        toolPicker.setVisible(true, forFirstResponder: canvas)
        toolPicker.addObserver(canvas)
        canvas.delegate = self
        canvas.becomeFirstResponder()
        if let drawing = try? PKDrawing(data: drawingData){
            canvas.drawing = drawing
        }
    }
    
    
    func clear() {
        print("clear")
        
       // canvas.drawing = PKDrawing()
    }
    
    func onImage(){
       print("onImage")
    }
}


extension DrawingCanvasViewController:PKToolPickerObserver, PKCanvasViewDelegate{
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        drawingChanged(canvasView.drawing.dataRepresentation())
    }
}
