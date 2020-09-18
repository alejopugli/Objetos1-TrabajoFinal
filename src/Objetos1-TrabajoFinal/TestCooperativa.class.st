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

 ^cooperativa altaDeCuota: 50 mes: mes año:2021 
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
		metodoDePago: cooperativa metodoDePago first
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
	self assert: cuota50 valor equals: 50.
	cuota50 actualizarValor: 500.
	self assert: cuota50 valor equals: 500.
	self should: [ cuota50 actualizarValor: 0 ] raise: Error.
	self should: [ cuota50 actualizarValor: -1 ] raise: Error.
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
	self assert: cooperativa calcularIngresos equals: 0.
	self pagoCuota: socio cuota: cuota.
	self
		assert: cooperativa calcularIngresos
		equals:
			(cooperativa socios
				sumNumbers: [ socio pagos sumNumbers: [ :each | each monto ] ]).
	cuota2 := self agregarCuota: 02.
	self
		assert: cooperativa calcularIngresos
		equals:
			(cooperativa socios
				sumNumbers: [ socio pagos sumNumbers: [ :each | each monto ] ]).
	self pagoCuota: socio2 cuota: cuota.
	self pagoCuota: socio2 cuota: cuota2.
	self
		assert: cooperativa calcularIngresos
		equals:
			(cooperativa socios
				sumNumbers: [ socio pagos sumNumbers: [ :each | each monto ] ]).
	self pagoCuota: socio cuota: cuota2.
	self
		assert: cooperativa calcularIngresos
		equals:
			(cooperativa socios
				sumNumbers: [ socio pagos sumNumbers: [ :each | each monto ] ])
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
TestCooperativa >> testConsultarCuotas [
	| socio cuota cuota2 |
	socio := self altaDeSocio: 122 tel: 123.
	self assert: (cooperativa consultarCuotas: socio nroSocio) equals: 0.
	cuota := self agregarCuota: 01.
	self pagoCuota: socio cuota: cuota.
	self assert: (cooperativa consultarCuotas: socio nroSocio) equals: 1.
	cuota2 := self agregarCuota: 02.
	self pagoCuota: socio cuota: cuota2.
	self assert: (cooperativa consultarCuotas: socio nroSocio) equals: 2
]

{ #category : #tests }
TestCooperativa >> testPagoDeCuota [
	| socio cuota cuota2 |
	socio := self altaDeSocio: 122 tel: 123.
	cuota := self agregarCuota: 01.
	self pagoCuota: socio cuota: cuota.
	self assert: socio pagos size equals: 1.
	self should: [ self pagoCuota: socio cuota: cuota ] raise: Error.
	cuota2 := self agregarCuota: 02.
	self pagoCuota: socio cuota: cuota2.
	self assert: socio pagos size equals: 2
]

{ #category : #tests }
TestCooperativa >> testSociosAlDia [
	| socio socio2 cuota cuota2 |
	socio := self altaDeSocio: 122 tel: 123.
	socio2 := self altaDeSocio: 121 tel: 124.
	cuota := self agregarCuota: 01.
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
