//
//  QuesoController.swift
//  TareaAppleWatchCD
//
//  Created by Cristian Diaz on 20-12-15.
//  Copyright © 2015 AppArt. All rights reserved.
//

import WatchKit
import Foundation


class QuesoController: WKInterfaceController {

    @IBOutlet var pickerQuesos: WKInterfacePicker!
    
    @IBAction func pickerSelectedItemChanged(value: Int) {
        self.quesoSeleccionado  = value
    }
    
    @IBAction func irIngredientes() {
        if self.quesoSeleccionado != 0 {
            self.detalleNuevaPizza.detallePizza[2] = self.informacionPicker[self.quesoSeleccionado]
        } else {
            self.detalleNuevaPizza.detallePizza[2] = "0"
        }
        //print(self.informacionPicker[self.quesoSeleccionado])
        //print(detalleNuevaPizza.detallePizza[2])
        
        pushControllerWithName("SeleccionIngredientes", context: self.detalleNuevaPizza)
    }
    
    @IBAction func irMasa() {
        if self.quesoSeleccionado != 0 {
            self.detalleNuevaPizza.detallePizza[2] = self.informacionPicker[self.quesoSeleccionado]
        } else {
            self.detalleNuevaPizza.detallePizza[2] = "0"
        }
        //print(self.informacionPicker[self.quesoSeleccionado])
        //print(detalleNuevaPizza.detallePizza[2])
        
        pushControllerWithName("SeleccionMasa", context: self.detalleNuevaPizza)
    }
    
    var quesoSeleccionado = 0
    let informacionPicker : [String] = ["Elija queso", "Mozarela", "Cheddar", "Parmesano", "Sin queso"]
    var detalleNuevaPizza = DatosPizza()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        self.detalleNuevaPizza = context as! DatosPizza
        
        let total = self.informacionPicker.count
        var listadoTamaños: [WKPickerItem] = []
        for var i=0; i<total; i++ {
            let tamaño = WKPickerItem()
            tamaño.title = self.informacionPicker[i]
            listadoTamaños.append(tamaño)
        }
        self.pickerQuesos.setItems(listadoTamaños)
        
        if self.detalleNuevaPizza.detallePizza[2]=="0" {
            self.pickerQuesos.setSelectedItemIndex(0)
        } else if detalleNuevaPizza.detallePizza[2]=="Mozarela" {
            self.pickerQuesos.setSelectedItemIndex(1)
        } else if detalleNuevaPizza.detallePizza[2]=="Cheddar" {
            self.pickerQuesos.setSelectedItemIndex(2)
        } else if detalleNuevaPizza.detallePizza[2]=="Parmesano" {
            self.pickerQuesos.setSelectedItemIndex(3)
        } else if detalleNuevaPizza.detallePizza[2]=="Sin queso" {
            self.pickerQuesos.setSelectedItemIndex(4)
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
