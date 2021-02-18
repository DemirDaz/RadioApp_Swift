//
//  SampleTableCell.swift
//  ispitDizajn
//
//  Created by Demir Dazdarevic on 17.2.21..
//

import UIKit

class SampleTableCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet private weak var selectedView: UIView!
    @IBOutlet private weak var btn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //btn.currentImage = selected 
        selectedView.backgroundColor = selected ? UIColor.white : UIColor.clear
        titleLabel.textColor = selected ? UIColor.white : UIColor.white
    }
}
