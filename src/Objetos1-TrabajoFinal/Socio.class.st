Class {
	#name : #Socio,
	#superclass : #Object,
	#instVars : [
		'tel',
		'nroSocio',
		'DNI',
		'pagos',
		'aCargo',
		'pagoMatricula'
	],
	#category : #'Objetos1-TrabajoFinal-model'
}

{ #category : #'instance creation' }
Socio class >> new: nSocio tel: telefono DNI: unDNI [
^(self new) new: nSocio tel: telefono DNI: unDNI

]

{ #category : #accessing }
Socio >> aCargo [
	^ aCargo
]

{ #category : #'accept/cancel' }
Socio >> alDia: cuotas [
	pagos
		ifNotEmpty: [ ^ pagos size
				= (self buscar: cuotas desde: pagoMatricula fecha  hasta: Date today) size ]
		ifEmpty: [ cuotas ifEmpty: [ ^ true ].
			^ false ]
]

{ #category : #'adding item' }
Socio >> altaEstudiante: unNombre grado: unGrado division: unaDivision dni: unDNI [
	| nuevoEstudiante |
	aCargo detect: [ :each | each dni = unDNI ] ifFound: [ ^Error signal].
	nuevoEstudiante := Estudiante
		new: unNombre
		grado: unGrado
		division: unaDivision
		dni: unDNI
		encargado: self.
	aCargo add: nuevoEstudiante.
	^ nuevoEstudiante
]

{ #category : #accessing }
Socio >> buscar: cuotas desde: fromDate hasta: toDate [
	^ cuotas
				select: [ :each | 
					(Date year: each año month: each mes day: 1)
						between: fromDate 
						and: toDate  ]
		
]

{ #category : #calculating }
Socio >> calcularPagos: fromDate hasta: toDate [
	| total |
	total := 0.
	pagos
		ifNotEmpty: [ total := (pagos
				select: [ :each | each fecha between: fromDate and: toDate ])
				sumNumbers: [ :each | each monto ] ].
	(pagoMatricula fecha
		between: fromDate
		and: toDate)
		ifTrue: [ total := total + pagoMatricula monto ].
	^ total
]

{ #category : #accessing }
Socio >> dni [
	^ DNI
]

{ #category : #'instance creation' }
Socio >> new: nSocio tel: telefono DNI: unDNI [
	nroSocio := nSocio.
	tel := telefono.
	DNI := unDNI.
	pagos := OrderedCollection new.
	aCargo := OrderedCollection new.
	^ self
]

{ #category : #accessing }
Socio >> nroSocio [
	^ nroSocio
]

{ #category : #accessing }
Socio >> pagoCuota: unaCuota metodoDePago: unMetodoDePago [
	pagos
		detect: [ :each | each corresponde = unaCuota ]
		ifFound: [ ^ Error signal ].
	pagos
		add: (Pago new: nroSocio cobro: unaCuota metodoDePago: unMetodoDePago)
]

{ #category : #accessing }
Socio >> pagoMatricula [
	^ pagoMatricula
]

{ #category : #'adding item' }
Socio >> pagoMatricula: unaMatricula metodoDePago: unMetodoDePago [
	^pagoMatricula := Pago
		new: nroSocio
		cobro: unaMatricula
		metodoDePago: unMetodoDePago
]

{ #category : #accessing }
Socio >> pagos [
	^ pagos
]
