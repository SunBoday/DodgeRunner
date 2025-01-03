//
//  RunnerTapGameVC.swift
//  DodgeRunner
//
//  Created by SunTory on 2025/1/3.
//

import UIKit

class RunnerTapGameVC: UIViewController {

    @IBOutlet weak var viewPlanet: UIView!
    @IBOutlet weak var imgPlanet: UIImageView!
    
    @IBOutlet weak var lblProfit: UILabel!
    @IBOutlet weak var cvList: UICollectionView!
    
    var arrList: [PlanetTapModel] = [
        PlanetTapModel(
            name: "Tap Power",
            plan: [
                TapPlan(desc: "2x Tap Power", addOn: 2, price: 10),
                TapPlan(desc: "5x Tap Power", addOn: 5, price: 100),
                TapPlan(desc: "10x Tap Power", addOn: 10, price: 2000),
                TapPlan(desc: "20x Tap Power", addOn: 20, price: 5000),
                TapPlan(desc: "50x Tap Power", addOn: 50, price: 15000),
                TapPlan(desc: "100x Tap Power", addOn: 100, price: 50000),
                TapPlan(desc: "200x Tap Power", addOn: 200, price: 150000),
                TapPlan(desc: "500x Tap Power", addOn: 500, price: 400000),
                TapPlan(desc: "1000x Tap Power", addOn: 1000, price: 1000000),
                TapPlan(desc: "2000x Tap Power", addOn: 2000, price: 2500000)
            ],
            isTap: true
        ),
        PlanetTapModel(
            name: "Campfire",
            plan: [
                TapPlan(desc: "1 per second", addOn: 1, price: 200),
                TapPlan(desc: "2 per second", addOn: 2, price: 500),
                TapPlan(desc: "5 per second", addOn: 5, price: 1500),
                TapPlan(desc: "10 per second", addOn: 10, price: 4000),
                TapPlan(desc: "20 per second", addOn: 20, price: 10000),
                TapPlan(desc: "50 per second", addOn: 50, price: 25000),
                TapPlan(desc: "100 per second", addOn: 100, price: 60000),
                TapPlan(desc: "200 per second", addOn: 200, price: 150000),
                TapPlan(desc: "500 per second", addOn: 500, price: 400000),
                TapPlan(desc: "1000 per second", addOn: 1000, price: 1000000)
            ],
            isTap: false
        ),
        PlanetTapModel(
            name: "Farm",
            plan: [
                TapPlan(desc: "5 per second", addOn: 5, price: 1000),
                TapPlan(desc: "10 per second", addOn: 10, price: 2500),
                TapPlan(desc: "20 per second", addOn: 20, price: 6000),
                TapPlan(desc: "50 per second", addOn: 50, price: 15000),
                TapPlan(desc: "100 per second", addOn: 100, price: 40000),
                TapPlan(desc: "200 per second", addOn: 200, price: 100000),
                TapPlan(desc: "500 per second", addOn: 500, price: 250000),
                TapPlan(desc: "1000 per second", addOn: 1000, price: 600000),
                TapPlan(desc: "2000 per second", addOn: 2000, price: 1500000),
                TapPlan(desc: "5000 per second", addOn: 5000, price: 4000000)
            ],
            isTap: false
        ),
        PlanetTapModel(
            name: "Mine",
            plan: [
                TapPlan(desc: "20 per second", addOn: 20, price: 5000),
                TapPlan(desc: "50 per second", addOn: 50, price: 12000),
                TapPlan(desc: "100 per second", addOn: 100, price: 30000),
                TapPlan(desc: "200 per second", addOn: 200, price: 75000),
                TapPlan(desc: "500 per second", addOn: 500, price: 200000),
                TapPlan(desc: "1000 per second", addOn: 1000, price: 500000),
                TapPlan(desc: "2000 per second", addOn: 2000, price: 1200000),
                TapPlan(desc: "5000 per second", addOn: 5000, price: 3000000),
                TapPlan(desc: "10000 per second", addOn: 10000, price: 7500000),
                TapPlan(desc: "20000 per second", addOn: 20000, price: 20000000)
            ],
            isTap: false
        ),
        PlanetTapModel(
            name: "Factory",
            plan: [
                TapPlan(desc: "100 per second", addOn: 100, price: 25000),
                TapPlan(desc: "200 per second", addOn: 200, price: 60000),
                TapPlan(desc: "500 per second", addOn: 500, price: 150000),
                TapPlan(desc: "1000 per second", addOn: 1000, price: 375000),
                TapPlan(desc: "2000 per second", addOn: 2000, price: 1000000),
                TapPlan(desc: "5000 per second", addOn: 5000, price: 2500000),
                TapPlan(desc: "10000 per second", addOn: 10000, price: 6000000),
                TapPlan(desc: "20000 per second", addOn: 20000, price: 15000000),
                TapPlan(desc: "50000 per second", addOn: 50000, price: 37500000),
                TapPlan(desc: "100000 per second", addOn: 100000, price: 100000000)
            ],
            isTap: false
        ),
        PlanetTapModel(
            name: "Laboratory",
            plan: [
                TapPlan(desc: "500 per second", addOn: 500, price: 125000),
                TapPlan(desc: "1000 per second", addOn: 1000, price: 300000),
                TapPlan(desc: "2000 per second", addOn: 2000, price: 750000),
                TapPlan(desc: "5000 per second", addOn: 5000, price: 1875000),
                TapPlan(desc: "10000 per second", addOn: 10000, price: 5000000),
                TapPlan(desc: "20000 per second", addOn: 20000, price: 12500000),
                TapPlan(desc: "50000 per second", addOn: 50000, price: 30000000),
                TapPlan(desc: "100000 per second", addOn: 100000, price: 75000000),
                TapPlan(desc: "200000 per second", addOn: 200000, price: 187500000),
                TapPlan(desc: "500000 per second", addOn: 500000, price: 500000000)
            ],
            isTap: false
        ),
        PlanetTapModel(
            name: "Space Station",
            plan: [
                TapPlan(desc: "2000 per second", addOn: 2000, price: 625000),
                TapPlan(desc: "5000 per second", addOn: 5000, price: 1500000),
                TapPlan(desc: "10000 per second", addOn: 10000, price: 3750000),
                TapPlan(desc: "20000 per second", addOn: 20000, price: 9375000),
                TapPlan(desc: "50000 per second", addOn: 50000, price: 25000000),
                TapPlan(desc: "100000 per second", addOn: 100000, price: 62500000),
                TapPlan(desc: "200000 per second", addOn: 200000, price: 150000000),
                TapPlan(desc: "500000 per second", addOn: 500000, price: 375000000),
                TapPlan(desc: "1000000 per second", addOn: 1000000, price: 937500000),
                TapPlan(desc: "2000000 per second", addOn: 2000000, price: 2500000000)
            ],
            isTap: false
        ),
        PlanetTapModel(
            name: "Quantum Core",
            plan: [
                TapPlan(desc: "10000 per second", addOn: 10000, price: 3125000),
                TapPlan(desc: "20000 per second", addOn: 20000, price: 7500000),
                TapPlan(desc: "50000 per second", addOn: 50000, price: 18750000),
                TapPlan(desc: "100000 per second", addOn: 100000, price: 46875000),
                TapPlan(desc: "200000 per second", addOn: 200000, price: 125000000),
                TapPlan(desc: "500000 per second", addOn: 500000, price: 312500000),
                TapPlan(desc: "1000000 per second", addOn: 1000000, price: 750000000),
                TapPlan(desc: "2000000 per second", addOn: 2000000, price: 1875000000),
                TapPlan(desc: "5000000 per second", addOn: 5000000, price: 4687500000),
                TapPlan(desc: "10000000 per second", addOn: 10000000, price: 12500000000)
            ],
            isTap: false
        ),
        PlanetTapModel(
            name: "Galactic Hub",
            plan: [
                TapPlan(desc: "50000 per second", addOn: 50000, price: 15625000),
                TapPlan(desc: "100000 per second", addOn: 100000, price: 37500000),
                TapPlan(desc: "200000 per second", addOn: 200000, price: 93750000),
                TapPlan(desc: "500000 per second", addOn: 500000, price: 234375000),
                TapPlan(desc: "1000000 per second", addOn: 1000000, price: 625000000),
                TapPlan(desc: "2000000 per second", addOn: 2000000, price: 1562500000),
                TapPlan(desc: "5000000 per second", addOn: 5000000, price: 3750000000),
                TapPlan(desc: "10000000 per second", addOn: 10000000, price: 9375000000),
                TapPlan(desc: "20000000 per second", addOn: 20000000, price: 23437500000),
                TapPlan(desc: "50000000 per second", addOn: 50000000, price: 62500000000)
            ],
            isTap: false
        ),
        PlanetTapModel(
            name: "Universal Core",
            plan: [
                TapPlan(desc: "200000 per second", addOn: 200000, price: 78125000),
                TapPlan(desc: "500000 per second", addOn: 500000, price: 187500000),
                TapPlan(desc: "1000000 per second", addOn: 1000000, price: 468750000),
                TapPlan(desc: "2000000 per second", addOn: 2000000, price: 1171875000),
                TapPlan(desc: "5000000 per second", addOn: 5000000, price: 3125000000),
                TapPlan(desc: "10000000 per second", addOn: 10000000, price: 7812500000),
                TapPlan(desc: "20000000 per second", addOn: 20000000, price: 18750000000),
                TapPlan(desc: "50000000 per second", addOn: 50000000, price: 46875000000),
                TapPlan(desc: "100000000 per second", addOn: 100000000, price: 117187500000),
                TapPlan(desc: "200000000 per second", addOn: 200000000, price: 312500000000)
            ],
            isTap: false
        )
    ]
    
