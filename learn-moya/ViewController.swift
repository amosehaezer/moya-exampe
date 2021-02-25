//
//  ViewController.swift
//  learn-moya
//
//  Created by Amos Ebenhaezer on 28/01/21.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

//    var dataPlaces: WrapperPlacesModel?
    var dataPlaces: [PlaceModel]?
    
    var place: [PlaceModel]?
    var pName = [String]()
    
    var isReload = false
    
    
    var locationManager: CLLocationManager?
    
    @IBOutlet weak var placeCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        placeCollection.dataSource = self
        placeCollection.delegate = self
        placeCollection.register(UINib(nibName: "RecomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "recomCell")
        
//        loadPlace()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()

        view.backgroundColor = .gray
        
        
//        loadNetworkDataPlace()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    // do stuff
                    print("dibolehin nih")
                }
            }
        }
    }
    
    
    func loadPlace() {
        if let dataPlaceRetrieved = place {
            if !isReload {
                if dataPlaceRetrieved.count != 0 {
                    print("sudah diload")
                } else {
                    loadNetworkDataPlace()
                }
            } else {
                loadNetworkDataPlace()
            }
        }
    }
    
    func loadNetworkDataPlace() {
        XNetworkModel.shared.fetchPlaces(sender: self) { [self] (dataResponse) in
            dataPlaces = dataResponse?.data ?? []
            print(dataPlaces)
            placeCollection.reloadData()
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(dataPlaces?.count ?? 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = placeCollection.dequeueReusableCell(withReuseIdentifier: "recomCell", for: indexPath) as! RecomCollectionViewCell
        
        cell.nameLabel.text = dataPlaces?[indexPath.row].pname
//        cell.priceLabel.text = dataPlaces?[indexPath.row].
        
        return cell
    }
    
    
}

