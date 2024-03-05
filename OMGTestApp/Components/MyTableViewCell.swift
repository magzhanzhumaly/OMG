//
//  MyTableViewCell.swift
//  OMGTestApp
//
//  Created by Magzhan Zhumaly on 05.03.2024.
//

import UIKit

class MyTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    static let id = "MyTableViewCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var data = [Int]() 
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        
        collectionView.collectionViewLayout = layout
        
        collectionView.register(MyCollectionViewCell.nib(),
                                forCellWithReuseIdentifier: MyCollectionViewCell.id)

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
    }
     
    
    var timer: Timer?
    func configure(with data: [Int]) {
        self.data = data
        collectionView.reloadData() 
        
        startUpdatingData()
    }
    
    func startUpdatingData() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateData), userInfo: nil, repeats: true)
    }

    @objc func updateData() {
        let i = Int.random(in: 0..<data.count)
        data[i] = Int.random(in: 0..<100)
        
        collectionView.reloadItems(at: [IndexPath(row: i, section: 0)])
    }

    static func nib() -> UINib {
        return UINib(nibName: "MyTableViewCell",
                     bundle: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        if let selectedCell = collectionView.cellForItem(at: indexPath) as? MyCollectionViewCell {
            UIView.animate(withDuration: 0.2, animations: {
                selectedCell.backView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }, completion: { _ in
                UIView.animate(withDuration: 0.2) {
                    selectedCell.backView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }
            })
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.id, for: indexPath) as! MyCollectionViewCell
        
        cell.configure(with: data[indexPath.row])
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: 80, height: 80)
    }
 
}
