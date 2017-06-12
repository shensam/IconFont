//
//  ViewController.swift
//  IconFont
//
//  Created by ios on 12/06/2017.
//  Copyright © 2017 midmirror. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let icons = [IconDemo.alipay, IconDemo.android, IconDemo.apple, IconDemo.qq, IconDemo.safari, IconDemo.wechat, IconDemo.weibo]
    
    lazy var tableView: UITableView = {
        let table = UITableView.init(frame: self.view.bounds, style: .plain)
        table.delegate = self
        table.dataSource = self
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "IconFont Demo"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellIden")
        view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIden", for: indexPath)
        
        let image = IconFont.init(code: icons[indexPath.row], size: 25, fontName: "IconDemo", color: .gray).imageSquare(25)
        cell.imageView?.image = image
        return cell
    }
}
