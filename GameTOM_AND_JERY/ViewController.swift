import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLable: UILabel!
    @IBOutlet weak var scoreLable: UILabel!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    @IBOutlet weak var imageView6: UIImageView!
    @IBOutlet weak var imageView7: UIImageView!
    @IBOutlet weak var imageView8: UIImageView!
    @IBOutlet weak var imageView9: UIImageView!
    @IBOutlet weak var imageView10: UIImageView!
    @IBOutlet weak var imageView11: UIImageView!
    @IBOutlet weak var imageView12: UIImageView!
    @IBOutlet weak var highScoreLabel: UILabel!
        var score = 0
        var counter = 0
        var timer = Timer()
        var socerTimer = Timer()
    var tomAndjerry = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 20
        timerLable.text = "30"
        scoreLable.text = "SCORE"
        highScoreLabel.text = "HIGH SCORE"
        scoreLable.text = String(score)
        highScoreLabel.text = scoreLable.text
        timerLable.text = String(counter)
        

        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(reconizershow))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(reconizershow))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(reconizershow))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(reconizershow))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(reconizershow))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(reconizershow))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(reconizershow))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(reconizershow))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(reconizershow))
        let recognizer10 = UITapGestureRecognizer(target: self, action: #selector(reconizershow))
        let recognizer11 = UITapGestureRecognizer(target: self, action: #selector(reconizershow))
        let recognizer12 = UITapGestureRecognizer(target: self, action: #selector(reconizershow))
        
        
        //
        
        imageView1.addGestureRecognizer(recognizer1)
        imageView2.addGestureRecognizer(recognizer2)
        imageView3.addGestureRecognizer(recognizer3)
        imageView4.addGestureRecognizer(recognizer4)
        imageView5.addGestureRecognizer(recognizer5)
        imageView6.addGestureRecognizer(recognizer6)
        imageView7.addGestureRecognizer(recognizer7)
        imageView8.addGestureRecognizer(recognizer8)
        imageView9.addGestureRecognizer(recognizer9)
        imageView10.addGestureRecognizer(recognizer10)
        imageView11.addGestureRecognizer(recognizer11)
        imageView12.addGestureRecognizer(recognizer12)
        //TomArray
        tomAndjerry = [imageView1,imageView2,imageView3,imageView4,imageView5,imageView6,imageView7,imageView8,imageView9,imageView10,imageView11,imageView11,imageView12]
   
        //For Timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timercount), userInfo: nil, repeats: true)
        socerTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timertom), userInfo: nil, repeats: true)
        hidentom()
        
    }
    

    @objc func reconizershow (){
        imageView8.isHidden = true
        score += 1
        scoreLable.text = String(score)
        let number = Int(highScoreLabel.text ?? "0") ?? 0
        if timerLable.text == "0" {
            if score > number {
                highScoreLabel.text = String(score)
                
            }
        }
    }
    func hidentom (){
        for tom in tomAndjerry{
            tom.isHidden = true
            //Hiiden start.
        }
        let random = Int(arc4random_uniform(UInt32(tomAndjerry.count-1)))
        tomAndjerry[random].isHidden = false
        
    }
    //Timer counter
    @objc func timercount(){
        counter -= 1
        timerLable.text = String(counter)
        if counter == 0 {
            timer.invalidate()
            socerTimer.invalidate()
            
            if score > Int(highScoreLabel.text!) ??  0{
                highScoreLabel.text = String(score)
            }
            //For alert
            let alert = UIAlertController(title: "Tim is over", message: "Do you want play again",preferredStyle:UIAlertController.Style.alert)
            let okbutton =  UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { UIAlertAction in
                self .score  = 0
                self .counter  = 20
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timercount), userInfo: nil, repeats: true)
                self.socerTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.timertom), userInfo: nil, repeats: true)
            }
            alert.addAction(okbutton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
            for hidden in tomAndjerry{
                hidden.isHidden = true
            }
        }
    }
    @objc func timertom(){
        for jerry in tomAndjerry{
            jerry.isHidden = true
        }
        let random = Int(arc4random_uniform(UInt32(tomAndjerry.count-1)))
        tomAndjerry[random].isHidden = false
        
    }

}

