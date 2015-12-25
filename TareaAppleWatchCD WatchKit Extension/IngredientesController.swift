//
//  IngredientesController.swift
//  TareaAppleWatchCD
//
//  Created by Cristian Diaz on 20-12-15.
//  Copyright © 2015 AppArt. All rights reserved.
//

import WatchKit
import Foundation


class IngredientesController: WKInterfaceController {

    // MARK: - Link

    // Indice 0
    @IBOutlet var swJamon: WKInterfaceSwitch!
    @IBAction func swJamon(value: Bool) {
        agregarIngredientes(value, indice: 0)
    }
    
    // Indice 1
    @IBOutlet var swPepperoni: WKInterfaceSwitch!
    @IBAction func swPepperoni(value: Bool) {
        agregarIngredientes(value, indice: 1)
    }
    
    // Indice 2
    @IBOutlet var swPavo: WKInterfaceSwitch!
    @IBAction func swPavo(value: Bool) {
        agregarIngredientes(value, indice: 2)
    }
    
    // Indice 3
    @IBOutlet var swSalchicha: WKInterfaceSwitch!
    @IBAction func swSalchicha(value: Bool) {
        agregarIngredientes(value, indice: 3)
    }
    
    // Indice 4
    @IBOutlet var swAceituna: WKInterfaceSwitch!
    @IBAction func swAceituna(value: Bool) {
        agregarIngredientes(value, indice: 4)
    }
    
    // Indice 5
    @IBOutlet var swCebolla: WKInterfaceSwitch!
    @IBAction func swCebolla(value: Bool) {
        agregarIngredientes(value, indice: 5)
    }
    
    // Indice 6
    @IBOutlet var swPimiento: WKInterfaceSwitch!
    @IBAction func swPimiento(value: Bool) {
        agregarIngredientes(value, indice: 6)
    }
    
    // Indice 7
    @IBOutlet var swPiña: WKInterfaceSwitch!
    @IBAction func swPiña(value: Bool) {
        agregarIngredientes(value, indice: 7)
    }
    
    // Indice 8
    @IBOutlet var swAnchoa: WKInterfaceSwitch!
    @IBAction func swAnchoa(value: Bool) {
        agregarIngredientes(value, indice: 8)
    }
    
    @IBAction func irQueso() {
        pushControllerWithName("SeleccionQueso", context: self.detalleNuevaPizza)
    }
    
    @IBAction func irConfirmacion() {
        pushControllerWithName("Confirmacion", context: self.detalleNuevaPizza)
    }

    
    
    // MARK: - Variables

    var listaSwitch:[WKInterfaceSwitch] = []
    var ingredientesSeleccionados = 0
    let informacionSwitch : [String] = ["Jamón", "Pepperoni", "Pavo", "Salchicha", "Aceituna", "Cebolla", "Pimiento", "Piña", "Anchoa"]
    var detalleNuevaPizza = DatosPizza()
    
    // MARK: - Funciones
    
    func agregarIngredientes(resultadoSwitch: Bool, indice: Int) {
        if resultadoSwitch == true {
            if self.detalleNuevaPizza.ingredientesSeleccionados == 5 {
                self.listaSwitch[indice].setOn(false)
                let OK = WKAlertAction(title: "OK", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
                })
                self.presentAlertControllerWithTitle("Atención", message: "Ya tiene 5 ingredientes seleccionados.", preferredStyle: WKAlertControllerStyle.Alert, actions: [OK])
            } else {
                self.detalleNuevaPizza.ingredientesSeleccionados = self.detalleNuevaPizza.ingredientesSeleccionados + 1
                let seleccionado = buscaIngrediente(self.detalleNuevaPizza.detallePizza, ing: "0")
                self.detalleNuevaPizza.detallePizza[seleccionado] = self.informacionSwitch[indice]
            }
        } else {
            self.detalleNuevaPizza.ingredientesSeleccionados = self.detalleNuevaPizza.ingredientesSeleccionados - 1
            let seleccionado = buscaIngrediente(self.detalleNuevaPizza.detallePizza, ing: self.informacionSwitch[indice])
            self.detalleNuevaPizza.detallePizza[seleccionado] = "0"
        }
    }
    
    
    func buscaIngrediente(listadoTemporal: [String], ing: String) -> Int {
        var i: Int
        for i = 3; i<8; i++ {
            if listadoTemporal[i] == ing {
                return i
            }
        }
        return 999
    }
    
    func crearListaSwitch() -> [WKInterfaceSwitch] {
        var lista:[WKInterfaceSwitch] = []
        lista.append(self.swJamon)
        lista.append(self.swPepperoni)
        lista.append(self.swPavo)
        lista.append(self.swSalchicha)
        lista.append(self.swAceituna)
        lista.append(self.swCebolla)
        lista.append(self.swPimiento)
        lista.append(self.swPiña)
        lista.append(self.swAnchoa)
        return lista
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        self.detalleNuevaPizza = context as! DatosPizza
        
        self.listaSwitch = crearListaSwitch()
        let total = self.informacionSwitch.count
        
        for sw in self.listaSwitch {
            sw.setOn(false)
        }

        self.detalleNuevaPizza.ingredientesSeleccionados = 0
        
        for j in 3...7 {
            if self.detalleNuevaPizza.detallePizza[j] != "0" {
                for var i=0; i<total; i++ {
                    if self.detalleNuevaPizza.detallePizza[j] == self.informacionSwitch[i] {
                        self.listaSwitch[i].setOn(true)
                        self.detalleNuevaPizza.ingredientesSeleccionados = self.detalleNuevaPizza.ingredientesSeleccionados + 1
                        i=999 //salida del loop FOR
                    }
                }
            }
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
