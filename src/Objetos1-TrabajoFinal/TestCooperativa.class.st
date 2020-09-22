Class {
	#name : #TestCooperativa,
	#superclass : #TestCase,
	#instVars : [
		'cooperativa'
	],
	#category : #'Objetos1-TrabajoFinal-test'
}

{ #category : #tests }
TestCooperativa >> agregarCuota: mes [
	^ cooperativa altaDeCuota: 100 mes: mes año: 2020
]

{ #category : #tests }
TestCooperativa >> altaDeSocio: dni tel: telefono [
	^ cooperativa altaDeSocio: dni tel: telefono
]

{ #category : #tests }
TestCooperativa >> pagoCuota: socio cuota: cuota [
	 cooperativa
		pagoCuota: socio nroSocio
		mes: cuota mes
		año: cuota año
		metodoDePago: cooperativa metodosDePago first
]

{ #category : #tests }
TestCooperativa >> pagoCuota: socio cuota: cuota metodo: unMetodo [
	cooperativa
		pagoCuota: socio nroSocio
		mes: cuota mes
		año: cuota año
		metodoDePago: unMetodo
]

{ #category : #running }
TestCooperativa >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
 cooperativa := Cooperativa new.
	
]

{ #category : #tests }
TestCooperativa >> testActualizarValorCouta [
	| cuota50 |
	cuota50 := self agregarCuota: 01.
	self assert: cuota50 valor equals: 100.
	cuota50 actualizarValor: 500.
	self assert: cuota50 valor equals: 500.
	self should: [ cuota50 actualizarValor: 0 ] raise: Error.
	self should: [ cuota50 actualizarValor: -1 ] raise: Error
]

{ #category : #tests }
TestCooperativa >> testActualizarvalorMatricula [
	| matricula |
	matricula := cooperativa matricula.
	self assert: matricula valor equals: 0.
	cooperativa actualizarValorMatricula: 500.
	self assert: matricula valor equals: 500.
	self should: [ cooperativa actualizarValorMatricula: 0 ] raise: Error.
	self
		should: [ cooperativa actualizarValorMatricula: -1 ]
		raise: Error
]

{ #category : #tests }
TestCooperativa >> testAgregarMetodosDePago [
	self assert: cooperativa metodosDePago size equals:3.
	cooperativa agregarMetodoDePago: 'Mercado Pago' comision: 3.
	self assert: cooperativa metodosDePago size equals:4.
	self should: [ cooperativa agregarMetodoDePago: '' comision: 3 ] raise: Error.
	self should: [ cooperativa agregarMetodoDePago: 'Mercado Pago' comision: 3 ] raise: Error.
	self should: [ cooperativa agregarMetodoDePago: 'Aaa' comision: -3 ] raise: Error
	
]

{ #category : #tests }
TestCooperativa >> testAltaDeCuota [
	self assert: cooperativa cuotas size equals: 0.
	cooperativa altaDeCuota: 500 mes: 1 año: 2021.
	self assert: cooperativa cuotas size equals: 1.
	self
		should: [ cooperativa altaDeCuota: 100 mes: 1 año: 2021 ]
		raise: Error.
	self
		should: [ cooperativa altaDeCuota: 0 mes: 10 año: 2021 ]
		raise: Error.
	self
		should: [ cooperativa altaDeCuota: 100 mes: 13 año: 2021 ]
		raise: Error
]

{ #category : #tests }
TestCooperativa >> testAltaDeEstudiante [
	| socio |
	socio := self altaDeSocio: 10 tel: 999.
	self assert: socio aCargo size equals: 0.
	socio
		altaEstudiante: 'Joan'
		grado: 1
		division: 'A'
		dni: 1010.
	self assert: socio aCargo size equals: 1.
	self
		should: [ socio
				altaEstudiante: 'Juan'
				grado: 2
				division: 'A'
				dni: 1010 ]
		raise: Error.
		socio
		altaEstudiante: 'Mirco'
		grado: 1
		division: 'A'
		dni: 1011.
	self assert: socio aCargo size equals: 2.
]

{ #category : #tests }
TestCooperativa >> testAltaSocio [
	self assert: cooperativa socios size equals: 0.
	cooperativa altaDeSocio: 1 tel: 294.
	self assert: cooperativa socios size equals: 1.
	self should: [ cooperativa altaDeSocio: 1 tel: 111 ] raise: Error
]

{ #category : #tests }
TestCooperativa >> testCalcularIngresos [
	| socio socio2 cuota cuota2 |
	socio := self altaDeSocio: 122 tel: 123.
	socio2 := self altaDeSocio: 121 tel: 124.
	cuota := self agregarCuota: 01.
	self
		assert:
			(cooperativa
				calcularIngresos: (Date year: 2020 day: 1)
				hasta: Date tomorrow)
		equals: 0.
	self pagoCuota: socio cuota: cuota.
	self
		assert:
			(cooperativa
				calcularIngresos: (Date year: 2020 day: 1)
				hasta: Date tomorrow)
		equals: 100.
	cuota2 := self agregarCuota: 02.
	self
		assert:
			(cooperativa
				calcularIngresos: (Date year: 2020 day: 1)
				hasta: Date tomorrow)
		equals: 100.
	self pagoCuota: socio2 cuota: cuota.
	self
		pagoCuota: socio2
		cuota: cuota2
		metodo: cooperativa metodosDePago last.	"15 de comision"
	self
		assert:
			(cooperativa
				calcularIngresos: (Date year: 2020 day: 1)
				hasta: Date tomorrow)
		equals: 285.	"100 + 100 + (100-15%)"
	self
		pagoCuota: socio
		cuota: cuota2
		metodo: (cooperativa metodosDePago at: 2).
	self
		assert:
			(cooperativa
				calcularIngresos: (Date year: 2020 day: 1)
				hasta: Date tomorrow)
		equals: 375	"285 + (100-10%)"
]

{ #category : #tests }
TestCooperativa >> testCobrarComision [

|comisionDel10 comisionDel15|
comisionDel10:= MetodoDePago new: 'test' comision: 10.
self assert: (comisionDel10 cobrarComision: 100) equals: 90.
comisionDel15 := MetodoDePago new: 'test2' comision: 15.
self assert: (comisionDel15 cobrarComision: 100) equals: 85.

]

{ #category : #tests }
TestCooperativa >> testConsultarPagos [
	| socio cuota cuota2 |
	socio := self altaDeSocio: 122 tel: 123.
	self
		assert: (cooperativa consultarPagos: socio nroSocio) size
		equals: 1.
	cuota := self agregarCuota: 01.
	self pagoCuota: socio cuota: cuota.
	self
		assert: (cooperativa consultarPagos: socio nroSocio) size
		equals: 2.
	cuota2 := self agregarCuota: 02.
	self pagoCuota: socio cuota: cuota2.
	self
		assert: (cooperativa consultarPagos: socio nroSocio) size
		equals: 3.
	self should: [ cooperativa consultarPagos: 9999 ] raise: Error
]

{ #category : #tests }
TestCooperativa >> testPagoDeCuota [
	| socio cuota cuota2 |
	socio := self altaDeSocio: 122 tel: 123.
	self assert: socio pagos size equals: 1.	"el primer pago es siempre la matricula"
	cuota := self agregarCuota: 01.
	self pagoCuota: socio cuota: cuota.
	self assert: socio pagos size equals: 2.
	self should: [ self pagoCuota: socio cuota: cuota ] raise: Error.
	cuota2 := self agregarCuota: 02.
	self pagoCuota: socio cuota: cuota2.
	self assert: socio pagos size equals: 3
]

{ #category : #tests }
TestCooperativa >> testSociosAlDia [
	| socio socio2 cuota cuota2 |
	socio := self altaDeSocio: 122 tel: 123.
	socio pagos first fecha: (Date year: 2020 day: 1).
	socio2 := self altaDeSocio: 121 tel: 124.
	socio2 pagos first fecha: (Date year: 2020 day: 1).
	cuota := self agregarCuota: 1.
	self assert: cooperativa sociosAlDia size equals: 0.
	self pagoCuota: socio cuota: cuota.
	self assert: cooperativa sociosAlDia first equals: socio.
	cuota2 := self agregarCuota: 02.
	self assert: cooperativa sociosAlDia size equals: 0.
	self pagoCuota: socio2 cuota: cuota.
	self pagoCuota: socio2 cuota: cuota2.
	self assert: cooperativa sociosAlDia first equals: socio2.
	self pagoCuota: socio cuota: cuota2.
	self assert: cooperativa sociosAlDia size equals: 2
]
