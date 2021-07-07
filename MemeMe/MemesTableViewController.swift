//
//  MemesTableViewController.swift
//  MemeMe
//
//  Created by Bodepudi, Roopkishan on 7/6/21.
//

import UIKit

class MemesTableViewController: CustomViewController {

    // MARK: outlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: controller lifecyle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        super.setupNavigation()
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}

// MARK: Table Datasource lifecyle methods
extension MemesTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableViewCell") {
            let meme = memes[indexPath.item]
            if let imageView = cell.imageView {
                imageView.image = meme.memedImage
                imageView.frame = CGRect(x: imageView.frame.origin.x, y: imageView.frame.origin.y, width: 100, height: 100)
                imageView.contentMode = .scaleAspectFit
            }
            cell.textLabel?.text = "\(meme.topText)...\(meme.bottomText)"
            return cell
        } else {
            return UITableViewCell()
        }
    }
   
}
