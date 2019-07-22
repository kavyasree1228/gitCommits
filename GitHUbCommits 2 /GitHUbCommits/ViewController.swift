//
//  ViewController.swift
//  GitHUbCommits
//
//  Created by admin on 7/22/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import SpringIndicator

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var objGitHubModelArray: [GithubModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        retrieveCommits(repoId: "2126244")
    }

    func retrieveCommits(repoId: String) {
        let session = URLSession(configuration: .default)
        if let url = URL(string: "https://api.github.com/repositories/\(repoId)/commits") {
            
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            self.view.showLoading()
            print(url)
            session.dataTask(with: urlRequest) { (data, response, error) in
                self.view.hideLoading()
                if let err = error {
                    let alertController : UIAlertController = UIAlertController(title: " ", message: err.localizedDescription, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    DispatchQueue.main.async {
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
                guard let data = data else {
                    return
                }
                do {
                    
                    let array = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! NSArray
                    let gitHubModelArray = GithubModel.modelsFromDictionaryArray(array: array)
                    self.objGitHubModelArray = gitHubModelArray
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    let alertController : UIAlertController = UIAlertController(title: " ", message: "response error", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    DispatchQueue.main.async {
                        self.present(alertController, animated: true, completion: nil)
                    }

                }
                
            }.resume()
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objGitHubModelArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let objGithubElement = objGitHubModelArray?[indexPath.row] {
            var cell = tableView.dequeueReusableCell(withIdentifier: "cellidentifier")
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellidentifier")
            }
            cell?.textLabel?.text = objGithubElement.commit?.message
            if let name = objGithubElement.commit?.committer?.name,  let  email = objGithubElement.commit?.committer?.email, let sha = objGithubElement.sha {
                cell?.detailTextLabel?.text = "Name: \(name),\nEmail: \(email)\nCommit Id: \(sha)"
            }
            
            cell?.detailTextLabel?.numberOfLines = 0
            cell?.textLabel?.numberOfLines = 0
            return cell ?? UITableViewCell()
        }
        return UITableViewCell()
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension UIView {
    
    var indicatorViewTag: Int {
        get {
            return 1212
        }
    }
    
    func showLoading(withBackground: Bool = true, color: UIColor = UIColor.red) {
        
        self.hideLoading()
        
        let viewWidth: CGFloat = 90.0
        let indicatorWidth: CGFloat = 60.0
        
        let backgroundView = UIView(frame: CGRect(x: (self.frame.size.width - viewWidth)/2, y: (self.frame.size.height - viewWidth)/2, width: viewWidth, height: viewWidth))
        backgroundView.backgroundColor = UIColor.gray
        
        //        backgroundView.center = self.center
        backgroundView.layer.cornerRadius = 5.0
        backgroundView.tag = indicatorViewTag
        
        let padding = (viewWidth - indicatorWidth)/2
        let indicator = SpringIndicator(frame: CGRect(x: padding, y: padding, width: indicatorWidth, height: indicatorWidth))
        indicator.lineColor = color
        
        DispatchQueue.main.async {
            self.isUserInteractionEnabled = false
            backgroundView.addSubview(indicator)
            self.addSubview(backgroundView)
            indicator.start()
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.isUserInteractionEnabled = true
            let indicatorView = self.viewWithTag(self.indicatorViewTag)
            indicatorView?.removeFromSuperview()
        }
    }
}

