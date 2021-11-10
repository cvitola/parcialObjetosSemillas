import plantas.*

class Parcela{
	var property ancho
	var property largo
	var property horasSol
	const plantas = []
	
	method superficie() = ancho * largo
	
	method cantidadMaximaPlantas() = 
		if (ancho > largo) self.superficie() / 5 else self.superficie() / 3 + largo
	
	method tieneComplicaciones() = plantas.any({ p=> p.horasSolTolera() < horasSol })
	
	method agregarPlanta(unaPlanta){
		if(self.cantidadPlantas() < self.cantidadMaximaPlantas() and horasSol <= unaPlanta.horasSolTolera()+2){
			plantas.add(unaPlanta)
		}else{
			self.error("La planta no se puede plantar.")
		}  
	}
	
	method hayPlantasBajaAltura() = plantas.all( { p => p.altura() < 1.5})
	
	method cantidadPlantas() = plantas.size()
	
	method seAsociaBien(unaPlanta) = false
	
}

class Ecologica inherits Parcela{
	
	override method seAsociaBien(unaPlanta) = !self.tieneComplicaciones() and unaPlanta.parcelaIdeal(self)
}

class Industrial inherits Parcela{
	
	override method seAsociaBien(unaPlanta) = self.cantidadPlantas() < 2 and unaPlanta.esFuerte()
}