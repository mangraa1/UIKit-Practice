//
//  ViewController.swift
//  WKWebView practic
//
//  Created by mac on 29.05.2023.
//

import UIKit
import WebKit
import SnapKit

class ViewController: UIViewController {

    let webView = WKWebView()
    let toolbar = UIToolbar()

    let backButtonItem = UIBarButtonItem(systemItem: .rewind)
    let forwardButtonItem = UIBarButtonItem(systemItem: .fastForward)
    let spacer = UIBarButtonItem(systemItem: .flexibleSpace)
    let refreshButtonItem = UIBarButtonItem(systemItem: .refresh)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(webView)

        webView.navigationDelegate = self

        view.addSubview(toolbar)

        toolbar.items = [backButtonItem, forwardButtonItem, spacer, refreshButtonItem]

        loadRequest()

        backButtonItem.action = #selector(backAction)
        forwardButtonItem.action = #selector(forwardAction)
        refreshButtonItem.action = #selector(refreshAction)

        //MARK: - Constraints

        webView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(toolbar.snp.top)
        }

        toolbar.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }

    //MARK: - Actions

    @objc func backAction() {
        guard webView.canGoBack else { return }
        webView.goBack()
    }

    @objc func forwardAction() {
        guard webView.canGoForward else { return }
        webView.goForward()
    }

    @objc func refreshAction() {
        webView.reload()
    }

    //MARK: - private

    private func loadRequest() {
        guard let url = URL(string: "https://www.google.com") else { return }

        let urlRequest = URLRequest(url: url)

        webView.load(urlRequest)
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {

        let url = navigationAction.request.url?.absoluteString

        if url!.contains("apple") {
            let url = URL(string: "https:/www.youtube.com")
            webView.load(URLRequest(url: url!))
            decisionHandler(.cancel)
        } else {
            decisionHandler(.allow )
        }
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
         print("didCommit")
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("didFinish")

        backButtonItem.isEnabled = webView.canGoBack
        forwardButtonItem.isEnabled = webView.canGoForward
    }
}

