//
//  NetworkClient.swift
//  MVVMC
//
//  Created by sam on 2023/10/27.
//

import RxSwift
import Moya
import MoyaSugar
import Moya_SwiftyJSONMapper

public final class NetworkClient {
    
    public var timeoutInterval: TimeInterval = 30
    
    public var plugins: [PluginType] = [
        NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))
    ]
    
    public static let shared = NetworkClient()
    
    private init() {

    }
    
    public func request<TargetType: SugarTargetType, ParseType: INFJSONEntity>(_ token: TargetType,
                                                                               parseType: ParseType.Type,
                                                                               callbackQueue: DispatchQueue? = nil) -> Single<ParseType>  {
        makeProvider().rx
            .request(token, callbackQueue: callbackQueue)
            .map(to: parseType)
    }
    
    public func request<TargetType: SugarTargetType, ParseType: INFJSONEntity>(_ token: TargetType,
                                                                               parseType: [ParseType.Type],
                                                                               callbackQueue: DispatchQueue? = nil) -> Single<[ParseType]>  {
        makeProvider().rx
            .request(token, callbackQueue: callbackQueue)
            .map(to: parseType)
    }
    
    private func makeProvider<TargetType: SugarTargetType>() -> MoyaSugarProvider<TargetType> {
        let session = MoyaSugarProvider<TargetType>.defaultAlamofireSession()
        session.sessionConfiguration.timeoutIntervalForRequest = timeoutInterval
        return MoyaSugarProvider<TargetType>(session: session, plugins: plugins)
    }
}
