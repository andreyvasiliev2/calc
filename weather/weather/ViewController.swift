//
//  ViewController.swift
//  weather
//
//  Created by Гость on 20.05.2022.
//
import UIKit
import CoreLocation
class ViewController: UIViewController {
    @IBOutlet weak var cityname: UILabel!
    @IBOutlet weak var Uslov: UILabel!
    @IBOutlet weak var Temp: UILabel!
    @IBOutlet weak var Icon: UIImageView!
    
    let locationManager = CLLocationManager()
    var weatherData = WeatherData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startLocationManager()
    }

    func startLocationManager(){
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.pausesLocationUpdatesAutomatically = false
            locationManager.stopUpdatingLocation()
        }
        func updateView() {
            cityname.text = weatherData.name
            Uslov.text = DataSource.weatherIDs[weatherData.weather[0].id]
            Temp.text =
        }
   }
   func updateWatherInfo(latitube: Double, longtitube: Double) {
       let session = URLSession.shared
       let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitube.description)&lon=125&units=metric&lang=ru&appid=1cb629026b3ae3d09ff0fdaa84385a56")!
       let task = session.dataTask(with: url) { (data, response, error) in
           guard error == nil else {
               print("DataTask error: \(error!.localizedDescription)")
               return
               }
           do {
               self.weatherData = try JSONDecoder().decode(WeatherData.self, from: data!)
               DispatchQueue.main.async {
                   self.updateView()
               }
           }catch {
               print(error.localizedDescription)
           }
       }
       task.resume()
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            updateWatherInfo(latitube: lastLocation.coordinate.latitude, longtitube: lastLocation.coordinate.longitude)
        }
    }
}
