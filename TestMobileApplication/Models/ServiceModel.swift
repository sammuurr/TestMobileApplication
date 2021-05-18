//
//  ServiceModel.swift
//  TestMobileApplication
//
//  Created by ADMIMN on 18.05.2021.
//

import Foundation

struct ServiceDataModel: Decodable {
    let title: String
    let date: String
    let description: String
}


class ServiceModel {
    
    func getServiceData() -> [ServiceDataModel] {
        
        let file = Bundle.main.url(forResource: "data", withExtension: "json")!
        let fileData = try! Data(contentsOf: file)
        
        let services = try? JSONDecoder().decode([ServiceDataModel].self, from: fileData)
        
        return services!
    }
    
}
