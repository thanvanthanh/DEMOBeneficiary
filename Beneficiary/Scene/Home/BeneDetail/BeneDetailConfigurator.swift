//
//  BeneDetailConfigurator.swift
//  Beneficiary
//
//  Created iOS Team on 5/17/21.
//  Copyright © 2021 iOS Team. All rights reserved.
//
//

import UIKit

class BeneDetailConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> BeneDetailViewController {
        
        // MARK: Initialise components.
        let viewController = BeneDetailViewController(nibName: "BeneDetailViewController", bundle: nil)
        let interactor = BeneDetailInteractor(withWorker: BeneDetailWorker())
        let router = BeneDetailRouter()
        
        // MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
