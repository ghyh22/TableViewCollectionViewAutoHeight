//
//  CollectionViewController.swift
//  TableViewAutoHeight
//
//  Created by 龚浩 on 16/11/15.
//  Copyright © 2016年 龚浩. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            let nib = UINib(nibName: "CustomCollectionViewCell", bundle: Bundle.main)
            collectionView.register(nib, forCellWithReuseIdentifier: "CustomCollectionView")
            collectionView.delegate = self
            collectionView.dataSource = self
            let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.estimatedItemSize = CGSize(width: 20, height: 20)
            let headerNib = UINib(nibName: "CollectionViewHeader", bundle: Bundle.main)
            collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "CollectionViewHeader")
            layout.headerReferenceSize = CGSize(width: 50, height: 50)
        }
    }
    @IBOutlet weak var collectionHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.dataSource = self
            tableView.delegate = self
            let nib = UINib(nibName: "CustomCell", bundle: Bundle.main)
            tableView.register(nib, forCellReuseIdentifier: "CustomCell")
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableCell")
            tableView.estimatedRowHeight = 180
            tableView.rowHeight = UITableViewAutomaticDimension
        }
    }
    
    override func viewDidLayoutSubviews() {
        print(type(of: self))
        print(collectionView.frame, tableView.frame)
        print(collectionView.contentSize, tableView.contentSize)
        if collectionView.contentSize.height > 0 {
            collectionHeightConstraint.constant = collectionView.contentSize.height
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CollectionViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionView", for: indexPath) as? CustomCollectionViewCell {
            cell.data = "\(indexPath), \(arc4random())"
            return cell
        }
        let cell = CustomCollectionViewCell()
        cell.data = "\(indexPath), \(arc4random())"
        return cell
    }
}

extension CollectionViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        cell.textLabel?.text = "\(arc4random())"
        return cell
    }
}
