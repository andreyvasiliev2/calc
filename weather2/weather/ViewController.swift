//
//  ViewController.swift
//  weather
//
//  Created by Гость on 20.05.2022.
//
import UIKit
import CoreLocation
class ViewController: UIViewController {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var porUslov: UILabel!
    @IBOutlet weak var varTemp: UILabel!
    @IBOutlet weak var pogIcon: UIImageView!
    
    let locationManager = CLLocationManager()
    var weatherData = WeatherData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startLocationManager()
    }

    func startLocationManager() {
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.pausesLocationUpdatesAutomatically = false
            locationManager.startUpdatingLocation()
        }
    }
        func updateView() {
            cityName.text = weatherData.name
            porUslov.text = DataSource.weatherIDs[weatherData.weather[0].id]
            varTemp.text = weatherData.main.temp.description
            pogIcon.image = UIImage(named: weatherData.weather[0].icon)
        }
   
    func updateWeatherInfo(latitude: Double, longtitude: Double) {
        let session = URLSession.shared
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude.description)&lon=\(latitude.description)&units=metric&land=London&appid=1cb629026b3ae3d09ff0fdaa84385a56")!
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
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            updateWeatherInfo(latitude: lastLocation.coordinate.latitude, longtitude: lastLocation.coordinate.longitude)
        }
    }
}
