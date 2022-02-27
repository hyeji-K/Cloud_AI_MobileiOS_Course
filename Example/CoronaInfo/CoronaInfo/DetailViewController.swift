//
//  DetailViewController.swift
//  CoronaInfo
//
//  Created by Khyeji on 2021/10/14.
//

import UIKit
import Alamofire
import SwiftyJSON

class DetailViewController: UIViewController {
    var hospitals: [String:Any]?
    let apiKey = "KakaoAK "
//    var lat: String?
//    var lon: String?
    let mapView: MTMapView = MTMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let hospital = self.hospitals,
              let query = hospital["orgZipaddr"] as? String
        else { return }
        
        getCoord(query: query)
        
        // mapView
        // 화면 안의 뷰는 뷰디드로드가 실행된 다음에 쓸 수가 있음
        mapView.frame = self.view.frame
        self.view.addSubview(mapView)       // 지도가 뜸
    }
    
    func getCoord(query: String) {
        let strURL = "https://dapi.kakao.com/v2/local/search/address.json"
        let params: Parameters = ["query": query]
        let headers: HTTPHeaders = ["Authorization": apiKey]
        
        let alamo = AF.request(strURL, method: .get, parameters: params, headers: headers)
        alamo.responseJSON { response in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                let lat = json["documents"].arrayValue[0]["y"].doubleValue
                let lon = json["documents"].arrayValue[0]["x"].doubleValue
                
//                print(self.lat, self.lon)
                
                // mapView
                let pointGeo = MTMapPointGeo(latitude: lat, longitude: lon)
                let point = MTMapPoint(geoCoord: pointGeo)
                
                self.mapView.setMapCenter(point, animated: true) // 센터 지정
                self.mapView.setZoomLevel(-1, animated: true)
                
                // 핀 만들어줌
                let item = MTMapPOIItem()
                if let hospitals = self.hospitals {
                    item.itemName = hospitals["orgnm"] as? String
                }
                item.markerType = .redPin
                item.mapPoint = point
                
                // 만든 핀을 맵에 추가
                self.mapView.add(item)
                
            case .failure(let error):
                if let desc = error.errorDescription {
                    print(desc)
                }
            }
        }
    }
}
