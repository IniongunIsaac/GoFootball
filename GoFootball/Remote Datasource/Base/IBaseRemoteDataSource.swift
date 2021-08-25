//
//  IBaseRemoteDataSource.swift
//  Spottr
//
//  Created by Isaac Iniongun on 05/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

protocol IBaseRemoteDataSource {
    
    func makeAPIRequest<T: Codable>(responseType: T.Type, url: String, method: HTTPMethod, params: [String : Any]?,
    encoding: ParameterEncoding) -> Observable<T>
    
}
