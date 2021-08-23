//
//  ProjectViewController.swift
//  planned5D
//
//  Created by Victor Barskov on 21.08.2021.
//

import UIKit

class ProjectViewController: UIViewController {
    
    var project: Project?
    
    enum Dimensions {
        case stackHeight
        case roomHeight
        case roomWidth
        
        var value: CGFloat {
            switch self {
            case .stackHeight:
                return 200.0
            case .roomHeight:
                return 100.0
            case .roomWidth:
                return 100.0
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        title = project?.name
        draw(project: project)
    }

}

extension ProjectViewController {
    
    func draw(project: Project?) {
        
        let stackView               = UIStackView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: Dimensions.stackHeight.value))
        stackView.center            = view.center
        stackView.axis              = .horizontal
        stackView.alignment         = .fill
        stackView.spacing           = 0
        stackView.distribution      = .fillEqually
        
        view.addSubview(stackView)
        
        for room in project?.house?.rooms ?? [] {
            
            let x = CGFloat(room.position?[0] ?? 0)
            let y = CGFloat(room.position?[1] ?? 0)
            
            let base = UIView()
            stackView.addArrangedSubview(base)
            
            let roomView = UIView(frame: CGRect(x: x, y: y, width: Dimensions.roomWidth.value, height: Dimensions.roomHeight.value))
            let path = UIBezierPath()
            for wall in room.walls ?? [] {
                let start = CGPoint(x:wall.start[0] , y:wall.start[1])
                let end = CGPoint(x:wall.end[0] , y:wall.end[1])
                path.move(to: start)
                path.addLine(to: end)
            }
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = path.cgPath
            shapeLayer.strokeColor = UIColor.black.cgColor
            shapeLayer.lineWidth = 2.0
            roomView.layer.addSublayer(shapeLayer)
            
            base.addSubview(roomView)
            
        }
    }
    
}
