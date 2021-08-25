//
//  BaseRemoteDataSourceImpl.swift
//  Spottr
//
//  Created by Isaac Iniongun on 05/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift

class BaseRemoteDataSourceImpl: IBaseRemoteDataSource {
    
    fileprivate let disposeBag = DisposeBag()
    fileprivate let manager = Session.default
    
    /// Function to make API Requests
    /// - Parameters:
    ///   - responseType: Generic Type `T` denoting the type of value to be returned
    ///   - url: URL of request to be made
    ///   - method: HTTP Method of request. Possible values are: get, post, put and delete. Defaults to get.
    ///   - params: Request Paramaters. A dictionary of type `String:Any`
    ///   - encoding: `ParameterEncoding` of the Request. Defaults to `JSONEncoding.default`
    /// - Returns: an `Observable<T>` where `T` conforms to the `Codable` Protocol
    func makeAPIRequest<T>(responseType: T.Type, url: String, method: HTTPMethod = .get, params: [String : Any]? = nil, encoding: ParameterEncoding = JSONEncoding.default) -> Observable<T> where T : Decodable, T : Encodable {
        
        printIfDebugOrStagingScheme("Request URL: \(url)", .info)
        printIfDebugOrStagingScheme("Request Parameters:\n \(String(describing: params))", .info)
        
        return manager.rx.request(method, url, parameters: params, encoding: encoding, headers: [.init(name: "X-Auth-Token", value: AppConstants.Keys.AUTH_TOKEN)])
            .validate(statusCode: 200 ..< 499)
            .debug()
            .responseString()
            .flatMap { (_, responseString) -> Observable<T> in
                do {
                    printIfDebugOrStagingScheme(responseString, .info)
                    
                    //map the result of `responseString` above to the `responseType`
                    let requestResponse = try responseType.map(from: responseString)!
                    //return result in `requestResponse` above in the `successHandler`
                    return Observable.just(requestResponse)
                    
                } catch let error {
                    printIfDebugOrStagingScheme(error)
                    throw error
                }
        }
        .observeOn(MainScheduler.instance)
        
    }
    
}
