//
//  MainViewModel.swift
//  MVVM
//
//  Created by Roman Belov on 18.04.2022.
//

import Foundation

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData)->())? { get set }
    func startFetch()
    
}

final class MainViewModel: MainViewModelProtocol {
    public var updateViewData: ((ViewData) -> ())?
    
    init() {
        updateViewData?(.initial)
    }
    
    public func startFetch() {
        
        updateViewData?(.loading(ViewData.Data(icon: nil, title: nil, description: nil)))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.updateViewData?(.success(ViewData.Data(icon: "success", title: "success", description: "good")))
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) { [weak self] in
            self?.updateViewData?(.success(ViewData.Data(icon: "failure", title: "failure", description: "bad")))
        }
    }
    
    
}
