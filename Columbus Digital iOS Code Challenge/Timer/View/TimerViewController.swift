//
//  TimerViewController.swift
//  Columbus Digital iOS Code Challenge
//
//  Created by Arturo González on 29/04/22.
//

import UIKit
import SwiftUI

class TimerViewController: UIViewController {

    @IBOutlet weak var timerTableView: UITableView!
    
    private let timerPresenter = TimerPresenter(networkConnection: NetworkConnection())
    var timerArray = Timer(product: nil, timerInit: nil, dataseries: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timerPresenter.setViewDelegate(timerProtocol: self)

        timerTableView.dataSource = self
        timerTableView.delegate = self
        timerTableView.register(UINib(nibName: "TimerTableViewCell", bundle: nil), forCellReuseIdentifier: "timerCell")
        timerPresenter.getTimeData()
    }
}

extension TimerViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if timerArray.dataseries?.count != nil {
            return timerArray.dataseries!.count

        } else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = timerTableView.dequeueReusableCell(withIdentifier: "timerCell", for: indexPath) as? TimerTableViewCell
        
        if timerArray.dataseries?.count != nil {
            cell?.txtCloudCover.text = Atoms.cloudCover(value: timerArray.dataseries![indexPath.row].cloudcover!)
            cell?.txtRh2m.text = Atoms.rh2m(value: timerArray.dataseries![indexPath.row].rh2M!)
            cell?.txtSeeing.text = Atoms.seeing(value: timerArray.dataseries![indexPath.row].seeing!)
            cell?.txtTransparency.text = Atoms.trasnparency(value: timerArray.dataseries![indexPath.row].transparency!)
            cell?.txtWin10MSpeed.text = Atoms.wind10m(value: timerArray.dataseries![indexPath.row].wind10M!.speed!)
            cell?.txtWinDirection.text = "10m Wind Direction: \(timerArray.dataseries![indexPath.row].wind10M!.direction)"
            cell?.txtPrecType.text = "Precipitation Type: \(timerArray.dataseries![indexPath.row].precType!)"
        }
        return cell!
    }
}

extension TimerViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290

    }
}

extension TimerViewController: TimerProtocol{
    func getData(timer: Timer) {
        timerArray = timer
        timerTableView.reloadData()

    }
    
    func errorGettingData(errorMessage: String) {
        print(errorMessage)
    }
}
