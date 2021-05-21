//
//  BeneficiaryRouter.swift
//  Beneficiary
//
//  Created iOS Team on 5/11/21.
//  Copyright © 2021 iOS Team. All rights reserved.
//
//

import UIKit

protocol BeneficiaryRoutingLogic: class {
    func show(_list: BeneficiaryEntity)
    
    func navigateToDetail(_ bene :BeneModel)
    
}

class BeneficiaryRouter {
    weak var viewController: BeneficiaryViewController!
    
}

extension BeneficiaryRouter: BeneficiaryRoutingLogic {
    func navigateToDetail(_ bene: BeneModel) {
        let detailVc = BeneDetailConfigurator.viewcontroller()
        detailVc.bene = bene
        detailVc.updateEditedBeneDelegate = viewController
        viewController.navigationController?.pushViewController(detailVc, animated: true)
        
    }
    
    func show(_list: BeneficiaryEntity) {
        //
    }
    
    
   
    // MARK: Navigation
    /* Example
    func navigateToSomewhere() {
        // NOTE: Teach the router how to navigate to another scene. Some examples follow:
        // 1. Trigger a storyboard segue
        // viewController.performSegueWithIdentifier("ShowSomewhereScene", sender: nil)
        // 2. Present another view controller programmatically
        // viewController.presentViewController(someWhereViewController, animated: true, completion: nil)
        // 3. Ask the navigation controller to push another view controller onto the stack
        // viewController.navigationController?.pushViewController(someWhereViewController, animated: true)
        // 4. Present a view controller from a different storyboard
        // let storyboard = UIStoryboard(name: "OtherThanMain", bundle: nil)
        // let someWhereViewController = storyboard.instantiateInitialViewController() as! SomeWhereViewController
        // viewController.navigationController?.pushViewController(someWhereViewController, animated: true)
    } */
}
