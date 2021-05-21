//
//  BeneDetailViewController.swift
//  Beneficiary
//
//  Created iOS Team on 5/17/21.
//  Copyright © 2021 iOS Team. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol BeneDetailPresentationLogic: class {
    
}
protocol EditBeneDelegate{
    func beneEdited(beneEdited : BeneModel) //
}

// MARK: View
class BeneDetailViewController: UIViewController {
    var interactor: BeneDetailInteractorLogic!
    var router: BeneDetailRoutingLogic!
    var updateEditedBeneDelegate: UpdateBeneFromDetailDelegate!

    @IBOutlet weak var transferType: UILabel!
    // MARK: IBOutlet
    @IBOutlet weak var accountName: UILabel!
    @IBOutlet weak var accountNumber: UILabel!
    
    @IBOutlet weak var beneBank: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var updateButton: UIButton!
    
    @IBOutlet weak var perfromButton: UIButton!
    var bene :BeneModel?
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
        
        
    }
    
    // MARK: Fetch BeneDetail
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        
    }
    
    // MARK: SetupUI
    private func setupView() {
    title = "Chi tiết danh bạ"
        perfromButton.layer.cornerRadius = 7
        updateButton.layer.cornerRadius = 7
        nameTextField.clearButtonMode = .whileEditing
       
        fillData()
    }
    func fillData(){
    if (bene != nil){
        self.accountName.text = bene?.accountName
        self.accountNumber.text = bene?.accountType
        self.beneBank.text = bene?.beneBank
        self.transferType.text = bene?.transferType
        self.nameTextField.text = bene?.accountName
        }
    }
    // MARK: IBAction
    @IBAction func ontapUpdate(_ sender: Any) {
        
    }
    @IBAction func ontapPerform(_ sender: Any) {
        
    }
}

// MARK: Connect View, Interactor, and Presenter
extension BeneDetailViewController: BeneDetailPresentationLogic {
    
}
extension BeneDetailViewController : EditBeneDelegate{
    func beneEdited(beneEdited : BeneModel){
        bene = beneEdited
        updateEditedBeneDelegate.updateBeneFromDetail(brandEdited: beneEdited)
        
    }
}
