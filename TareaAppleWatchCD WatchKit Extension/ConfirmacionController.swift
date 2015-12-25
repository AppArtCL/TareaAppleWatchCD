//
//  ConfirmacionController.swift
//  TareaAppleWatchCD
//
//  Created by Cristian Diaz on 24-12-15.
//  Copyright © 2015 AppArt. All rights reserved.
//

import WatchKit
import Foundation


class ConfirmacionController: WKInterfaceController {

    @IBOutlet var etiquetaTamaño: WKInterfaceLabel!
    @IBOutlet var etiquetaMasa: WKInterfaceLabel!
    @IBOutlet var etiquetaQueso: WKInterfaceLabel!
    @IBOutlet var etiquetaIngredientes: WKInterfaceLabel!
    
    @IBAction func cancelarPedido() {        
        let OK = WKAlertAction(title: "OK", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
            self.pushControllerWithName("PantallaInicio", context: self.detalleNuevaPizza)
        })
        self.presentAlertControllerWithTitle("Pedido Cancelado", message: "El pedido de su pizza ha sido cancelado.", preferredStyle: WKAlertControllerStyle.Alert, actions: [OK])
    }
    
    @IBAction func procesarPedido() {
        if self.pizzaLista == true {
            let OK = WKAlertAction(title: "OK", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
                self.pushControllerWithName("PantallaInicio", context: self.detalleNuevaPizza)
            })
            self.presentAlertControllerWithTitle("Pedido Confirmado", message: "Su pizza ha sido confirmada y entrará al horno.", preferredStyle: WKAlertControllerStyle.Alert, actions: [OK])
        } else {
            let OK = WKAlertAction(title: "OK", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
            })
            self.presentAlertControllerWithTitle("Atención", message: "A su pizza le faltan selecciones.", preferredStyle: WKAlertControllerStyle.Alert, actions: [OK])
        }
    }
    
    var detalleNuevaPizza = DatosPizza()
    var pizzaLista = true
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        self.detalleNuevaPizza = context as! DatosPizza
        
        if self.detalleNuevaPizza.detallePizza[0] != "0" {
            self.etiquetaTamaño.setText(self.detalleNuevaPizza.detallePizza[0])
        } else {
            self.etiquetaTamaño.setText("Elija uno.")
            self.pizzaLista = false
        }
        
        if self.detalleNuevaPizza.detallePizza[1] != "0" {
            self.etiquetaMasa.setText(self.detalleNuevaPizza.detallePizza[1])
        } else {
            self.etiquetaMasa.setText("Elija uno.")
            self.pizzaLista = false
        }
        
        if self.detalleNuevaPizza.detallePizza[0] != "0" {
            self.etiquetaQueso.setText(self.detalleNuevaPizza.detallePizza[2])
        } else {
            self.etiquetaQueso.setText("Elija uno.")
            self.pizzaLista = false
        }
        
        var textoIngredientes = ""
        for i in 3...7 {
            if textoIngredientes == "" {
                if self.detalleNuevaPizza.detallePizza[i] != "0" {
                    textoIngredientes = textoIngredientes + self.detalleNuevaPizza.detallePizza[i]
                }
            } else {
                if self.detalleNuevaPizza.detallePizza[i] != "0" {
                    textoIngredientes = textoIngredientes + ", " + self.detalleNuevaPizza.detallePizza[i]
                }
            }
        }
        if textoIngredientes == "" {
            self.etiquetaIngredientes.setText("Seleccione al menos uno.")
            self.pizzaLista = false
        } else {
            textoIngredientes = textoIngredientes + "."
            self.etiquetaIngredientes.setText(textoIngredientes)
        }        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
