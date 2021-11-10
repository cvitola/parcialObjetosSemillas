import parcelas.*
import plantas.*

object inta {
	const parcelas = []
	
	method promedioPlantas() = if (parcelas.size() > 0) parcelas.sum({ p => p.cantidadPlantas() }) / parcelas.size() else 0
	
	method masAutoSustentable() {
		const posiblesAutoSustentables = parcelas.filter({ p => p.cantidadPlantas() > 4 })
		if(posiblesAutoSustentables.size() > 0){
			posiblesAutoSustentables.masAutoSustentable()
			//llegue hasta aca.
		}
	}
}
