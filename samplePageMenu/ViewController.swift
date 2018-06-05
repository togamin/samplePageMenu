//
//  ViewController.swift
//  samplePageMenu
//
//  Created by 戸上　祐希 on 2018/06/04.
//  Copyright © 2018年 Togami Yuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    

 
    @IBOutlet weak var myTable: UITableView!
        
    
    var togaminList = ["title1","title2","title3","title4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myTable.delegate = self
        myTable.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return togaminList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for:indexPath)
        cell.textLabel?.text = togaminList[indexPath.row]
        print("セルにテキスト代入")
        return cell
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

