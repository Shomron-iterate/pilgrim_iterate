//
//  ViewController.swift
//  Pilgrim Sample
//
//  Created by Gareth Jones on 7/12/19.
//  Copyright © 2019 Gareth Jones. All rights reserved.
//

import UIKit
import CoreLocation
import Pilgrim

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        enableLocationServices()
    }
    
    func enableLocationServices() {
        locationManager.delegate = self
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            // Request when-in-use authorization initially
            locationManager.requestWhenInUseAuthorization()
            break
            
        case .restricted, .denied:
            // Disable location features
            
            break
            
        case .authorizedWhenInUse:
            // Enable basic location features
            
            break
            
        case .authorizedAlways:
            // Enable any of your app's location features
            PilgrimManager.shared().start()
            break
        @unknown default:
            // In future releases of iOS there may be other values.
            
            PilgrimManager.shared().start()
            break
        }
    }
    @IBAction func fireTestVisit(_ sender: Any) {
       // Fire Pilgrim Test Visit
        PilgrimManager.shared().visitTester?.fireTestVisit(location: CLLocation(latitude: 37.7904311, longitude: -122.4066613))
    }
    @IBAction func openDebugModal(_ sender: Any) {
        // Open pilgrim debug
        PilgrimManager.shared().presentDebugViewController(parentViewController: self)

    }
}
