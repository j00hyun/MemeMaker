//
//  ViewController.swift
//  MemeMaker
//
//  Created by Park JooHyun on 2022/03/18.
//

import UIKit

class ViewController: UIViewController {
    
    let topChoices: [CaptionOption] = [
        CaptionOption.init(emoji: "🕶", caption: "You know what's cool?"),
        CaptionOption.init(emoji: "💥", caption: "You know what makes me mad?"),
        CaptionOption.init(emoji: "💕", caption: "You know what I love?")
    ]
    
    let bottomChoices: [CaptionOption] = [
        CaptionOption.init(emoji: "🐱", caption: "Cats wearing hats"),
        CaptionOption.init(emoji: "🐶", caption: "Dogs carrying logs"),
        CaptionOption.init(emoji: "🐵", caption: "Monkeys being funky")
    ]
    
    @IBOutlet weak var topSegmentControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    @IBAction func controlTopSegment(_ sender: UISegmentedControl) {
        updateTopCaption(topText: topChoices[sender.selectedSegmentIndex].caption)
    }
    
    @IBAction func controlBottomSegment(_ sender: UISegmentedControl) {
        updateBottomCaption(bottomText: bottomChoices[sender.selectedSegmentIndex].caption)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topSegmentControl.removeAllSegments()
        bottomSegmentControl.removeAllSegments()
        topSegmentControl.selectedSegmentIndex = 0
        bottomSegmentControl.selectedSegmentIndex = 0
        
        for choice in topChoices {
            topSegmentControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        
        for choice in bottomChoices {
            bottomSegmentControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        
        updateTopCaption(topText: "")
        updateBottomCaption(bottomText: "")
    }
    
    func updateTopCaption(topText: String) {
        topCaptionLabel.text = topText
    }
    
    func updateBottomCaption(bottomText:
                             String) {
        bottomCaptionLabel.text = bottomText
    }
    
    /*
     UIPanGestureRecognizer.state =
        .began
        .changed
        .ended
        .cancelled (ex. 제스처 도중 전화가 왔을 때)
     */
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        // 라벨위에서 터치 제스처의 움직임이 인식된다면
        if sender.state == .changed {
            // 라벨의 중심 위치를 터치 위치로 이동 (이때, 위치 좌표는 라벨이 속해있는 view를 기준)
            topCaptionLabel.center = sender.location(in: view)
        }
    }
    
    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            bottomCaptionLabel.center = sender.location(in: view)
        }
    }
}

