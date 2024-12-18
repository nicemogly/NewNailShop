//
//  MyMapView1.swift
//  NewNailShop
//
//  Created by AD2201016P02 on 2/26/25.
//

import SwiftUI
import MapKit
import CoreLocation

struct Address: Identifiable {
    var id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
struct MyMapView1: View {
    @State private var addresses = [ "경기도 용인시 기흥구 평촌2로  ", "경기도 용인시 기흥구 동백죽전대로 444  "]
    @State private var coordinates: [CLLocationCoordinate2D] = []
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 38.2779, longitude: 128.1516),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    
    var body: some View {
        VStack {
//            ForEach(0..<addresses.count, id: \.self){ index in
//                
//                TextField("Address", text: Binding(
//                    get: {self.addresses[index]},
//                    set: {self.addresses[index] = $0}
//                ), onCommit: {
//                    getCoordinateFrom(address: addresses[index]) { coordinate in
//                        if let coordinate = coordinate  {
//                            let newLocation = Address(name: addresses[index], coordinate: coordinate)
//                            self.locations.append(newLocation)
//                            updateRegion()
//                        }
//                    }
//                })
//                .padding()
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//            }
//            
            if !coordinates.isEmpty {
                Map(coordinateRegion: $region , annotationItems: coordinates ) { place in
                    MapPin(coordinate: place)
                }
                .edgesIgnoringSafeArea(.all)
            }else{
                Text("지도에 표시 못함")
                    .padding()
            }
        }.padding()
            .onAppear(perform: fetchCoordinates)
    }
  
    func getCoordinateFrom(address: String, completion: @escaping (CLLocationCoordinate2D?) -> ()) {
            let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { placemarks, error in
            guard let placemarks = placemarks , let location = placemarks.first?.location  else {
                completion(nil)
                return
            }
            completion(location.coordinate)
        }
    }
    
    func fetchCoordinates() {
        addresses.forEach { address in
            getCoordinateFrom(address: address) { coordinate in
                if let coordinate = coordinate {
                    self.coordinates.append(coordinate)
                    updateRegion()
                }
            }
        }
    }
    
    func updateRegion() {
        guard !coordinates.isEmpty else { return }
        let latitudes = coordinates.map{ $0.latitude }
        let longitudes = coordinates.map{ $0.longitude}
        let minLat = latitudes.min()!
        let maxLat = latitudes.max()!
        let minLon = longitudes.min()!
        let maxLon = longitudes.max()!
        
        let centerLat = (minLat + maxLat) / 2
        let centerLon = (minLon + maxLon) / 2
        
        region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: centerLat, longitude: centerLon),
            span: MKCoordinateSpan(latitudeDelta: maxLat - minLat + 0.01, longitudeDelta: maxLon - minLon + 0.01))
    }
}

extension CLLocationCoordinate2D: Identifiable {
    public var id: CLLocationDegrees {
        latitude + longitude
    }
    
}

