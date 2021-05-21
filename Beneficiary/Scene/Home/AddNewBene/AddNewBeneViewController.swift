//
//  AddNewBeneViewController.swift
//  Beneficiary
//
//  Created iOS Team on 5/18/21.
//  Copyright © 2021 iOS Team. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol AddNewBenePresentationLogic: class {
    
}

// MARK: View
class AddNewBeneViewController: UIViewController {
    var interactor: AddNewBeneInteractorLogic!
    var router: AddNewBeneRoutingLogic!
    
    // MARK: IBOutlet
    @IBOutlet weak var buttonSelectType: UIButton!
    var transparentView = UIView()
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
    }
    
    // MARK: Fetch AddNewBene
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        
    }
    
    // MARK: SetupUI
    private func setupView() {
        title = "Thêm mới danh bạ thụ hưởng"
        
    }
    
    // MARK: IBAction
    @IBAction func onclickSelectType(_ sender: Any) {
    }
}

// MARK: Connect View, Interactor, and Presenter
extension AddNewBeneViewController: AddNewBenePresentationLogic {
    
}
