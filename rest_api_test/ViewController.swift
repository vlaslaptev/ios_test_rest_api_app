//
//  ViewController.swift
//  rest_api_test
//
//  Created by v.laptev on 22.03.2018.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var labelTest: UILabel!
    
    @IBAction func tapBtn(_ sender: Any) {
        guard var url = URL(string: "https://whatthecommit.com") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                self.labelTest.text = "ok"
                print(response)
            }
            }.resume()
    }
}

