Class {
	#name : #Cooperativa,
	#superclass : #Object,
	#instVars : [
		'matricula',
		'cuotas',
		'socios',
		'metodosDePago'
	],
	#category : #'Objetos1-TrabajoFinal-model'
}

{ #category : #tests }
Cooperativa >> actualizarValorCuota: nuevoValor mes: unMes año: unAño [

^(cuotas detect: [ :each| each mes = unMes and: each año = unAño ] ifNone:[^ Error signal:'no existe la cuota indicada'] ) actualizarValor: nuevoValor.

]

{ #category : #tests }
Cooperativa >> actualizarValorMatricula: nuevoValor [

^ matricula actualizarValor: nuevoValor.
]

{ #category : #initialization }
Cooperativa >> agregarMetodoDePago: unNombre comision: unaComision [
	| nuevoMetodo |
	(unNombre = '' or: unaComision <0 )
		ifTrue: [ ^ Error signal ].
	metodosDePago
		detect: [ :each | each nombre = unNombre ]
		ifFound: [ ^ Error signal ].
	nuevoMetodo := MetodoDePago new: unNombre comision: unaComision.
	metodosDePago add: nuevoMetodo.
	^ nuevoMetodo
]

{ #category : #tests }
Cooperativa >> altaDeCuota: valor mes: unMes año: unAño [
	| nuevaCuota |
	(unAño >= Date today year and: valor > 0)
		ifTrue: [ (0 < unMes and: unMes < 13)
				ifFalse: [ ^ Error signal ] ]
		ifFalse: [ ^ Error signal ].
	cuotas
		detect: [ :each | each mes = unMes and: each año = unAño ]
		ifFound: [ ^ Error signal ].
	nuevaCuota := Cuota new: valor mes: unMes año: unAño.
	cuotas add: nuevaCuota.
	^ nuevaCuota
]

{ #category : #tests }
Cooperativa >> altaDeSocio: unDNI tel: telefono [
	| nuevoSocio |
	unDNI = 0
		ifTrue: [ ^ Error signal ].
	socios
		detect: [ :each | each dni = unDNI ]
		ifFound: [ ^ Error signal ].
	nuevoSocio := Socio new: socios size tel: telefono DNI: unDNI.
	nuevoSocio pagoMatricula: matricula  metodoDePago: metodosDePago first. 
	socios add: nuevoSocio.
	"alta de estudiante?"
	^ nuevoSocio
]

{ #category : #calculations }
Cooperativa >> calcularIngresos: fromDate hasta: toDate [
	^ socios
		sumNumbers: [ :each | each calcularPagos: fromDate hasta: toDate ]
]

{ #category : #accessing }
Cooperativa >> consultarPagos: unNroSocio [
	^(socios detect: [ :each | each nroSocio = unNroSocio  ]) pagos
]

{ #category : #accessing }
Cooperativa >> cuotas [
	^ cuotas
]

{ #category : #initialization }
Cooperativa >> initialize [
	socios := OrderedCollection new.
	cuotas := OrderedCollection new.
	matricula := Matricula new: 0.
	metodosDePago := OrderedCollection new.
	self agregarMetodoDePago: 'Transferencia' comision: 0.
	self agregarMetodoDePago: 'PagoFacil' comision: 10.
	self agregarMetodoDePago: 'Kiosko' comision: 15.
	^self
]

{ #category : #accessing }
Cooperativa >> matricula [
	^ matricula
]

{ #category : #accessing }
Cooperativa >> metodosDePago [
	^ metodosDePago
]

{ #category : #adding }
Cooperativa >> pagoCuota: unNroSocio mes: mes año: año metodoDePago: unMetodoDePago [
	| cuota |
	cuota := cuotas
		detect: [ :each | each mes = mes and: each año = año ] ifNone:[^Error signal].
	^ (socios
		detect: [ :each | each nroSocio = unNroSocio ]
		ifNone: [ ^ Error signal ])
		pagoCuota: cuota
		metodoDePago: unMetodoDePago
]

{ #category : #accessing }
Cooperativa >> socios [
	^ socios
]

{ #category : #accessing }
Cooperativa >> sociosAlDia [
	^socios select: [:each | each alDia: cuotas].
	
]
