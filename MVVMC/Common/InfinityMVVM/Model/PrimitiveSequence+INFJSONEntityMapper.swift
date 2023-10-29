//
//  PrimitiveSequence+INFJSONEntityMapper.swift
//  MVVMC
//
//  Created by sam on 2023/10/29.
//

import Foundation
import RxSwift
import Moya
import SwiftyJSON

public extension PrimitiveSequence where Trait == SingleTrait, Element == Response {

    func map<E: INFJSONEntity>(to type: E.Type) -> Single<E> {
        flatMap { response -> Single<E> in
            Single.just(try response.map(to: type))
        }
    }
    
    func map<E: INFJSONEntity>(to type: [E.Type]) -> Single<[E]> {
        flatMap { response -> Single<[E]> in
            Single.just(try response.map(to: type))
        }
    }
}