    // Add game state variables
    private var currentProfit: Double = 0
    private var profitPerTap: Double = 1
    private var profitPerSecond: Double = 0
    private var timer: Timer?
    
    // Add new properties
    private let particleEmitter = CAEmitterLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgPlanet.image = UIImage.gifImageWithName("P 3")
        
        cvList.delegate = self
        cvList.dataSource = self
        
        // Setup tap gesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(planetTapped(_:)))
        viewPlanet.addGestureRecognizer(tapGesture)
        
        // Start passive income timer
        startPassiveIncomeTimer()
        
        // Update UI
        updateProfitLabel()
        
        // Setup particle emitter
        setupParticleEmitter()
    }
    
    private func setupParticleEmitter() {
        particleEmitter.emitterPosition = CGPoint(x: 0, y: 0)
        particleEmitter.emitterShape = .point
        particleEmitter.emitterSize = CGSize(width: 1, height: 1)
        
        let cell = CAEmitterCell()
        cell.birthRate = 100
        cell.lifetime = 0.5
        cell.velocity = 50
        cell.velocityRange = 20
        cell.emissionRange = .pi * 2
        cell.scale = 0.3
        cell.scaleRange = 0.1
        cell.scaleSpeed = -0.2
        cell.alphaSpeed = -2.0
        cell.contents = UIImage(systemName: "star.fill")?.cgImage
        cell.color = UIColor.systemYellow.cgColor
        
        particleEmitter.emitterCells = [cell]
        viewPlanet.layer.addSublayer(particleEmitter)
    }
    
    @objc private func planetTapped(_ gesture: UITapGestureRecognizer) {
        currentProfit += profitPerTap
        updateProfitLabel()
        
        // Get tap location and animate particles
        let tapLocation = gesture.location(in: viewPlanet)
        animateParticles(at: tapLocation)
        
        // Add number popup animation
        showProfitPopup(at: tapLocation)
        
        // Existing planet squeeze animation
        UIView.animate(withDuration: 0.1, animations: {
            self.viewPlanet.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                self.viewPlanet.transform = .identity
            }
        }
    }
    
    private func startPassiveIncomeTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.currentProfit += self?.profitPerSecond ?? 0
            self?.updateProfitLabel()
        }
    }
    
    private func updateProfitLabel() {
        lblProfit.text = "==>> " + formatNumber(currentProfit) + " ❊"
    }
    
    private func formatNumber(_ number: Double) -> String {
        if number >= 1_000_000_000 {
            return String(format: "%.1fB", number / 1_000_000_000)
        } else if number >= 1_000_000 {
            return String(format: "%.1fM", number / 1_000_000)
        } else if number >= 1_000 {
            return String(format: "%.1fK", number / 1_000)
        }
        return String(format: "%.0f", number)
    }
    
    private func animateParticles(at position: CGPoint) {
        // Update emitter position
        particleEmitter.emitterPosition = position
        
        // Create burst effect
        let animation = CABasicAnimation(keyPath: "birthRate")
        animation.fromValue = 100
        animation.toValue = 0
        animation.duration = 0.5
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        particleEmitter.add(animation, forKey: nil)
    }
    
    private func showProfitPopup(at position: CGPoint) {
        let label = UILabel()
        label.text = "+\(formatNumber(profitPerTap))"
        label.textColor = .systemYellow
        label.font = .boldSystemFont(ofSize: 16)
        label.sizeToFit()
        
        label.center = position
        viewPlanet.addSubview(label)
        
        UIView.animate(withDuration: 1.0, animations: {
            label.center.y -= 50
            label.alpha = 0
        }) { _ in
            label.removeFromSuperview()
        }
    }
}


