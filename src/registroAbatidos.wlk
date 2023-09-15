object registroAbatidosCOD {
	const registro = []
	
	method agregarAbatidosDia(cantidad, dia) {
		if(self.yaEstaElDia(dia)){
			self.error("Ya existe el dia")
		}
		registro.add([cantidad,dia])
	}
	
	method agregarAbatidosVariosDias(registrosAbatidos){
		registrosAbatidos.forEach({e => self.agregarAbatidosDia(e.get(0), e.get(1))})
		registro.addAll(registrosAbatidos)
	}
	
	method dia(reg) = reg.get(1)
	
	method cant(reg) = reg.first()
	
	method yaEstaElDia(dia) = registro.any({r => self.dia(r) == dia}) //any toma todos los valores de la lista, los recorre
	
	method registroDia(dia) = registro.find({r=> self.dia(r) == dia})
	
	method eliminarElRegistroDelDia(dia){
		   if(!self.yaEstaElDia(dia)){
		   	self.error("El día no esta en la lista")
		   }	
		   registro.remove(self.registroDia(dia))
	}
	
	method eliminarVariosRegistrosDeDias(listaDeDias){
		if(!listaDeDias.all({e => self.yaEstaElDia(e)})){
			self.error("Algún día de la lista no esta incluido en el registro")
		}
		listaDeDias.forEach{e => self.eliminarElRegistroDelDia(e)}
	}
	   method cantidadDeDiasRegistrados() = registro.size()
	   
	   method estaVacioElRegistro() = registro.isEmpty()
	   
	   method algunDiaAbatio(cantidad) = registro.any({r => self.cant(r) == cantidad })
	   
	   method primerValorDeAbatidos() = self.cant(registro.first())
	   
	   method ultimoValorDeAbatidos() = self.cant(registro.last())
	   
	   method maximoValorDeAbatidos() = registro.max({r => self.cant(r)}).first()
	   
	   method maximoValorDeAbatidosBis() = self.cant(registro.max( {r=>self.cant(r)}) )
	   
	   method maximoValorConMap() = registro.map({r => self.cant(r)}).max()
	   
	   method TotalAbatidos() = registro.sum({r => self.cant(r)})
	   
	   method cantidadDeAbatidosElDia(dia) = self.cant(self.registroDia(dia))
	   
	   method ultimoValorDeAbatidosConSize() = registro.get(registro.size()-1) //El size me dice el indice de alguna manera
	   
	   method esCrack() = (1..registro.size()-1).all({i => self.cant(registro.get(i)) > self.cant(registro.get(i-1))}) 
}