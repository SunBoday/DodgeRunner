//
//  RunnerGameVC.swift
//  DodgeRunner
//
//  Created by SunTory on 2025/1/1.
//

import UIKit

class RunnerGameVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    // MARK: - Properties
    let ratImage = UIImage(named: "player")!
    let cheeseImage = UIImage(named: "trophy")!
    let catImage = UIImage(named: "enemy")!
    
    let gridSize = 7 // 7x7 grid
    var ratPosition = 0
    var cheesePosition = 48
    var catPosition = Int.random(in: 1..<48)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showHowToPlayAlert()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // MARK: - Button Actions
    @IBAction func topBtn(_ sender: UIButton) {
        moveRat(by: -gridSize) // Move up by gridSize cells
    }
    
    @IBAction func downBtn(_ sender: UIButton) {
        moveRat(by: gridSize) // Move down by gridSize cells
    }
    
    @IBAction func leftBtn(_ sender: UIButton) {
        moveRat(by: -1) // Move left by 1 cell
    }
    
    @IBAction func rightBtn(_ sender: UIButton) {
        moveRat(by: 1) // Move right by 1 cell
    }
    
    @IBAction func btnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Game Logic
    func moveRat(by offset: Int) {
        let newPosition = ratPosition + offset
        
        // Ensure rat doesn't move out of bounds
        if newPosition < 0 || newPosition >= gridSize * gridSize ||
           (ratPosition % gridSize == 0 && offset == -1) ||
           ((ratPosition + 1) % gridSize == 0 && offset == 1) {
            return
        }
        
        ratPosition = newPosition
        
        // Check if rat reaches cheese
        if ratPosition == cheesePosition {
            showAlert(title: "You Won!", message: "The rat reached the cheese!")
            restartGame()
            return
        }
        
        // Move the cat to a new random position
        moveCat()
        
        // Check if rat and cat collide or are adjacent
        if ratPosition == catPosition || isRatNearCat() {
            showAlert(title: "Game Over!", message: "The rat was caught by the cat!")
            restartGame()
            return
        }
        
        collectionView.reloadData()
    }
    
    func moveCat() {
        var newCatPosition: Int
        repeat {
            newCatPosition = Int.random(in: 0..<gridSize * gridSize)
        } while newCatPosition == ratPosition || newCatPosition == cheesePosition
        
        catPosition = newCatPosition
    }
    
    func isRatNearCat() -> Bool {
        let catRow = catPosition / gridSize
        let catCol = catPosition % gridSize
        let ratRow = ratPosition / gridSize
        let ratCol = ratPosition % gridSize

        // Check if the rat is in any of the adjacent cells of the cat
        return abs(catRow - ratRow) <= 1 && abs(catCol - ratCol) <= 1
    }
    
    func restartGame() {
        ratPosition = 0
        cheesePosition = 48
        catPosition = Int.random(in: 1..<48)
        collectionView.reloadData()
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    func showHowToPlayAlert() {
        let message = """
        Welcome to Dodge Runner!

        - Use the arrow buttons to move the player.
        - Collect the trophy to win the game.
        - Avoid the enemy! If it catches you, the game is over.

        Good luck and have fun!
        """

        let alert = UIAlertController(title: "How to Play", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Got it!", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
}

// MARK: - CollectionView Methods
extension RunnerGameVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gridSize * gridSize
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.img.image = nil
        
        if indexPath.item == ratPosition {
            cell.img.image = ratImage
        } else if indexPath.item == cheesePosition {
            cell.img.image = cheeseImage
        } else if indexPath.item == catPosition {
            cell.img.image = catImage
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 10 // Adjust for cell spacing
        let size = (collectionView.frame.width - spacing * CGFloat(gridSize - 1)) / CGFloat(gridSize)
        return CGSize(width: size, height: size)
    }
}

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
}
