//
//  AppDelegate.swift
//  Hyper Fan Blower
//
//  Created by APPLE on 03/10/23.
//

import UIKit
import MobFlowiOS

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var mobflow: MobiFlowSwift?
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Initialize MobFlow with necessary parameters
        let oneSignalToken = "b6e509b5-4446-4a63-8c6b-a46d917d821e"
        let appLovinKey = "gvcyZqhgCmHnI7I-DHWLXoVhQkrqbHzcltIZAATT0RH-cWpBip16xde9wnuZq-I0CTLsqKAoe6z7U_6TdF12bx"
        let bannerID = "9a6fbfe16ac7e418"
        let interestialID = "085fc20965cb9ce4"
        let rewardedID = "46528b9f158833fe"
        let appOpenAdID = "b7f990f9b9746916"
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyBoard = UIStoryboard(name: "Main", bundle:nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier:
                                                                    "idSplashViewController")
        let navigationController = UINavigationController(rootViewController:
                                                            viewController)
        navigationController.isNavigationBarHidden = true
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        self.mobflow = MobiFlowSwift(initDelegate: self, oneSignalToken: oneSignalToken, appLovinKey: appLovinKey, bannerId: bannerID, interestialId: interestialID, rewardedId: rewardedID, appOpenAdId: appOpenAdID, launchOptions: launchOptions)
        
        return true
    }
    static func sharedInstance() -> AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
    }
}
extension AppDelegate : MobiFlowDelegate  {
    
    func present(dic: [String : Any]) {
        DispatchQueue.main.async {
            self.window = UIWindow(frame: UIScreen.main.bounds)
            
            let storyBoard = UIStoryboard(name: "Main", bundle:nil)
            let viewController = storyBoard.instantiateViewController(withIdentifier:
                                                                        "idViewController")
            let navigationController = UINavigationController(rootViewController:
                                                                viewController)
            navigationController.isNavigationBarHidden = true
            self.window?.rootViewController = navigationController
            self.window?.makeKeyAndVisible()
        }
    }
}
