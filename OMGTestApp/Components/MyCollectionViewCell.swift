//
//  MyCollectionViewCell.swift
//  OMGTestApp
//
//  Created by Magzhan Zhumaly on 05.03.2024.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var backView: UIView!
     
    @IBOutlet weak var backViewWidth: NSLayoutConstraint!
    @IBOutlet weak var backViewHeight: NSLayoutConstraint!
    
    var longPressGesture: UILongPressGestureRecognizer!
    static let id = "MyCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with num: Int) {
        label.text = "\(num)"
        
        backView.layer.borderWidth = 1
        backView.layer.borderColor = UIColor.lightGray.cgColor
        backView.layer.cornerRadius = 5
        
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        contentView.addGestureRecognizer(longPressGesture)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    @objc func handleLongPress(_ longPressGestureRecognizer: UILongPressGestureRecognizer) {
        
        if longPressGestureRecognizer.state == .began {
        
            UIView.animate(withDuration: 0.2) {
                self.backView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }

        } else if longPressGestureRecognizer.state == .cancelled || longPressGestureRecognizer.state == .ended {
       
            UIView.animate(withDuration: 0.2) {
                self.backView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }

        }
        
    }
    
}
