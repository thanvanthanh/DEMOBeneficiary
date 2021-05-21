//
//  BeneficiaryInteractor.swift
//  Beneficiary
//
//  Created iOS Team on 5/11/21.
//  Copyright © 2021 iOS Team. All rights reserved.
//
//

/// Beneficiary Module Interactor Protocol
protocol BeneficiaryInteractorLogic {
    func fetchList(searchText: String)
    }


/// Beneficiary Module Interactor
class BeneficiaryInteractor {
    weak var presenter: BeneficiaryPresentationLogic!
    weak var router: BeneficiaryRoutingLogic!
    private var worker: BeneficiaryWorkerLogic
    
    required init(withWorker worker: BeneficiaryWorkerLogic) {
        self.worker = worker
    }
}

extension BeneficiaryInteractor: BeneficiaryInteractorLogic {
    
    func fetchList(searchText: String) {
        let results = createList()
        
        presenter.show(list: results)
    }

    func createList() -> [BeneEntity] {
        var results: [BeneEntity] = []
        
        results.append(BeneEntity(title: "Chuyển tiền nội bộ", isExpand: false, listBene: lits1()))
        results.append(BeneEntity(title: "Chuyển tiền nhanh 24/7 qua tài khoản", isExpand: false, listBene: list2()))
        results.append(BeneEntity(title: "Chuyển tiền nhanh 24/7 qua thẻ" , isExpand: false, listBene: list3()))
       
        
        return results
    }
    func lits1() -> [BeneModel]{
        var results1 : [BeneModel] = []
        
        results1.append(BeneModel(transferType: "Chuyển tiền nội bộ", accountName: "Anh Thang", accountType: "12345678890", beneBank: "Co-opBank", image: "group17534", ischeck: false))
        results1.append(BeneModel(transferType: "Chuyển tiền nội bộ", accountName: "Anh Tuan Coop", accountType: "12345678890", beneBank: "Co-opBank", image: "group17534", ischeck: false))
        results1.append(BeneModel(transferType: "Chuyển tiền nội bộ", accountName: "Anh Van My", accountType: "12345678823290", beneBank: "Co-opBank", image: "group17534", ischeck: false))

        return results1
    }
    
    func list2() -> [BeneModel] {
    
        var results2 :[BeneModel] = []
        
        results2.append(BeneModel(transferType: "Chuyển tiền nhanh 24/7 qua tài khoản", accountName: "Thanh", accountType: "123455", beneBank: "Co-opBank", image: "group17534", ischeck: false))
        results2.append(BeneModel(transferType: "Chuyển tiền nhanh 24/7 qua tài khoản", accountName: "Nam", accountType: "5543434", beneBank: "ViettinBank", image: "group6638", ischeck: false))

        return results2
    }
    func list3() -> [BeneModel]{
        var results3 :[BeneModel] = []
        
        results3.append(BeneModel(transferType: "Chuyển tiền nhanh 24/7 qua thẻ", accountName: "Minh", accountType: "342342332623", beneBank: "TechcomBank", image: "group6638-1", ischeck: false))
        results3.append(BeneModel(transferType: "Chuyển tiền nhanh 24/7 qua thẻ", accountName: "Anh Bình", accountType: "575754334545", beneBank: "ViettinBank", image: "group6638", ischeck: false))
        results3.append(BeneModel(transferType: "Chuyển tiền nhanh 24/7 qua thẻ", accountName: "Chị Huyền", accountType: "66544434", beneBank: "TechcomBank", image: "group6638-1", ischeck: false))
        
        return results3

    }
}

