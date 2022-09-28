//
//  BusinessCardTableViewController.swift
//  BusinessCardManager
//
//  Created by 倪如霖 on 2022/9/29.
//

import UIKit

class BusinessCardTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dict = Dictionary<AnyHashable, CGFloat>()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "BusinessCardTableViewCell", bundle: nil), forCellReuseIdentifier: "BusinessCardTableViewCell")
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension BusinessCardTableViewController: UITableViewDataSource, UITableViewDelegate{
    
    //每一section個別的列數
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

       return 20
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    
    }
        
        
    //定義哪個行要用何種cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessCardTableViewCell", for: indexPath) as! BusinessCardTableViewCell
        
        return cell
        
        
    }
    //點擊後跳轉到詳細訊息
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
            
    }
            
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //記錄高度，刪除才不會亂跑
        dict[indexPath] = cell.frame.size.height
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return dict[indexPath] ?? UITableView.automaticDimension
        
    }
    

    //設定header和footer的高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 8
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
          let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 8))
        headerView.backgroundColor = .clear
          return headerView
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?{
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 8))
        footerView.backgroundColor = .clear
        return footerView
    }
}
