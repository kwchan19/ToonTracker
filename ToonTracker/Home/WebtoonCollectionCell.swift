//
//  WebtoonCollectionCell.swift
//  ToonTracker
//
//  Created by Kevin Chan on 2022-04-03.
//

import UIKit

class WebtoonCollectionCell: UICollectionViewCell {
    @IBOutlet weak var webtoonTitle: UILabel!
    @IBOutlet weak var webtoonImage: UIButton!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        webtoonTitle.text = nil
        webtoonImage.imageView!.image = nil
        webtoonImage.setBackgroundImage(nil, for: .normal)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        webtoonTitle.layer.borderColor = UIColor.systemGray4.cgColor
        webtoonTitle.layer.borderWidth = 1
        webtoonImage.roundedButton()
        
        webtoonTitle.clipsToBounds = true
        webtoonTitle.layer.cornerRadius = 6
        webtoonTitle.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
    }
    
}