extension RunnerTapGameVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HelperCell", for: indexPath) as! HelperCell
        let item = arrList[indexPath.item]
        let currentPlan = item.plan[item.unlocked]
        
        cell.lblTitle.text = item.name
        cell.lblProfit.text = "\(currentPlan.desc)\nCost: \(formatNumber(Double(currentPlan.price)))"
        
        // Update cell appearance based on affordability
        cell.contentView.alpha = currentProfit >= Double(currentPlan.price) ? 1.0 : 0.5
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let h = collectionView.bounds.height
        return CGSize(width: 400, height: h)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var item = arrList[indexPath.item]
        let currentPlan = item.plan[item.unlocked]
        
        // Check if player can afford the upgrade
        if currentProfit >= Double(currentPlan.price) {
            // Deduct the cost
            currentProfit -= Double(currentPlan.price)
            
            // Apply the upgrade
            if item.isTap {
                profitPerTap += Double(currentPlan.addOn)
            } else {
                profitPerSecond += Double(currentPlan.addOn)
            }
            
            // Unlock next level if available
            if item.upgrade() {
                // Save the upgraded state
                arrList[indexPath.item] = item
            }
            
            // Update UI
            updateProfitLabel()
            collectionView.reloadItems(at: [indexPath])
            
            // Add purchase feedback
            animatePurchase()
        } else {
            // Show "can't afford" feedback
            shakePurchaseButton(at: indexPath)
        }
    }
    
    private func animatePurchase() {
        UIView.animate(withDuration: 0.2, animations: {
            self.lblProfit.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { _ in
            UIView.animate(withDuration: 0.2) {
                self.lblProfit.transform = .identity
            }
        }
    }
    
    private func shakePurchaseButton(at indexPath: IndexPath) {
        if let cell = cvList.cellForItem(at: indexPath) {
            let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
            animation.timingFunction = CAMediaTimingFunction(name: .linear)
            animation.duration = 0.6
            animation.values = [-10.0, 10.0, -10.0, 10.0, -5.0, 5.0, -2.5, 2.5, 0.0]
            cell.layer.add(animation, forKey: "shake")
        }
    }
}

class HelperCell: UICollectionViewCell{
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblProfit: UILabel!
    
}


struct PlanetTapModel{
    let name: String
    var unlocked: Int = 0
    let plan: [TapPlan]
    var isTap: Bool
    
    mutating func upgrade() -> Bool {
        if unlocked < plan.count - 1 {
            unlocked += 1
            return true
        }
        return false
    }
}

struct TapPlan{
    let desc: String
    let addOn: Int
    let price: Int
}
