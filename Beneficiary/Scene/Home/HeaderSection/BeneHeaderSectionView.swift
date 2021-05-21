//
//  BeneHeaderSectionView.swift
//  Beneficiary
//
//  Created by iOS Team on 5/12/21.
//  Copyright © 2021 iOS Team. All rights reserved.
//

import UIKit

class BeneHeaderSectionView: UITableViewHeaderFooterView {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var imageHeader: UIImageView!
    
    var didTapBlock :(() -> Void)!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func setExpanded(expanded: Bool) {

      if (expanded) {
        imageHeader.transform = CGAffineTransform(rotationAngle: CGFloat.pi)

      } else {
       imageHeader.transform =  CGAffineTransform.identity

      }
    }

    
    @IBAction func didTapButton(_ sender: Any) {
        setExpanded(expanded: true)
        
        reloadInputViews()
        self.didTapBlock()
        
    }
    
    func updateData(list: BeneModel) {
        titleLabel?.text = list.accountType
    }
}
