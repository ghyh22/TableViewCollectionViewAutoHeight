//
//  ViewController.swift
//  TableViewAutoHeight
//
//  Created by 龚浩 on 16/11/15.
//  Copyright © 2016年 龚浩. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.dataSource = self
            tableView.delegate = self
            let nib = UINib(nibName: "CustomTableViewCell", bundle: Bundle.main)
            tableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
            tableView.estimatedRowHeight = 80
            tableView.rowHeight = UITableViewAutomaticDimension
        }
    }
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            let nib = UINib(nibName: "CustomCollectionViewCell", bundle: Bundle.main)
            collectionView.register(nib, forCellWithReuseIdentifier: "CustomCollectionView")
            collectionView.delegate = self
            collectionView.dataSource = self
            let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.estimatedItemSize = CGSize(width: 20, height: 20)
        }
    }
    @IBOutlet weak var collectionHeightConstraint: NSLayoutConstraint!
    let data = [10, 100, 1000, 100000, 10000000]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews")
        print(tableView.frame, collectionView.frame)
        print(tableView.contentSize, collectionView.contentSize)
        print(scrollView.contentSize)
        //第一次触发时是0,不能直接用
        if collectionView.contentSize.height > 0 {
            collectionHeightConstraint.constant = collectionView.contentSize.height
        }
        contentViewConstraint.constant = tableView.contentSize.height + collectionView.contentSize.height
        print(tableView.frame, collectionView.frame)
        print(scrollView.contentSize)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
        print(tableView.contentSize, tableView.frame)
        print(scrollView.contentSize)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell {
            cell.label.text = "\(arc4random())"
            return cell
        }
        
        let cell = CustomTableViewCell()
        cell.label.text = "\(arc4random())"
        return cell
    }
}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionView", for: indexPath) as? CustomCollectionViewCell {
            let index = indexPath.row % data.count
            cell.data = "\(indexPath.row), \(Int(arc4random()) % data[index])"
            return cell
        }
        let cell = CustomCollectionViewCell()
        cell.data = "\(indexPath.row), \(arc4random())"
        return cell
    }
    
}
