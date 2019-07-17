//
//  AppDelegate.swift
//  Pilgrim Sample
//
//  Created by Gareth Jones on 7/12/19.
//  Copyright © 2019 Gareth Jones. All rights reserved.
//

import UIKit
import Pilgrim

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        // Start Pilgrim
        // Please ensure you add your consumerKey and consumerSecret here from your developer console.
        PilgrimManager.shared().configure(withConsumerKey: "",
                                          secret: "",
                                          delegate: self,
                                          completion: nil)
        // Enable Debugging
        PilgrimManager.shared().isDebugLogsEnabled = true
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

extension AppDelegate : PilgrimManagerDelegate {
    // Primary visit handler:
    func pilgrimManager(_ pilgrimManager: PilgrimManager, handle visit: Visit) {
        // Process the visit however you'd like:
        print("\(visit.hasDeparted ? "Departure from" : "Arrival at") \(visit.venue != nil ? visit.venue!.name : "Unknown venue."). Added a Pilgrim visit at: \(visit.displayName)")
    }
    
    // Optional: If visit occurred without network connectivity
    func pilgrimManager(_ pilgrimManager: PilgrimManager, handleBackfill visit: Pilgrim.Visit) {
        // Process the visit however you'd like:
        print("Backfill \(visit.hasDeparted ? "departure from" : "arrival at") \(visit.venue != nil ? visit.venue!.name : "Unknown venue."). Added a Pilgrim backfill visit at: \(visit.displayName)")
    }
    
    // Optional: If visit occurred by triggering a geofence
    func pilgrimManager(_ pilgrimManager: PilgrimManager, handle geofenceEvents: [GeofenceEvent]) {
        // Process the geofence events however you'd like:
        geofenceEvents.forEach { geofenceEvent in
            print(geofenceEvent)
        }
    }
}

