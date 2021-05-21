//
//  BeneficiaryConfigurator.swift
//  Beneficiary
//
//  Created iOS Team on 5/11/21.
//  Copyright © 2021 iOS Team. All rights reserved.
//
//

import UIKit

class BeneficiaryConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> BeneficiaryViewController {
        
        // MARK: Initialise components.
        let viewController = BeneficiaryViewController(nibName: "BeneficiaryViewController", bundle: nil)
        let interactor = BeneficiaryInteractor(withWorker: BeneficiaryWorker())
        let router = BeneficiaryRouter()
        
        // MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
