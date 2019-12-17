//
//  View.swift
//  Population
//
//  Created by Can Balkaya on 12/7/19.
//  Copyright © 2019 Can Balkaya. All rights reserved.
//

//import Foundation
//import Macaw
//
//class View: MacawView {
//    static let lastFiveShows = createDummyData()
//    static let maxValue = humans.last!
//    static let maxValueLineHeight = graph.last!.generation
//    static let lineWidth: Double = 275
//    
//    static let dataDivisor = Double(maxValue/maxValueLineHeight)
//    static let adjustedData: [Double] = lastFiveShows.map({ Double($0.number) / dataDivisor })
//    static var animations: [Animation] = []
//    
//    override init?(node: Node, coder aDecoder: NSCoder) {
//        super.init(node: View.createChart(), coder: aDecoder)
//        backgroundColor = .clear
//    }
//    
//    @objc required convenience init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private static func createChart() -> Group {
//        var items: [Node] = addYAxisItems() + addXAxisItems()
//        items.append(createBars())
//        return Group(contents: items, place: .identity)
//    }
//    
//    private static func addYAxisItems() -> [Node] {
//        let maxLines = 10
//        let lineInterval = Int(maxValue / maxLines)
//        let yAxisHeight: Double = 200
//        let lineSpacing: Double = 30
//        
//        var newNodes: [Node] = []
//        
//        for i in 1...maxLines {
//            let y = yAxisHeight - (Double(i) * lineSpacing)
//            let valueLine = Line(x1: -5, y1: y, x2: lineWidth, y2: y).stroke(fill: Color.white.with(a: 0.1))
//            let valueText = Text(text: "\(i * lineInterval)", align: .max, baseline: .mid, place: .move(dx: -10, dy: y))
//            valueText.fill = Color.white
//            
//            newNodes.append(valueLine)
//            newNodes.append(valueText)
//        }
//        
//        let yAxis = Line(x1: 0, y1: 0, x2: 0, y2: yAxisHeight).stroke(fill: Color.white.with(a: 0.25))
//        newNodes.append(yAxis)
//        
//        return newNodes
//    }
//    
//    private static func addXAxisItems() -> [Node] {
//        let chartBaseY: Double = 200
//        var newNodes: [Node] = []
//        
//        for i in 1...adjustedData.count {
//            let x = (Double(i) * 50)
//            let valueText = Text(text: String(lastFiveShows[i - 1].number), align: .max, baseline: .mid, place: .move(dx: x, dy: chartBaseY + 15))
//            valueText.fill = Color.white
//            newNodes.append(valueText)
//        }
//        
//        let xAxis = Line(x1: 0, y1: chartBaseY, x2: lineWidth, y2: chartBaseY).stroke(fill: Color.white.with(a: 0.25))
//        newNodes.append(xAxis)
//        return newNodes
//    }
//    
//    private static func createBars() -> Group {
//        return Group()
//    }
//    
//    private static func createDummyData() -> [Human] {
//        return graph
//    }
//}
