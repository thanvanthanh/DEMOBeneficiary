//
//  ListTableViewCell.swift
//  Beneficiary
//
//  Created by iOS Team on 5/12/21.
//  Copyright © 2021 iOS Team. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var checkCircle: UIImageView!
    
    var checkAction : (() -> Void)?
    var isCheckCell : Bool = true
    override func awakeFromNib() {
        super.awakeFromNib()
        checkAction?()
        
        checkCircle.isUserInteractionEnabled = true
        let tapCheckGesture = UITapGestureRecognizer(target: self, action: #selector(onCheck))
        checkCircle.addGestureRecognizer(tapCheckGesture)
    }
    @objc func onCheck() {
        checkCircle.isHidden = !isCheckCell
        checkCircle.image = isCheckCell ? UIImage(named: "checkCircle") : UIImage(named: "")
        isCheckCell = !isCheckCell
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateData(list: BeneModel) {
        titleLabel?.text = list.accountName
        typeLabel.text = list.accountType
        myImageView.image = UIImage(named: list.image )
        checkCircle.image = UIImage(named: list.ischeck ? "checkCircle" : "")
        
    }
    
}
