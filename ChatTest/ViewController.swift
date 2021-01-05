//
//  ViewController.swift
//  ChatTest
//
//  Created by Devesh Tyagi on 18/12/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToChatView(_ sender: Any) {
        let layout = UICollectionViewFlowLayout()
        let controller = ChatLogController(collectionViewLayout: layout)
        controller.modalPresentationStyle = .fullScreen
      present(controller, animated: true, completion: nil)
    }
    
}

