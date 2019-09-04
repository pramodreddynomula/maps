//
//  ExampleViewController.swift
//  MapLocations
//
//  Created by Pramod Reddy Nomula on 27/08/2019.
//  Copyright © 2019 Pramod Reddy Nomula. All rights reserved.
//

import UIKit
import CoreLocation

class ExampleViewController: UIViewController {

    override func viewDidLoad() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(ExampleViewController.printMapsLocation(notification:)), name: NSNotification.Name(rawValue: locationUpdateNotification), object: nil)
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @objc func printMapsLocation(notification: NSNotification){
        
        let location = notification.object as? CLLocation
        let lat = location?.coordinate.latitude
        let lon = location?.coordinate.longitude
        print("notification Triggered");
        print("update location lat\(lat)")
        print("update location lon\(lon)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
