//
//  InterfaceController.swift
//  TareaAppleWatchCD WatchKit Extension
//
//  Created by Cristian Diaz on 20-12-15.
//  Copyright © 2015 AppArt. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBAction func crearPizza() {
        let detalleNuevaPizza = DatosPizza()
        detalleNuevaPizza.pizzaLista = 0
        detalleNuevaPizza.ingredientesSeleccionados = 0
        for var i=0; i<8; i++ {
            detalleNuevaPizza.detallePizza[i] = "0"
        }
        
        //detalleNuevaPizza.detallePizza[3] = "Salchicha"
        //detalleNuevaPizza.detallePizza[4] = "Aceituna"
        //detalleNuevaPizza.detallePizza[5] = "Cebolla"
        //detalleNuevaPizza.detallePizza[6] = "Anchoa"
        //detalleNuevaPizza.detallePizza[7] = "Piña"
        
        pushControllerWithName("SeleccionTamaño", context: detalleNuevaPizza)
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
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
