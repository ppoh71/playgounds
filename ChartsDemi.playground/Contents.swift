//
//  ChartViewController.swift
//  motoRoutes
//
//  Created by Peter Pohlmann on 24.08.16.
//  Copyright © 2016 Peter Pohlmann. All rights reserved.
//


import UIKit
import Charts

class MotoChart: UIView, ChartViewDelegate {
    
    @IBOutlet weak var lineChartView: LineChartView!
    
    // 1 - creating an array of data entries
    var yVals1 : [ChartDataEntry] = [ChartDataEntry]()
    let months = ["Jan" , "Feb", "Mar", "Apr", "May", "June", "July", "August", "Sept", "Oct", "Nov", "Dec"]
    let dollars1 = [1453.0,2352,5431,1442,5451,6486,1173,5678,9234,1345,9411,2212]
    
    
    //MARK: overrides
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    override func awakeFromNib() {
    }
    
    
    func setupChart(routeMaster: RouteMaster){
        
        self.lineChartView.delegate = self
        self.lineChartView.descriptionText = "Speed"
        self.lineChartView.descriptionTextColor = UIColor.blackColor()
        self.lineChartView.gridBackgroundColor = UIColor.darkGrayColor()
        self.lineChartView.noDataText = "No data provided"
        self.lineChartView.rightAxis.enabled = false
        self.lineChartView.drawGridBackgroundEnabled = false
        self.lineChartView.doubleTapToZoomEnabled = false
        self.lineChartView.xAxis.drawGridLinesEnabled = false
        self.lineChartView.xAxis.drawAxisLineEnabled = false
        self.lineChartView.rightAxis.drawGridLinesEnabled = false
        self.lineChartView.rightAxis.drawAxisLineEnabled = false
        self.lineChartView.leftAxis.drawGridLinesEnabled = false
        self.lineChartView.leftAxis.drawAxisLineEnabled = false
        self.lineChartView.animate(yAxisDuration: 1.0)
        
        setChartData(months, yValsArr: dollars1)
    }
    
    
    func setChartData(xValsArr: [String], yValsArr: [Double]) {
        
        for (index, item) in xValsArr.enumerate() {
            yVals1.append(ChartDataEntry(value: yValsArr[index], xIndex: index))
        }
        
        
        let set1: LineChartDataSet = LineChartDataSet(yVals: yVals1, label: "First Set")
        set1.axisDependency = .Left // Line will correlate with left axis values
        set1.setColor(UIColor.redColor().colorWithAlphaComponent(0.5)) // our line's opacity is 50%
        set1.drawCirclesEnabled = false
        set1.lineWidth = 0.5
        set1.circleRadius = 6.0 // the radius of the node circle
        set1.fillAlpha = 65 / 255.0
        set1.fillColor = UIColor.redColor()
        set1.drawFilledEnabled = true
        set1.highlightColor = UIColor.whiteColor()
        set1.drawCircleHoleEnabled = true
        
        //3 - create an array to store our LineChartDataSets
        var dataSets : [LineChartDataSet] = [LineChartDataSet]()
        dataSets.append(set1)
        
        //4 - pass our months in for our x-axis label value along with our dataSets
        let data: LineChartData = LineChartData(xVals: xValsArr, dataSets: dataSets)
        data.setValueTextColor(UIColor.whiteColor())
        
        //5 - finally set our data
        self.lineChartView.data = data
    }
    
    func chartValueSelected(chartView: ChartViewBase, entry: ChartDataEntry, dataSetIndex: Int, highlight: ChartHighlight) {
        print(" Chart Value \(entry.value)  \(entry.xIndex)")
    }
}
