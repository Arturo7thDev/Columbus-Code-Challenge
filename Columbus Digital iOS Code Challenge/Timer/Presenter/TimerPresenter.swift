//
//  TimerPresenter.swift
//  Columbus Digital iOS Code Challenge
//
//  Created by Arturo González on 29/04/22.
//

import Foundation

class TimerPresenter{
    private let networkConnection: NetworkConnection
    weak private var timerProtocol: TimerProtocol?
    
    init(networkConnection: NetworkConnection){
        self.networkConnection = networkConnection
    }
    
    func setViewDelegate(timerProtocol: TimerProtocol?){
        self.timerProtocol = timerProtocol
    }
    
    func getTimeData(){
        self.networkConnection.get7TimerData { [weak self] completionResult in
            switch completionResult {
            case .success(let timer):
                self?.timerProtocol?.getData(timer: timer)
            case .failure(let errorMessage):
                self?.timerProtocol?.errorGettingData(errorMessage: errorMessage)
            }
        }

    }
}
