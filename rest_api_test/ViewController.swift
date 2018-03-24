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

    @IBOutlet weak var btcPrice: UILabel!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapBtn(_ sender: Any) {
        guard var url =
            URL(string: "https://api.coinmarketcap.com/v1/ticker/?limit=1")
            else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response);
            }
            guard let data = data else {return}
            print(data)
            do {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                if let root = json as? [Any] {
                    if let dictionary = root.first as? [String: Any] {
                        self.btcPrice.text = dictionary["price_usd"] as! String
                    }
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    @IBAction func tapPost(_ sender: UIButton) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        let params = ["username": "ivan", "message": "Hello"]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options:[]) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            guard let data = data else {return}
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print (error)
            }
        }.resume()
    }

}



















