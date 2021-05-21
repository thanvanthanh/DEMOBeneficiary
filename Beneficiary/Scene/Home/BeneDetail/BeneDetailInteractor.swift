//
//  BeneDetailInteractor.swift
//  Beneficiary
//
//  Created iOS Team on 5/17/21.
//  Copyright © 2021 iOS Team. All rights reserved.
//
//

/// BeneDetail Module Interactor Protocol
protocol BeneDetailInteractorLogic {
    
}

/// BeneDetail Module Interactor
class BeneDetailInteractor {
    weak var presenter: BeneDetailPresentationLogic!
    weak var router: BeneDetailRoutingLogic!
    private var worker: BeneDetailWorkerLogic
    
    required init(withWorker worker: BeneDetailWorkerLogic) {
        self.worker = worker
    }
}

extension BeneDetailInteractor: BeneDetailInteractorLogic {

}

