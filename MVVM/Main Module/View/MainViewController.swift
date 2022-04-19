//
//  ViewController.swift
//  MVVM
//
//  Created by Roman Belov on 18.04.2022.
//

import UIKit

class MainViewController: UIViewController {
    private var viewModel: MainViewModelProtocol!
    private var testView: TestView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //переделать на инъекцию
        viewModel = MainViewModel()

        createView()
        updateView()
        
    }

    private func createView() {
        testView = TestView()
        testView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        testView.center = view.center
        testView.backgroundColor = .systemCyan
        view.addSubview(testView)
    }
    
    private func updateView() {
        viewModel.updateViewData = { [weak self] viewData in
            self?.testView.viewData = viewData
        }
    }

    @IBAction func startButton(_ sender: Any) {
        viewModel.startFetch()
    }
}

