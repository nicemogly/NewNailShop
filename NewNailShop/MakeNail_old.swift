//
//  MakeNail.swift
//  nailshop
//
//  Created by AD2201016P02 on 12/9/24.
//

import SwiftUI


struct Part: Identifiable{
    var id = UUID()
    var name : String
    var Width : String
    var Height : String
}


struct NewPart: Identifiable{
    var id = UUID()
    var name : String
    var Width : String
    var Height : String
    var Xposi : Float
    var Yposi : Float
    var bgcolor : Color
}



struct NewPart1: Identifiable{
    var id = UUID()
    var name : String
    var Cpoint : CGPoint
    var bgcolor : Color
}



struct NewPart2: Identifiable{
    var id = UUID()
    var name : String
    var Cpoint : CGPoint
    var bgcolor : Color
}


struct MakeNail_old: View {
    

    
    @State var backgroundColor: Color = .white
    @State var bcolor: Color = .white
    
    @State var bgcolor: String = ""

    @State var showingSheet = false
    @State var showingSheet1 = false
    @State var showingSheet2 = false
    @State var kstr1 = ""
    @State private var showingAlert = false
    @State private var showingAlert1 = false
    @State private var savename = ""
    @State private var  InterSaveFlag = UserDefaults.standard.string(forKey: "NailD1")!
    @State private var karry1 = []
    @State private var showPicker = false
    @State private var showImg = false

    //@Binding var isNavigationBarHidden: Bool
    
    

    @State var  parts = [
        Part(name: "santa" , Width: "100" , Height: "100" ) ,
        Part(name: "santa1" ,Width: "100" , Height: "100" ),
        Part(name: "perl" , Width: "30" , Height: "30" ),
        Part(name: "crystal1" , Width: "50" , Height: "50" ),
        Part(name: "crystal2", Width: "50" , Height: "50" )
    ]

