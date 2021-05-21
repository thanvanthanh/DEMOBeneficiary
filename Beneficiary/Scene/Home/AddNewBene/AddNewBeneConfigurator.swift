//
//  AddNewBeneConfigurator.swift
//  Beneficiary
//
//  Created iOS Team on 5/18/21.
//  Copyright © 2021 iOS Team. All rights reserved.
//
//

import UIKit

class AddNewBeneConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> AddNewBeneViewController {
        
        // MARK: Initialise components.
        let viewController = AddNewBeneViewController(nibName: "AddNewBeneViewController", bundle: nil)
        let interactor = AddNewBeneInteractor(withWorker: AddNewBeneWorker())
        let router = AddNewBeneRouter()
        
        // MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
