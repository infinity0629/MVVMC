//
//  NetworkClient.swift
//  MVVMC
//
//  Created by sam on 2023/10/26.
//

import Foundation
import Then
import RxSwift
import Moya
import MoyaSugar

final class NetworkClient {
    
    static let shared = NetworkClient()
    
    private static let timeoutInterval: TimeInterval = 30
    
    private let plugins: [PluginType] = [
        NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))
    ]
    
    private init() {}
    
    func request<Target: SugarTargetType>(_ token: Target, timeoutInterval: TimeInterval = timeoutInterval, callbackQueue: DispatchQueue? = nil) -> Single<Response> {
        makeProvider(timeoutInterval: timeoutInterval).rx.request(token, callbackQueue: callbackQueue)
    }
    
    func requestWithProgress<Target: SugarTargetType>(_ token: Target, timeoutInterval: TimeInterval = timeoutInterval, callbackQueue: DispatchQueue? = nil) -> Observable<ProgressResponse> {
        makeProvider(timeoutInterval: timeoutInterval).rx.requestWithProgress(token, callbackQueue: callbackQueue)
    }
    
    private func makeProvider<Target: SugarTargetType>(timeoutInterval: TimeInterval) -> MoyaSugarProvider<Target> {
        let session = MoyaSugarProvider<Target>.defaultAlamofireSession()
        session.sessionConfiguration.timeoutIntervalForRequest = timeoutInterval
        return MoyaSugarProvider<Target>(session: session, plugins: plugins)
    }
}
