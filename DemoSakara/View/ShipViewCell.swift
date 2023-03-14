//
//  ShipViewCell.swift
//  DemoSakara
//
//  Created by Prashanth reddy on 3/14/23.
//

import UIKit

class ShipViewCell: UITableViewCell {

    @IBOutlet weak var shipLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = 12.0
        containerView.backgroundColor = .cyan.withAlphaComponent(0.6)
    }
    
    func configureView(_ shipName: String) {
        shipLabel.text = shipName
    }
}
