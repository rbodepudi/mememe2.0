//
//  CustomViewController.swift
//  MemeMe
//
//  Created by Bodepudi, Roopkishan on 7/6/21.
//

import UIKit

class CustomViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setupNavigation() {
        self.navigationItem.title = "Sent Memes"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewMeme))
    }

    @objc func addNewMeme() {
        if let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "AddMemeController") as? AddMemeController {
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true, completion: nil)
        }
    }
    
    var memes: [Meme] {
        var memes: [Meme] = []
        if let appDelegate = UIApplication.shared.delegate  as? AppDelegate {
            for meme in appDelegate.memes {
                memes.append(meme)
            }
        }
        return  memes
    }

}
