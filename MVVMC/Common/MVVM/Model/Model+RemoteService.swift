//
//  Model+RemoteService.swift
//  MVVMC
//
//  Created by sam on 2023/10/27.
//

import Foundation
import RxSwift
import Moya
import MoyaSugar
import Moya_SwiftyJSONMapper

private let timeoutInterval: TimeInterval = 30

private let plugins: [PluginType] = [
    NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))
]

extension Model {
    
    func request<TargetType: SugarTargetType, ParseType: JSONEntity>(_ token: TargetType,
                                                                           parseType: ParseType.Type,
                                                                           timeoutInterval: TimeInterval = timeoutInterval,
                                                                           callbackQueue: DispatchQueue? = nil) -> Single<ParseType>  {
        
        let session = MoyaSugarProvider<TargetType>.defaultAlamofireSession()
        session.sessionConfiguration.timeoutIntervalForRequest = timeoutInterval
        let provider = MoyaSugarProvider<TargetType>(session: session, plugins: plugins)
        return provider.rx
            .request(token, callbackQueue: callbackQueue)
            .map(to: parseType)
    }
}
