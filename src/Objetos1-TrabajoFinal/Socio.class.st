Class {
	#name : #Socio,
	#superclass : #Object,
	#instVars : [
		'tel',
		'nroSocio',
		'DNI',
		'pagos',
		'aCargo'
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

{ #category : #'as yet unclassified' }
Socio >> alDia: cuotas [
	^ pagos size - 1
		= (self buscar: cuotas desde: pagos first fecha hasta: Date today) size 
			
]

{ #category : #'as yet unclassified' }
Socio >> altaEstudiante: unNombre grado: unGrado division: unaDivision dni: unDNI [
|nuevoEstudiante|
nuevoEstudiante := Estudiante new: unNombre grado: unGrado division: unaDivision  dni: unDNI encargado: self.
aCargo add: nuevoEstudiante .
^nuevoEstudiante 
]

{ #category : #'as yet unclassified' }
Socio >> buscar: cuotas desde: fromDate hasta: toDate [
	^ cuotas
				select: [ :each | 
					(Date year: each año month: each mes day: 1)
						between: fromDate 
						and: toDate  ]
		
]

{ #category : #'as yet unclassified' }
Socio >> calcularPagos: fromDate hasta: toDate [
	^ (pagos
		select: [ :each | each fecha between: fromDate and: toDate ])
		sumNumbers: [ :each | each monto ]
]

{ #category : #accessing }
Socio >> dni [
	^ DNI
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
Socio >> pagoMatricula: unaMatricula metodoDePago: unMetodoDePago [
	pagos
		add: (Pago new: nroSocio cobro: unaMatricula metodoDePago: unMetodoDePago)
]

{ #category : #accessing }
Socio >> pagos [
	^ pagos
]
