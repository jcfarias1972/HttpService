//
//  ViewController.swift
//  HttpService
//
//  Created by Juan Carlos Farías Arredondo on 09/03/16.
//  Copyright © 2016 Comisión Federal de Electricidad DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var isbn: UITextField!
    @IBOutlet weak var isbnTexto: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sincrono()
        //asincrono()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func isbnAction4(sender: AnyObject) {
        sincrono()
    }

    func sincrono() {
        isbnTexto.text=""
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:\(self.isbn.text!)"
        let url = NSURL(string: urls)
        let datos:NSData? = NSData(contentsOfURL: url!)
        if datos == nil {
            
            let alerta = UIAlertController(title: "¡ Error en la red !",
                message: "Verifique su conexión.",
                preferredStyle: UIAlertControllerStyle.Alert)
            let accion2 = UIAlertAction(title: "OK",
                style: UIAlertActionStyle.Cancel) { _ in
            }
            alerta.addAction(accion2)
            self.presentViewController(alerta, animated: true, completion: nil)
            
        }else{
            let texto = NSString(data:datos!, encoding:NSUTF8StringEncoding)
            if texto == "{}"{
                let alerta = UIAlertController(title: "¡ Inexistente !",
                    message: "Verifique su ISBN",
                    preferredStyle: UIAlertControllerStyle.Alert)
                let accion2 = UIAlertAction(title: "OK",
                    style: UIAlertActionStyle.Cancel) { _ in
                }
                alerta.addAction(accion2)
                self.presentViewController(alerta, animated: true, completion: nil)
            }else{
                isbnTexto.text=texto! as String
            }
           
        }
    }

}

