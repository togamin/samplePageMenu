//
//  ViewControllers.swift
//  samplePageMenu
//
//  Created by 戸上　祐希 on 2018/06/05.
//  Copyright © 2018年 Togami Yuki. All rights reserved.
//

import UIKit

class ViewControllers:UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initPageMenu()
    }
    
    func initPageMenu() {
        
        //複数のViewControllerを用意
        let viewControllers = getViewControllers()
        
        //メニューバーのレイアウト
        let option = getPageMenuOption()
        
        //PageMenuViewインスタンス作成
        let pageMenu = PageMenuView(
            viewControllers: viewControllers,
            option: option)
        
        //デリゲート
        pageMenu.delegate = self

        //まだよくわからない
        pageMenu.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        //viewにpageMenuを追加する.
        view.addSubview(pageMenu)
    }
}

//どのページからどのページに遷移したかをメモする。
extension ViewControllers: PageMenuViewDelegate {
    
    func willMoveToPage(_ pageMenu: PageMenuView, from viewController: UIViewController, index currentViewControllerIndex: Int) {
        print(currentViewControllerIndex)
    }
    
    func didMoveToPage(_ pageMenu: PageMenuView, to viewController: UIViewController, index currentViewControllerIndex: Int) {
        print(currentViewControllerIndex)
    }
}

extension ViewControllers {
    
    //listの要素数の数だけViewControllerを作成
    func getViewControllers() -> [ViewController] {
        
        var viewControllers = [ViewController]()
        //Storyboardをインスタンス化する

        
        //なぜ2回繰り返す?
        for nameList in ["dolphin", "whale", "turtle", "shark", "stingray","とがみんブログ", "dolphin", "whale", "turtle", "shark", "stingray","とがみんブログ"] {
            
            
            //ストーリーボード取得
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            //ストーリボード上のwithIdentifierクラスを取得
            let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
            print(viewController)
            //let viewController = ViewController()
        
            viewController.title = nameList
            viewControllers.append(viewController as! ViewController)
            
            
            
        }
        print(viewControllers)
        return viewControllers
    }
    
    //ページメニューのオプション
    func getPageMenuOption() -> PageMenuOption {
        
        //ページメニューのサイズとポジション
        var option = PageMenuOption(frame:
            CGRect(x: 0, y: 20,
                   width: view.frame.size.width,
                   height: view.frame.size.height - 20))
        
        //メニューの高さ
        option.menuItemHeight = 44
        
        //メニューのサイズ
        option.menuTitleFont = .boldSystemFont(ofSize: 16)
        
        //メニュータイトルの色(未選択時)
        option.menuTitleColorNormal = .lightGray
        
        //メニュータイトルの色(選択時)
        option.menuTitleColorSelected = .black
        
        //メニューの背景色(未選択時)
        option.menuItemBackgroundColorNormal = .white
        
        //メニューの背景色
        option.menuItemBackgroundColorSelected = .white
        
        //アンダーラインの色
        option.menuIndicatorColor = .black
        return option
    }
    
}





















