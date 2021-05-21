//
//  BeneficiaryViewController.swift
//  Beneficiary
//
//  Created iOS Team on 5/11/21.
//  Copyright © 2021 iOS Team. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol BeneficiaryPresentationLogic: class {
    func show(list: [BeneEntity])
    func show(error: Error)
}
protocol UpdateBeneFromDetailDelegate {
    func updateBeneFromDetail(brandEdited: BeneModel)
}

// MARK: View
class BeneficiaryViewController: UIViewController {
    var interactor: BeneficiaryInteractorLogic!
    var router: BeneficiaryRoutingLogic!
    // MARK: IBOutlet
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var notificationsLabel: UILabel!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var delNoitice: UIView!
    
    @IBOutlet weak var viewDelete: UIView!
    var indexSelected: Int!
    var rightBarButton = UIBarButtonItem()
    var isDelete :Bool = false
    var isChecked = [Bool]()
    var beneficiaryEntity : [BeneEntity] = []{
        didSet{
            tableView.reloadData()
        }
    }
   
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
        
    }
    
    @objc func delTapped() {
        delNoitice.isHidden = !isDelete
        rightBarButton.image = isDelete ? UIImage(named: "cancelLogin") : UIImage(named: "icBinBlue")
         isDelete = !isDelete
    }
    
    // MARK: Fetch Beneficiary
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        interactor.fetchList(searchText: "")
    }
    
    // MARK: SetupUI
    private func setupView() {
        title = "Danh bạ thụ hưởng"
        notificationsLabel.text = "Quý khách chưa có danh bạ thụ hưởng"
        isDelete = true
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.00, green: 0.16, blue: 0.41, alpha: 1.00)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .white

         rightBarButton = UIBarButtonItem(image: UIImage(named: "icBinBlue"), style: .plain, target: self, action: #selector(delTapped))
        rightBarButton.tintColor = .white
        navigationItem.rightBarButtonItems = [rightBarButton]
        
        searchTextField.clearButtonMode = .whileEditing
        UINavigationBar.appearance().backgroundColor = UIColor(red: 0.00, green: 0.16, blue: 0.41, alpha: 1.00)
        tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "ListTableViewCell")
        tableView.register(UINib(nibName: "BeneHeaderSectionView", bundle: nil), forHeaderFooterViewReuseIdentifier: "BeneHeaderSectionView")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .white
        tableView.showsVerticalScrollIndicator = false

        searchView.layer.cornerRadius = searchView.bounds.height/2
        
        delNoitice.layer.cornerRadius = 5
        delNoitice.layer.shadowColor = UIColor.black.cgColor
        delNoitice.layer.shadowOpacity = 0.5
        delNoitice.layer.shadowOffset = CGSize.zero
        
        }
    
    func deleteItem (){
        var listBene : [BeneEntity] = []
        for bene in beneficiaryEntity {
            var benefic = bene
            for object in bene.listBene {
                if (!object.ischeck) {
                    benefic.listBene.append(object)
                }
            }
            listBene.append(benefic)
        }
        beneficiaryEntity = listBene
        
        print(listBene)
        
        print(listBene)
    }
    
    @IBAction func addNewBene(_ sender: Any) {
        let addVC = AddNewBeneConfigurator.viewcontroller()
        navigationController?.pushViewController(addVC, animated: true)

    }
    // MARK: IBAction
}
// MARK: Connect View, Interactor, and Presenter
extension BeneficiaryViewController: BeneficiaryPresentationLogic {
    func show(list: [BeneEntity]) {
        beneficiaryEntity = list
        tableView.reloadData()
    }
    func show(error: Error) {
        print(error)
    }
    
    
}
// MARK: UITableViewDataSource
extension BeneficiaryViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return beneficiaryEntity.count
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return beneficiaryEntity[section].isExpand ? beneficiaryEntity[section].listBene.count :0
            
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell else {return UITableViewCell()}
        
        let dataCell = beneficiaryEntity[indexPath.section].listBene
        let data = dataCell[indexPath.row]
        cell.updateData(list: data)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isDelete {
            var dataCell = beneficiaryEntity[indexPath.section].listBene
            
            let data = dataCell[indexPath.row]
            
            dataCell[indexPath.row].ischeck = true
            
            router.navigateToDetail(data)
            
        }else{
            beneficiaryEntity[indexPath.section].listBene[indexPath.row].ischeck = true
            indexSelected = indexPath.row
            
//            self.deleteItem()
            
            if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark{
                tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
            }else{
                tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark

            }
        }
       
        
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header: BeneHeaderSectionView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "BeneHeaderSectionView") as? BeneHeaderSectionView  else {return UIView()}
        
        header.titleLabel.text = beneficiaryEntity[section].title
        header.setExpanded(expanded: self.beneficiaryEntity[section].isExpand)
        header.didTapBlock = { [weak self] in
            guard let wSelf =  self else {return}
            if wSelf.beneficiaryEntity[section].isExpand {
                wSelf.beneficiaryEntity[section].isExpand = false
            }else{
                wSelf.beneficiaryEntity[section].isExpand = true
            }
            let sectionIndex = IndexSet(integer: 0)
            tableView.reloadSections(sectionIndex, with: .none)
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 68
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
}

extension BeneficiaryViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
}
extension BeneficiaryViewController : UpdateBeneFromDetailDelegate {
    func updateBeneFromDetail(brandEdited: BeneModel) {
        
    }
}
