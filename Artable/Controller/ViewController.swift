//
//  ViewController.swift
//  Artable
//
//  Created by Rupin Gupta on 27/01/19.
//  Copyright © 2019 Rupin Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
  
    }

    override func viewDidAppear(_ animated: Bool) {
        let storyBoard = UIStoryboard(name: Storyboards.LoginStoryboard, bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: StoryboardsIDs.LoginVC)
        present(controller, animated: true, completion: nil)
    }
}

