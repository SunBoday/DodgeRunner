//
//  RunnerDoggeGameVC.swift
//  DodgeRunner
//
//  Created by SunTory on 2025/1/1.
//

import UIKit

class RunnerDoggeGameVC: UIViewController {

    @IBOutlet var addView: UIView!
    @IBOutlet weak var scorelbl: UILabel!
    var mouse: UIImageView!
    var road = UIImageView()
    var carrots: [UIView] = []
    var gameTimer: Timer?

    // Buttons
    var leftMoveButton: UIButton!
    var rightMoveButton: UIButton!

    // Score and Missed Carrots
    var score: Int = 0
    var missedCarrots: Int = 0
    let maxMissedCarrots = 10
    let scoreLabel = UILabel()

    var roadImage = "bg"
    var mouseImage = "player1"
    var carrotImage = "ball"
    var leftimage = "left"
    var rightImage = "right"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGame()
        setupControls()
        showHowToPlayAlert()
    }
    
    func showHowToPlayAlert() {
        let alert = UIAlertController(
            title: "How to Play",
            message: """
            - Use the "Left" and "Right" buttons to move the player.
            - Collect the falling balls to increase your score.
            - If you miss 10 carrots, the game is over!
            """,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Got it!", style: .default, handler: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.startGame()
            }
        }))
        present(alert, animated: true)
    }
    
    func setupGame() {
        // Setup road
        road = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        road.image = UIImage(named: roadImage)
        road.contentMode = .scaleAspectFill
        view.addSubview(road)
        
        // Setup mouse
        let mouseSize: CGFloat = 160
        mouse = UIImageView(frame: CGRect(x: road.frame.midX - mouseSize / 2, y: road.frame.height - mouseSize - 150, width: mouseSize / 2, height: mouseSize * 1.5))
        mouse.image = UIImage(named: mouseImage)
        mouse.contentMode = .scaleAspectFit
        view.addSubview(mouse)
        
        // Setup score label
        scoreLabel.frame = CGRect(x: 20, y: 40, width: 200, height: 40)
        scoreLabel.text = "Score: 0"
        scoreLabel.font = UIFont.boldSystemFont(ofSize: 20)
        scoreLabel.textColor = .white
        view.addSubview(scoreLabel)
        
        // Add carrots
        addCarrots()
    }
    
    func setupControls() {
        // Left Move Button
        leftMoveButton = UIButton(frame: CGRect(x: 40, y: view.frame.height - 120, width: 60, height: 60))
        leftMoveButton.setImage(UIImage(named: "\(leftimage)"), for: .normal)
        leftMoveButton.backgroundColor = .clear
        leftMoveButton.layer.cornerRadius = 10
        leftMoveButton.addTarget(self, action: #selector(leftMoveBtn(_:)), for: .touchUpInside)
        view.addSubview(leftMoveButton)
        
        // Right Move Button
        rightMoveButton = UIButton(frame: CGRect(x: view.frame.width - 100, y: view.frame.height - 120, width: 60, height: 60))
        rightMoveButton.setImage(UIImage(named: "\(rightImage)"), for: .normal)
        rightMoveButton.backgroundColor = .clear
        rightMoveButton.layer.cornerRadius = 10
        rightMoveButton.addTarget(self, action: #selector(rightMoveBtn(_:)), for: .touchUpInside)
        view.addSubview(rightMoveButton)
    }
    
    func addCarrots() {
        for _ in 0..<5 {
            let carrotWidth: CGFloat = 32
            let carrotHeight: CGFloat = 32
            let randomX = CGFloat.random(in: 0...(road.frame.width - carrotWidth))
            let randomY = CGFloat.random(in: 0...(road.frame.height / 2))
            
            let carrot = UIImageView(frame: CGRect(x: randomX, y: randomY, width: carrotWidth, height: carrotHeight))
            carrot.image = UIImage(named: carrotImage)
            carrot.contentMode = .scaleAspectFit
            carrots.append(carrot)
            road.addSubview(carrot)
        }
    }
    
    func startGame() {
        score = 0
        missedCarrots = 0
        scoreLabel.text = "Score: \(score)"
        
        // Timer for game loop
        gameTimer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(updateGame), userInfo: nil, repeats: true)
    }
    
    @objc func updateGame() {
        for carrot in carrots {
            carrot.frame.origin.y += 5
            
            // Check for collision
            if carrot.frame.intersects(mouse.frame) {
                score += 1
                scoreLabel.text = "Score: \(score)"
                resetCarrotPosition(carrot)
            }
            
            // Reset carrot position if it goes off-screen
            if carrot.frame.origin.y > road.frame.height {
                missedCarrots += 1
                resetCarrotPosition(carrot)
                
                // Check for game over
                if missedCarrots >= maxMissedCarrots {
                    gameOver()
                }
            }
        }
    }
    
    func resetCarrotPosition(_ carrot: UIView) {
        carrot.frame.origin.y = -20
        carrot.frame.origin.x = CGFloat.random(in: 0...(road.frame.width - carrot.frame.width))
    }
    
    func gameOver() {
        gameTimer?.invalidate()
        addViews()
    }
    
    func addViews() {
        view.addSubview(addView)
        scorelbl.text = "Your Score: \(score)"
        addView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            addView.widthAnchor.constraint(equalToConstant: 250),
            addView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    @objc func leftMoveBtn(_ sender: UIButton) {
        mouse.frame.origin.x -= 20
        if mouse.frame.origin.x < 0 {
            mouse.frame.origin.x = 0
        }
    }
    
    @objc func rightMoveBtn(_ sender: UIButton) {
        mouse.frame.origin.x += 20
        if mouse.frame.origin.x > road.frame.width - mouse.frame.width {
            mouse.frame.origin.x = road.frame.width - mouse.frame.width
        }
    }
    
    @IBAction func rePlayBtn(_ sender: UIButton) {
        resetGame()
        addView.removeFromSuperview()
    }
    
    func resetGame() {
        for carrot in carrots {
            carrot.removeFromSuperview()
        }
        carrots.removeAll()
        addCarrots()
        mouse.frame.origin.x = road.frame.midX - mouse.frame.width / 2
        startGame()
    }
    
    @IBAction func btnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
