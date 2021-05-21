//
//  AddNewBeneInteractor.swift
//  Beneficiary
//
//  Created iOS Team on 5/18/21.
//  Copyright © 2021 iOS Team. All rights reserved.
//
//

/// AddNewBene Module Interactor Protocol
protocol AddNewBeneInteractorLogic {
    
}

/// AddNewBene Module Interactor
class AddNewBeneInteractor {
    weak var presenter: AddNewBenePresentationLogic!
    weak var router: AddNewBeneRoutingLogic!
    private var worker: AddNewBeneWorkerLogic
    
    required init(withWorker worker: AddNewBeneWorkerLogic) {
        self.worker = worker
    }
}

extension AddNewBeneInteractor: AddNewBeneInteractorLogic {

}

