import UIKit

class DrawingsViewController: UIViewController {
    
    @objc var delegate = ArtistViewController()
    @objc var canvasView = CanvasView()
    
    var drawingsDictionary = ["Planet": 1, "Head": 2, "Tree": 3, "Landscape": 4]
    
    var planetButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
    var headButton = UIButton(frame: CGRect(x: 0, y: 55, width: 200, height: 40))
    var treeButton = UIButton(frame: CGRect(x: 0, y: 110, width: 200, height: 40))
    var landscapeButton = UIButton(frame: CGRect(x: 0, y: 165, width: 200, height: 40))

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
    }
    
    func configure() {
        self.navigationItem.title = "Drawings"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font:UIFont(name: "Montserrat-Regular", size: 17.0)!,
                                                                        NSAttributedString.Key.foregroundColor:UIColor(named: "Black") ?? UIColor .black]
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "Artist",
                                                                     style: UIBarButtonItem.Style.plain,
                                                                     target: self,
                                                                     action: Selector.init(("back:")))
        self.navigationItem.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font:UIFont(name: "Montserrat-Medium", size: 17.0)!,
                                                                       NSAttributedString.Key.foregroundColor:UIColor(named: "emerald")!],
                                                                      for: UIControl.State.normal)
        self.navigationController?.view.tintColor = UIColor(named: "emerald")
        let list: UIView = UIView(frame: CGRect(x: 88, y: 112, width: 200, height: 205))
        list.tintColor = UIColor(named: "emerald")
        self.view.addSubview(list)
        self.view.bringSubviewToFront(list)
        
        self.view.backgroundColor = .white
        
        self.addButton()
    }
    
    func addButton() {
        self.setAllButtonsDefault()
        
        planetButton.layer.cornerRadius = 10.0
        headButton.layer.cornerRadius = 10.0
        treeButton.layer.cornerRadius = 10.0
        landscapeButton.layer.cornerRadius = 10.0
        
        planetButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 18.0)
        headButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 18.0)
        treeButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 18.0)
        landscapeButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 18.0)
        
        planetButton.titleLabel?.textAlignment = .center
        headButton.titleLabel?.textAlignment = .center
        treeButton.titleLabel?.textAlignment = .center
        landscapeButton.titleLabel?.textAlignment = .center
        
        planetButton.setTitleColor(UIColor(named: "emerald"), for: .normal)
        headButton.setTitleColor(UIColor(named: "emerald"), for: .normal)
        treeButton.setTitleColor(UIColor(named: "emerald"), for: .normal)
        landscapeButton.setTitleColor(UIColor(named: "emerald"), for: .normal)
        
        planetButton.setTitle("Planet", for: .normal)
        headButton.setTitle("Head", for: .normal)
        treeButton.setTitle("Tree", for: .normal)
        landscapeButton.setTitle("Landscape", for: .normal)
        
        self.view.subviews[0].addSubview(planetButton)
        self.view.subviews[0].addSubview(headButton)
        self.view.subviews[0].addSubview(treeButton)
        self.view.subviews[0].addSubview(landscapeButton)

        planetButton.addTarget(self, action: #selector(self.buttonTouchedUp(sender:)), for: .touchUpInside)
        headButton.addTarget(self, action: #selector(self.buttonTouchedUp(sender:)), for: .touchUpInside)
        treeButton.addTarget(self, action: #selector(self.buttonTouchedUp(sender:)), for: .touchUpInside)
        landscapeButton.addTarget(self, action: #selector(self.buttonTouchedUp(sender:)), for: .touchUpInside)

        planetButton.addTarget(self, action: #selector(self.buttonTouchedDown(sender:)), for: .touchDown)
        headButton.addTarget(self, action: #selector(self.buttonTouchedDown(sender:)), for: .touchDown)
        treeButton.addTarget(self, action: #selector(self.buttonTouchedDown(sender:)), for: .touchDown)
        landscapeButton.addTarget(self, action: #selector(self.buttonTouchedDown(sender:)), for: .touchDown)
    }
    
    
    @objc func popToArtistViewController(sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func buttonTouchedUp(sender: UIButton) {
        for (key, _) in self.drawingsDictionary {
            if key == sender.titleLabel?.text {
                self.canvasView.currentDrawing = self.drawingsDictionary[key]! as NSNumber
                self.popToArtistViewController(sender: sender)
            }
        }
        self.delegate.drawButton.setDefault()
    }
    
    @objc func buttonTouchedDown(sender: UIButton) {
        setAllButtonsDefault()
        sender.setHighlighted()
    }

    @objc func setAllButtonsDefault() {
        let arrayWithButtons = [planetButton, headButton, treeButton, landscapeButton]
        for button in arrayWithButtons {
            button.setDefault()
        }
    }
}
