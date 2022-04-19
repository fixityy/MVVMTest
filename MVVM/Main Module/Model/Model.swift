//
//  Model.swift
//  MVVM
//
//  Created by Roman Belov on 18.04.2022.
//

import Foundation

enum ViewData {
    case initial
    case loading(Data)
    case success(Data)
    case failure(Data)
    
    struct Data {
        let icon: String?
        let title: String?
        let description: String?
    }
}
