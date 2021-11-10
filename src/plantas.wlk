import parcelas.*

class Planta{
	var property anioObtencion
	var property altura
	
	method horasSolTolera()
	method esFuerte() = self.horasSolTolera() > 10
	method daNuevasSemillas()
	method espacioOcupa()
	method parcelaIdeal(parcela)
	}
	
class Menta inherits Planta{
	
	override method horasSolTolera() = 6 
	
	override method daNuevasSemillas() = self.esFuerte() or altura > 0.4
	
	override method espacioOcupa() = altura * 3
	
	override method parcelaIdeal(parcela) = parcela.superficie() > 6
}

class Soja inherits Planta{
	
	override method horasSolTolera(){
		if(altura <0.5){
			return 6
		}else if(altura < 1){
			return 7
		}else{
			return 9
		}
	}
	
	override method daNuevasSemillas() = anioObtencion > 2007 and altura > 1
	
	override method espacioOcupa() = altura / 2
	
	override method parcelaIdeal(parcela) = self.horasSolTolera() == parcela.horasSol()
}

class Quinoa inherits Planta{
	//cuando instancio Quinoa se le setea el valor, por eso debe recordarlo.
	var property horasSolTolera
	
	override method horasSolTolera() = horasSolTolera
	
	override method daNuevasSemillas() = anioObtencion < 2005
	
	override method espacioOcupa() = 0.5
	
	override method parcelaIdeal(parcela) = parcela.hayPlantasBajaAltura()
	
	
}


class SojaTransgenica inherits Soja{
	
	override method daNuevasSemillas () = false
	
	override method parcelaIdeal(parcela) = parcela.cantidadPlantas() == 1
	
}

class HierbaBuena inherits Menta{
	override method espacioOcupa() = super() * 3
}