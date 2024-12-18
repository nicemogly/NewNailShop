//
//  Store.swift
//  nailshop
//
//  Created by AD2201016P02 on 12/9/24.
//

import SwiftUI
import MapKit

struct Store: View {
    @State var backgroundColor: Color = .white
    @State var bcolor: Color = .white
    
    @State var myPosition = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(37.331705), longitude: CLLocationDegrees(-122.030237)), span: MKCoordinateSpan())
    
    var body: some View {
        if #available(iOS 14, *) {
            Map(coordinateRegion: $myPosition)
        } else {
            Text("iOS 버전이 13입니다")
        }
        backgroundColor.ignoresSafeArea()
        
        ZStack(alignment: .top){
            backgroundColor.ignoresSafeArea()
            
            
            HStack{
                
                Text("매장찾기")
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
                MyMapView1()
            }.padding(.top , 120)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Store()
    }
}
