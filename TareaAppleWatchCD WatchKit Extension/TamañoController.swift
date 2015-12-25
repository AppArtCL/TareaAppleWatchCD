//
//  TamañoController.swift
//  TareaAppleWatchCD
//
//  Created by Cristian Diaz on 20-12-15.
//  Copyright © 2015 AppArt. All rights reserved.
//

import WatchKit
import Foundation


class TamañoController: WKInterfaceController {

    var tamañoSeleccionado = 0
    let informacionPicker : [String] = ["Elija tamaño", "Chica", "Mediana", "Grande"]
    var detalleNuevaPizza = DatosPizza()
    
    @IBOutlet var pickerTamaños: WKInterfacePicker!
    @IBAction func pickerSelectedItemChanged(value: Int) {
        self.tamañoSeleccionado  = value
    }
    
    @IBAction func irMasa() {
        if self.tamañoSeleccionado != 0 {
            self.detalleNuevaPizza.detallePizza[0] = self.informacionPicker[self.tamañoSeleccionado]
        } else {
            self.detalleNuevaPizza.detallePizza[0] = "0"
        }
//        print(self.informacionPicker[self.tamañoSeleccionado])
//        print(detalleNuevaPizza.detallePizza[0])
        
        pushControllerWithName("SeleccionMasa", context: self.detalleNuevaPizza)
    }
    
    @IBAction func cancelarPedido() {
        let OK = WKAlertAction(title: "OK", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
            self.pushControllerWithName("PantallaInicio", context: self.detalleNuevaPizza)
        })
        self.presentAlertControllerWithTitle("Pedido Cancelado", message: "El pedido de su pizza ha sido cancelado.", preferredStyle: WKAlertControllerStyle.Alert, actions: [OK])
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        self.setTitle("")
        
        self.detalleNuevaPizza = context as! DatosPizza
        
        let total = self.informacionPicker.count
        var listadoTamaños: [WKPickerItem] = []
        for var i=0; i<total; i++ {
            let tamaño = WKPickerItem()
            tamaño.title = self.informacionPicker[i]
            listadoTamaños.append(tamaño)
        }
        self.pickerTamaños.setItems(listadoTamaños)
        
        if self.detalleNuevaPizza.detallePizza[0]=="0" {
            self.pickerTamaños.setSelectedItemIndex(0)
        } else if detalleNuevaPizza.detallePizza[0]=="Chica" {
            self.pickerTamaños.setSelectedItemIndex(1)
        } else if detalleNuevaPizza.detallePizza[0]=="Mediana" {
            self.pickerTamaños.setSelectedItemIndex(2)
        } else if detalleNuevaPizza.detallePizza[0]=="Grande" {
            self.pickerTamaños.setSelectedItemIndex(3)
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