    @State private var options = ["선택하세요"]
    @State private var selectionOption = ""
    
    
    @State var newparts = [NewPart(name: "", Width: "", Height: "", Xposi: 0 , Yposi: 0 , bgcolor: .white)]
    @State var newparts1 =  [NewPart1(name: "",  Cpoint:CGPoint(x: 0, y: 0) , bgcolor: .white)]
    @State var newparts2 =  [NewPart2(name: "",  Cpoint:CGPoint(x: 0, y: 0) , bgcolor: .white)]
    @State var flushUI: Bool = false
    var body: some View {
        
        if flushUI { EmptyView() }
        
        ZStack(alignment: .topLeading){
            backgroundColor.ignoresSafeArea()
            
            HStack{
                
                Text("네일디자인")
                    .font(.system(size:30))
                    .fontWeight(.black)
             
                Spacer()
                
             //   NavigationLink(destination: MakeNail()){
                    Image(systemName: "pencil.tip.crop.circle.badge.arrow.forward")
                        .font(.largeTitle)
              //  }
                
                Image(systemName: "magnifyingglass.circle.fill")
                    .font(.largeTitle)
            }.padding(20)
                .padding(.top , 50)
            
         
            HStack(alignment: .top, content:  {
                Rectangle()
                    .fill(bcolor)
                    .frame(width:UIScreen.main.bounds.width/3 , height:150)
                    .cornerRadius(10)
            }).padding(10)
                .padding(.top ,120)
                .frame(width: UIScreen.main.bounds.width - 0)
                .cornerRadius(60)
           
               
                ForEach(newparts){ aa in
                   
             
                    if(showImg){
                        DraggableView(location: CGPoint(x: Double(aa.Width) ?? 30 ,y: Double(aa.Height) ?? 100), imageName: aa.name, newparts2: $newparts2 , bgcolor: aa.bgcolor)
                    }else{
                        DraggableView(location: CGPoint(x: Double(aa.Width) ?? 30 , y: Double(aa.Height) ?? 100), imageName: aa.name, newparts2: $newparts2, bgcolor:  aa.bgcolor)
                    }
                }
         
            HStack {
                ColorPicker(
                    "색상을 선택하세요",
                    selection: $bcolor,
                    supportsOpacity: true)
                .padding()
                .background(Color.black.opacity(0.7))
                .cornerRadius(10)
                .foregroundColor(.white)
                .font(.headline)
                .padding(.top , 280)
                .padding(10)
            }
            
            HStack {
                
                Button(action: {
                    self.showingSheet.toggle()
                    
                }) {
                    Text(
                        "파츠추가")
                    .frame(width:UIScreen.main.bounds.width-50 , alignment: .leading)
                }
                .sheet(isPresented: $showingSheet){
                   VStack{
                        List(parts) { partlist in
                            
                            HStack{
                                Image(partlist.name)
                                    .resizable()
                                    .frame(width:50 , height:50)
                                Text(partlist.name)
                                    .foregroundStyle(.black)
                                
                                Text(partlist.Width)
                                    .foregroundStyle(.gray)
                                Text("*")
                                    .foregroundStyle(.gray)
                                
                                Text(partlist.Height)
                                    .foregroundStyle(.gray)
                                
                                Button("선택") {
                                   // DraggableView(location: CGPoint(x: 0, y: 0), imageName: partlist.name)
                                    newparts.append(NewPart(name: partlist.name, Width: "30", Height: "200", Xposi: 0 , Yposi: 0 , bgcolor: bcolor))
                                    let kcnt = newparts.indices.filter({ newparts[$0].name == ""}).first
                                    if(kcnt != nil){
                                        newparts.remove(at: kcnt!)
                                    }
                                    self.showingSheet.toggle()
                                }.foregroundStyle(.red)
                            }
                        }
                    }
                    .presentationDetents([.medium, .large, .height(380)])
                }
                .padding()
                .background(Color.black.opacity(0.7))
                .cornerRadius(10)
                .foregroundColor(.white)
                .font(.headline)
                
                .padding(.top , 360)
                .padding(10)
               
            }
            

            HStack {
                
                Button(action: {
                    self.showingSheet1.toggle()
                    
                }) {
                    Text(
                        "파츠삭제")
                    .frame(width:UIScreen.main.bounds.width-50 , alignment: .leading)
                }
                .sheet(isPresented: $showingSheet1){
                   VStack{
                          
                           List(newparts) { partlist1 in
                           
                            HStack{
                                Image(partlist1.name)
                                    .resizable()
                                    .frame(width:50 , height:50)
                                Text(partlist1.name)
                                    .foregroundStyle(.black)
                                
                                Text(partlist1.Width)
                                    .foregroundStyle(.gray)
                                Text("*")
                                    .foregroundStyle(.gray)
                                
                                Text(partlist1.Height)
                                    .foregroundStyle(.gray)
                                
                                
                                
                                Button("삭제") {
                                  
                                    let kcnt = newparts.indices.filter({ newparts[$0].name == partlist1.name}).first!
                                    newparts.remove(at: kcnt)
                                    
                                    print("count:\(newparts1.count)")
                                    
                                    let kcnt1 = newparts2.indices.filter({ newparts2[$0].name == partlist1.name}).first!
                                    newparts2.remove(at: kcnt1)
                                    
                                    print("\(kcnt1)")
                                    
                                    print("count1:\(newparts1.count)")
                                    self.showingSheet1.toggle()
                                }.foregroundStyle(.red)
                                
                              
                            }
                            
                     
                       }
                    }
                    .presentationDetents([.medium, .large, .height(380)])
                }
                .padding()
                .background(Color.black.opacity(0.7))
                .cornerRadius(10)
                .foregroundColor(.white)
                .font(.headline)
                
                .padding(.top , 440)
                .padding(10)
               
            }
            
            HStack(spacing:20) {
              
                        Button(action: {
                            showingAlert.toggle()
                            
                        }) {
                            Text("저장")
                               .frame(width:UIScreen.main.bounds.width/5 , alignment: .center)
                               .padding(5)
                            
                        }
                        .background(Color.black)
                        .alert("임시저장", isPresented: $showingAlert){
                            TextField("임시저장명을 입력하세요", text: $savename)
                                .foregroundStyle(.black)
                            Button("OK", action: {
                                submit()
                               
                            })
                          
                        } message: {
                            Text("앱을 삭제하시면 데이터가 사라집니다.!!!")
                        }
               
                        Button(action: {
                           // self.showingSheet2.toggle()
                            refresh()
                            
                        }) {
                            Text("초기화")
                               .frame(width:UIScreen.main.bounds.width/5 , alignment: .center)
                               .padding(5)
                        }
                        .background(Color.black)
                       Spacer()
                     
                        Button(action: {
                            showingAlert1.toggle()
                        }) {
                            Text("모두삭제")
                                .frame(width:UIScreen.main.bounds.width/5 , alignment: .center)
                                .padding(5)
                                
                        }  .background(Color.red)
                
                    .alert("일괄삭제", isPresented: $showingAlert1){
                       
                        Button("OK", action: {
                            del()
                        })
                      
                    } message: {
                        Text("삭제하시겠습니까?")
                    }
                        
                   
            }
            .padding()
            .background(Color.black.opacity(0.7))
            .cornerRadius(10)
            .foregroundColor(.white)
            .font(.headline)
            .padding(.top , 520)
            .padding(10)
            
            HStack {
                
                VStack {
                   
                    if(showPicker){
                        Picker( "select choice", selection: $selectionOption){
                            
                            ForEach(options, id: \.self){
                                Text($0).tag(String($0))
                            }
                            
                      
                            
                        }
                        .id(options)
                        .frame(width:UIScreen.main.bounds.width-70 , alignment: .leading)
                        .onChange(of: selectionOption){
                            // DraggableView(location: CGPoint(x: 30, y: 200), imageName: "perl", newparts1: $newparts1)
                            onSelpicker(str1:selectionOption)
                            
                           // newparts.append(NewPart(name: selectionOption, Width: "30", Height: "200", Xposi: 0 , Yposi: 0))
                        }
                        
                        
                    }else{
                        
                        Picker( "select choice", selection: $selectionOption){
                      
                                ForEach(options, id: \.self){
                                    Text($0).tag(String($0))
                                }
                          
                                
                            }
                            .id(options)
                            .frame(width:UIScreen.main.bounds.width-50 , alignment: .leading)
                            .onChange(of: selectionOption){
                                // DraggableView(location: CGPoint(x: 30, y: 200), imageName: "perl", newparts1: $newparts1)
                               // newparts.append(NewPart(name: selectionOption, Width: "30", Height: "200", Xposi: 0 , Yposi: 0))
                        
                                onSelpicker(str1:selectionOption)
                            }
                            
                            
                    }
                  
                }
            }
            .padding()
            .background(Color.black.opacity(0.7))
            .cornerRadius(10)
            .foregroundColor(.white)
            .font(.headline)
            
            .padding(.top , 600)
            .padding(10)
         
            
            
        }
        .onAppear{
         
            onChaPicker()
        }

        
        
        
    }
  
