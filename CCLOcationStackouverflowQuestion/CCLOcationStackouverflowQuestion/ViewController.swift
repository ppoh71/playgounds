//
//  ViewController.swift
//  CCLOcationStackouverflowQuestion
//
//  Created by Peter Pohlmann on 24.06.16.
//  Copyright © 2016 Peter Pohlmann. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, MKMapViewDelegate {

        
        @IBOutlet weak var map: MKMapView!
        @IBOutlet weak var latField: UITextField!
        @IBOutlet weak var lngField: UITextField!
        @IBOutlet weak var locateBtn: UIButton!
        @IBOutlet weak var saveBtn: UIButton!
        
        let regionRadius: CLLocationDistance = 500
        
        let locationManager = CLLocationManager()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            map.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            
            locationManager.startUpdatingLocation()
        }
        
        override func viewDidAppear(animated: Bool) {
            locationAuthStatus()
        }
        
        func locationAuthStatus() {
            if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
                map.showsUserLocation = true
            } else {
                locationManager.requestWhenInUseAuthorization()
            }
        }
        
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 1, regionRadius * 1)
            map.setRegion(coordinateRegion, animated: true)
        }
        
        func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {

            if let loc = userLocation.location {
                centerMapOnLocation(loc)
           
                 self.latField.text = "\(loc.coordinate.latitude)"
                 self.lngField.text = "\(loc.coordinate.longitude)"
                
                print("updatin loc")
            
            }

        }
        
    }

