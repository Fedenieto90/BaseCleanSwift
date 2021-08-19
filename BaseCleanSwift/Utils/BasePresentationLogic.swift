//
//  BasePresentationLogic.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 19/08/2021.
//

protocol BasePresentationLogic: AnyObject {

    func showProgress()
    func removeProgress()
}

protocol BaseDisplayLogic: AnyObject {

    func showProgressHUD()
    func removeProgressHUD()
}
