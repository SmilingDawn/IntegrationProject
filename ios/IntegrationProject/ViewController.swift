//
//  ViewController.swift
//  IntegrationProject
//
//  Created by jongmin.lee on 2022/08/04.
//

import UIKit
import React

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }


  @IBAction func moveReactNativeButtonTapped(_ sender: Any) {
    let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")
//      let mockData:NSDictionary = ["scores":
//          [
//              ["name":"Alex", "value":"42"],
//              ["name":"Joel", "value":"10"]
//          ]
//      ]

      let rootView = RCTRootView(
          bundleURL: jsCodeLocation!,
          moduleName: "IntegrationProject",
          initialProperties: nil,
          launchOptions: nil
      )
      let vc = UIViewController()
      vc.view = rootView
      self.present(vc, animated: true, completion: nil)
  }
}

