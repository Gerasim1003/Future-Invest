//
//  ResaultViewController.swift
//  Future Invest
//
//  Created by Gerasim Israyelyan on 8/1/19.
//  Copyright © 2019 Gerasim Israyelyan. All rights reserved.
//

import Charts
import UIKit

protocol ResaultViewControllerDelegate {
    func toggleMenu()
}

class ResaultViewController: UIViewController {

    var delegate: ResaultViewControllerDelegate?
    
    @IBOutlet weak var chtChart: LineChartView!
    var goal: Goal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateChart()
        
    }
    
    func updateChart() {
        var lineChartEntry = [ChartDataEntry]()
        
        for i in 0..<5 {
            let value = ChartDataEntry(x: Double(i), y: Double(i + 10))
            lineChartEntry.append(value)
        }
        
        let line1 = LineChartDataSet(entries: lineChartEntry, label: "Number")
        
        line1.colors = [NSUIColor.green]
        line1.circleColors = [NSUIColor.orange]
        
        let data = LineChartData()
        
        data.addDataSet(line1)
        
        chtChart.data = data

    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func menuButtonTapped(_ sender: UIButton) {
        delegate?.toggleMenu()
    }

}
