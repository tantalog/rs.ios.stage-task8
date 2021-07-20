import UIKit

class TimerViewController: AppendingViewController {
    
    let timerLabel = UILabel(frame: CGRect(x: 162, y: 161, width: 52, height: 22))
    let minTimerLabel = UILabel(frame: CGRect(x: 26, y: 103, width: 7, height: 22))
    let maxTimerLabel = UILabel(frame: CGRect(x: 338, y: 103, width: 11, height: 22))

    
    @objc var mainPaintView = CanvasView()
    @objc var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    func setup() {
        let slider = UISlider(frame: CGRect(x: 74, y: 112, width: 223, height: 4))
        slider.minimumValue = 1.0
        slider.maximumValue = 5.0
        slider.tintColor = UIColor(named:"emerald")
        
        slider.addTarget(self, action: #selector(self.sliderValueChanged), for: .valueChanged)
        
        minTimerLabel.font = UIFont(name: "Montserrat-Regular", size: 18.0)
        minTimerLabel.text = "\(slider.minimumValue)"
        minTimerLabel.textAlignment = .center
        
        maxTimerLabel.font = UIFont(name: "Montserrat-Regular", size: 18.0)
        maxTimerLabel.text = "\(slider.maximumValue)"
        maxTimerLabel.textAlignment = .center
        
        self.view.addSubview(slider)
        self.view.addSubview(timerLabel)
        self.view .addSubview(minTimerLabel)
        self.view .addSubview(maxTimerLabel)
    }
    
    @objc func sliderValueChanged(sender:UISlider) {
        timerLabel.font = UIFont(name: "Montserrat-Regular", size: 18.0)
        timerLabel.text = String(format: "%0.02f", sender.value)
        timerLabel.textAlignment = .center
        
        self.mainPaintView.progress = 1.0/(60.0 * sender.value)
    }
}
