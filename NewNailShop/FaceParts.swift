//
//  FaceParts.swift
//  nailshop
//
//  Created by AD2201016P02 on 12/10/24.
//

import Foundation

enum FaceParts:String,Identifiable,CaseIterable{
    
    case perl
    case crystal1
    case crystal2
    case santa
    case santa1
    
    var id:String{rawValue}
    
    var imageName:String{
        switch self {
        case .perl:
            return "perl"
        case .crystal1:
            return "crystal1"
        case .crystal2:
            return "crystal2"
        case .santa:
            return "santa"
        case .santa1:
            return "santa1"
        }
    }
    
    var defaultLocation:CGPoint{
        switch self {
        case .perl:
            return CGPoint(x: 120, y: 200)
        case .crystal1:
            return CGPoint(x: 280, y: 200)
        case .crystal2:
            return CGPoint(x: 190, y: 300)
        case .santa:
            return CGPoint(x: 190, y: 430)
        case .santa1:
            return CGPoint(x: 190, y: 460)
        }
    }
}
