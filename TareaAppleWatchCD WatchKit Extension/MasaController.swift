//
//  MasaController.swift
//  TareaAppleWatchCD
//
//  Created by Cristian Diaz on 20-12-15.
//  Copyright © 2015 AppArt. All rights reserved.
//

import WatchKit
import Foundation


class MasaController: WKInterfaceController {

    @IBOutlet var pickerMasas: WKInterfacePicker!
    @IBAction func pickerSelectedItemChanged(value: Int) {
        self.masaSeleccionada  = value
    }
    @IBAction func irQueso() {
        if self.masaSeleccionada != 0 {
            self.detalleNuevaPizza.detallePizza[1] = self.informacionPicker[self.masaSeleccionada]
        } else {
            self.detalleNuevaPizza.detallePizza[1] = "0"
        }
        //print(self.informacionPicker[self.masaSeleccionada])
        //print(detalleNuevaPizza.detallePizza[1])
        
        pushControllerWithName("SeleccionQueso", context: self.detalleNuevaPizza)
    }
    
    @IBAction func irTamaño() {
        if self.masaSeleccionada != 0 {
            self.detalleNuevaPizza.detallePizza[1] = self.informacionPicker[self.masaSeleccionada]
        } else {
            self.detalleNuevaPizza.detallePizza[1] = "0"
        }
        //print(self.informacionPicker[self.masaSeleccionada])
        //print(detalleNuevaPizza.detallePizza[1])
        
        pushControllerWithName("SeleccionTamaño", context: self.detalleNuevaPizza)
    }
    
    
    var masaSeleccionada = 0
    let informacionPicker : [String] = ["Elija masa", "Delgada", "Crujiente", "Gruesa"]
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
        self.pickerMasas.setItems(listadoTamaños)
        
        if self.detalleNuevaPizza.detallePizza[1]=="0" {
            self.pickerMasas.setSelectedItemIndex(0)
        } else if detalleNuevaPizza.detallePizza[1]=="Delgada" {
            self.pickerMasas.setSelectedItemIndex(1)
        } else if detalleNuevaPizza.detallePizza[1]=="Crujiente" {
            self.pickerMasas.setSelectedItemIndex(2)
        } else if detalleNuevaPizza.detallePizza[1]=="Gruesa" {
            self.pickerMasas.setSelectedItemIndex(3)
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
