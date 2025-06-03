import plagas.*

class Hogar {
    var property mugre 
    const property confort 
    method esBueno() = mugre >= confort / 2
    method recibirAtaqueDe(unaPlaga){
      mugre += unaPlaga.nivelDaño()
    }
}
class Huerta {
    var property produccion
    method esBueno() =  produccion > nivelMinimoProduccion.valor()
    method recibirAtaqueDe(unaPlaga){
      produccion = 0.max(produccion - (unaPlaga.nivelDaño() * 0.1 + 
      if(unaPlaga.transmitenEnfermedades()) 10 else 0))
    }
}
object nivelMinimoProduccion {
  var property valor = 100 
}
class Mascota {
  var property salud
  method esBueno() = salud > 250
  method recibirAtaqueDe(unaPlaga){
    if(unaPlaga.transmitenEnfermedades()){
      salud = 0.max(salud - unaPlaga.nivelDaño())
    }
  }
}
class Barrio {
    const elementos = []
    method esUnElementoBueno(unElemento) = unElemento.esBueno()
    method cantElementosBuenos() = elementos.count({e=>e.esBueno()})
    method cantElementosNoBuenos() = elementos.count({e=> not e.esBueno()})
    method esCopado() = self.cantElementosBuenos() > self.cantElementosNoBuenos()
}
