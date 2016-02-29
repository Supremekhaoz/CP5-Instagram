//
//  photoCell.swift
//  CP6-Instagram(Parse)
//
//  Created by Luis Liz on 2/28/16.
//  Copyright © 2016 Luis Liz. All rights reserved.
//

import UIKit

class photoCell: UITableViewCell {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