    func onSelpicker(str1:String) {
        print("all:\(InterSaveFlag)")
        
        var result1 = InterSaveFlag.split(separator: "###")
        var s = 0
        
        var kcnt1 = result1.count
     
        if kcnt1 > 0 {
            for x in 0 ..< kcnt1 {
                if let rangeS = result1[x].range(of: "**") {
                    s = result1[x].distance(from: result1[x].startIndex, to: rangeS.lowerBound)
                }
                
                
                let start = result1[x].index(result1[x].startIndex , offsetBy: 0)
                let end = result1[x].index(result1[x].startIndex , offsetBy: s)
                let kstr2 = result1[x].substring(with: start ..< end)
                
                if(kstr2 == str1){
                    
                   // print(result1[x])
                    
                    let result2 = result1[x].split(separator: "**")
                    let kcnt2 = result2.count
                    
                    newparts.removeAll()
                    for y in 0 ..< kcnt2 {
                        let result3 = result2[y].split(separator: ":")
                        if(result3.count == 4){

                            let result4 = result3[3].split(separator: " ")
                            if result4.count == 1 {
                              //  bcolor = Color(hex: String(result3[3]))
                            }else{
                                let c1 = Double(result4[1])!
                                let c2 = Double(result4[2])!
                                let c3 = Double(result4[3])!
                                let ttcol = Color(.sRGB, red:c1 , green:c2 , blue:c3)
                                bcolor = ttcol
                            }
                            showImg.toggle()
                            newparts.append(NewPart(name: String(result3[0]), Width: String(result3[1]), Height: String(result3[2]), Xposi: 0 , Yposi: 0, bgcolor: Color(String(result3[3]))))
                        }
                    }
                    //newparts.append(NewPart(name: result2[y], Width: "30", Height: "200", Xposi: 0 , Yposi: 0))
                   
                }
                        
            }
        }
    }
    
    
    func onChaPicker() {
       // print("oncha:\(InterSaveFlag)")
        var result1 = InterSaveFlag.split(separator: "###")
        var s = 0
        //print(result1.count)
        //print(result1)
        
        var kcnt1 = result1.count
      // print("kcnt1:\(kcnt1)")
        options.removeAll()
        if kcnt1 > 0 {
            for x in 0 ..< kcnt1 {
                if let rangeS = result1[x].range(of: "**") {
                    s = result1[x].distance(from: result1[x].startIndex, to: rangeS.lowerBound)
                }
                
                let start = result1[x].index(result1[x].startIndex , offsetBy: 0)
                let end = result1[x].index(result1[x].startIndex , offsetBy: s)
               // print(result1[x].substring(with: start ..< end))
                options.append(result1[x].substring(with: start ..< end))
                
                selectionOption = result1[x].substring(with: start ..< end)
               // showPicker = true
               
            }
        }
      
       
    }
    
