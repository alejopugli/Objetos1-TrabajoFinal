Class {
	#name : #TestCooperativa,
	#superclass : #TestCase,
	#instVars : [
		'cooperativa'
	],
	#category : #'Objetos1-TrabajoFinal'
}

{ #category : #tests }
TestCooperativa >> agregarCuota: mes [ 

 ^cooperativa altaDeCouta: mes año:2020 valor:50.
]

{ #category : #tests }
TestCooperativa >> altaDeSocio: telefono DNI: dni [

	^cooperativa altaDeSocio: telefono DNI: dni.
]

{ #category : #tests }
TestCooperativa >> pagoCuota: socio cuota: cuota [
	cooperativa
		pagoCuota: socio nroSocio
		mes: cuota mes
		año: cuota año
		metodoDePago: cooperativa metodoDePago first
]

{ #category : #tests }
TestCooperativa >> testActualizarCostoMatricula [
	| matricula |
	matricula := cooperativa matricula.
	self assert: matricula valor equals: 50.
	cooperativa actualizarCostoMatricula: 500.
	self assert: matricula valor equals: 500.
	self should: [ cooperativa actualizarCostoMatricula: 0 ] raise: Error.
	self should: [ cooperativa actualizarCostoMatricula: -1 ] raise: Error
]

{ #category : #tests }
TestCooperativa >> testActualizarValorCouta [
	| cuota50 |
	cuota50 := self altaDeCouta: 01 año: 2020 valor: 50.
	self assert: cuota50 valor equals: 50.
	cuota50 actualizarValor: 500.
	self assert: cuota50 valor equals: 500.
	self should: [ cuota50 actualizarValor: 0 ] raise: Error.
	self should: [ cuota50 actualizarValor: -1 ] raise: Error.
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

	self assert: cooperativa coutas equals: 0.
	cooperativa altaDeCuota: 01 años: 2021 valor: 500.
	self assert: cooperativa coutas equals: 1.
	self should: [ cooperativa altaDeCuota: 01 años: 2021 valor: 100 ] raise: Error.
]

{ #category : #tests }
TestCooperativa >> testAltaSocio [
	self assert: cooperativa socios equals: 0.
	cooperativa altaSocio: 1 tel: 294.
	self assert: cooperativa socios equals: 1.
	self should: [ cooperativa altaSocio: 1 tel: 111 ] raise: Error.
]

{ #category : #tests }
TestCooperativa >> testConsultarCuotas [
	| socio cuota cuota2 |
	socio := self altaDeSocio: 122 DNI: 123.
	self assert: (cooperativa consultarCuotas: socio nroSocio) equals: 0.
	cuota := self agregarCuota: 01.
	self pagoCuota: socio cuota: cuota.
	self assert: (cooperativa consultarCuotas: socio nroSocio )equals: 1.
	cuota2 := self agregarCuota: 02.
	self pagoCuota: socio cuota: cuota2.
	self assert: (cooperativa consultarCuotas: socio nroSocio) equals: 2
]

{ #category : #tests }
TestCooperativa >> testSociosAlDia [
	| socio socio2 cuota cuota2 |
	socio := self altaDeSocio: 122 DNI: 123.
	socio2 := self altaDeSocio: 122 DNI: 124.
	cuota := self agregarCuota: 01.
	self assert: (cooperativa sociosAlDia )size equals: 0.
	self pagoCuota: socio cuota: cuota.
	self assert: (cooperativa sociosAlDia first) equals: socio.
	cuota2 := self agregarCuota: 02.
	self assert: (cooperativa sociosAlDia) size equals: 0.
	self pagoCuota: socio2 cuota: cuota.
	self pagoCuota: socio2 cuota: cuota2.
	self assert: (cooperativa sociosAlDia first) equals: socio2.
	self pagoCuota: socio cuota: cuota2.
	self assert: (cooperativa sociosAlDia) size equals: 2
]
