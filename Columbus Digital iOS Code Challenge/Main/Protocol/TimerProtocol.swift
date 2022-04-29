//
//  TimerProtocol.swift
//  Columbus Digital iOS Code Challenge
//
//  Created by Arturo González on 29/04/22.
//

import Foundation

protocol TimerProtocol: AnyObject {
    func getData(timer: Timer)
    func errorGettingData(errorMessage: String)
}