    func submit(){
         InterSaveFlag = UserDefaults.standard.string(forKey: "NailD1")!
        
        newparts2.forEach{ jj in
            
            var kcnt1 = jj.name
        
            let kcnt = newparts2.indices.filter({ newparts2[$0].name == kcnt1})
            
            if kcnt.count > 1 {
               let aaa =  newparts2.indices.filter({ newparts2[$0].name == kcnt1}).last!
                let kcnt1 = newparts1.indices.filter({ newparts1[$0].name == kcnt1})
                if kcnt1.count == 0 {
                    newparts1.append(NewPart1(name: newparts2[aaa].name ,  Cpoint: newparts2[aaa].Cpoint , bgcolor: newparts2[aaa].bgcolor))
                }
            }else {
                newparts1.append(NewPart1(name: jj.name ,  Cpoint: jj.Cpoint , bgcolor: jj.bgcolor))
            }
            
           // newparts1.append(NewPart2(name: self.imageName ,  Cpoint: value.location , bgcolor: self.bgcolor))
            
            
        }
        
        var posiitem: String = ""
          newparts1.forEach{ kk in
              if(kk.name != ""){
                posiitem = posiitem+"**\(kk.name):\(kk.Cpoint.x):\(kk.Cpoint.y):\(bcolor)"
            }
        }
        
  
        var kposiname = InterSaveFlag+"###\(savename)\(posiitem)"
        
          UserDefaults.standard.set(kposiname, forKey: "NailD1")
          
       
        
        
        
        InterSaveFlag = kposiname
     
        onChaPicker()
        //showPicker.toggle()
     
//        bcolor = .white
//        newparts.removeAll()
//        newparts1.removeAll()
        refresh()
  
        
    }
    
    func del() {
        UserDefaults.standard.set("", forKey: "NailD1")
        InterSaveFlag = ""
        onChaPicker()
        refresh()

    }

    func refresh(){
        bcolor = .white
        newparts.removeAll()
        newparts1.removeAll()
       // options.removeAll()
    }
   
    
}




#Preview {
    //@State  var  visNavigationBarHidden = true
    MakeNail()
}
