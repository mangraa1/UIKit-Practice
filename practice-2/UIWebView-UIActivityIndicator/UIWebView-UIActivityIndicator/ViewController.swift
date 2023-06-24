//
//  ViewController.swift
//  UIWebView-UIActivityIndicator
//
//  Created by mac on 23.06.2023.
//

import UIKit
import WebKit
import SnapKit

final class ViewController: UIViewController, WKNavigationDelegate {

    //MARK: - Variables

    let webView = WKWebView()
    let toolbar = UIToolbar()

    let backButtonItem = UIBarButtonItem(systemItem: .rewind)
    let fixedSpacer = UIBarButtonItem(systemItem: .fixedSpace)
    let forwardButtonItem = UIBarButtonItem(systemItem: .fastForward)
    let flexibleSpacer = UIBarButtonItem(systemItem: .flexibleSpace)
    let refreshItem = UIBarButtonItem(systemItem: .refresh)

    let activityIndicator = UIActivityIndicatorView(style: .medium)

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(activityIndicator)

        webView.navigationDelegate = self

        setupWebViewWithToolBar()
        loadRequest()

    }

    //MARK: - private

    private func setupWebViewWithToolBar() {
        view.addSubview(webView)
        view.addSubview(toolbar)

        toolbar.barTintColor = .systemBlue
        toolbar.tintColor = .white
        toolbar.items = [backButtonItem, fixedSpacer, forwardButtonItem, flexibleSpacer, refreshItem]

        webView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(toolbar.snp.top)
        }

        toolbar.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }

        backButtonItem.action = #selector(goBackAction)
        forwardButtonItem.action = #selector(goForwardAction)
        refreshItem.action = #selector(refreshAction)

    }

    private func loadRequest() {
        guard let url = URL(string: "https://www.google.com") else { return }

        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }

    //MARK: - Actions

    @objc func goBackAction() {
        guard webView.canGoBack else { return }
        webView.goBack()
    }

    @objc func goForwardAction() {
        guard webView.canGoForward else { return }
        webView.goForward()
    }

    @objc func refreshAction() {
        webView.reload()
    }

    //MARK: - Custom functions

    func activityIndicatorStartLoading() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        webView.isHidden = true

        activityIndicator.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
    }

    func activityIndicatorStopLoading() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        webView.isHidden = false
    }

    //MARK: WKNavigationDelegate

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        backButtonItem.isEnabled = webView.canGoBack
        forwardButtonItem.isEnabled = webView.canGoForward
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicatorStopLoading()
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicatorStopLoading()
    }
}

