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
Socio >> altaEstudiante: unNombre grado: unGrado division: unaDivision dni: unDNI [
|nuevoEstudiante|
nuevoEstudiante := Estudiante new: unNombre grado: unGrado division: unaDivision  dni: unDNI encargado: self.
aCargo add: nuevoEstudiante .
^nuevoEstudiante 
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
	pagos:= OrderedCollection new.
	^ self
]

{ #category : #accessing }
Socio >> pagos [
	^ pagos
]
