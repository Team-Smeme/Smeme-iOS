//
//  ViewModel.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/04.
//

import Foundation

import RxSwift

protocol ViewModel {

    associatedtype Input
    associatedtype Output

    var disposeBag: DisposeBag { get set }

    func transform(from input: Input) -> Output
    
}
