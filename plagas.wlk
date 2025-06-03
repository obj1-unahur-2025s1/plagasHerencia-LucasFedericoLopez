class Plaga {
  var poblacion
  method transmitenEnfermedades() = poblacion >= 10 && self.condicionAdicional()
  method condicionAdicional()
  method nivelDaño() = poblacion
  method atacarA(unElemento){
    unElemento.recibirAtaqueDe(self)
    self.atacar()
  }
  method atacar(){
      poblacion = poblacion + poblacion * 0.10
    }
}
class Cucarachas inherits Plaga{
  var pesoPromedioBicho
  override method nivelDaño() = super() / 2
  override method condicionAdicional() = pesoPromedioBicho >= 10
  override method atacar(){
    super()
    pesoPromedioBicho += 2
  }
}
class Pulgas inherits Plaga{
  override method nivelDaño() = super() * 2
}
class Garrapatas inherits Pulgas{
  override method atacar(){
    poblacion = poblacion + poblacion * 0.20
  }
}
class Mosquitos inherits Plaga{
  override method condicionAdicional() = poblacion % 3 == 0
}