Class {
	#name : #Estudiante,
	#superclass : #Object,
	#instVars : [
		'encargado',
		'nombre',
		'grado',
		'division',
		'DNI'
	],
	#category : #'Objetos1-TrabajoFinal-model'
}

{ #category : #'instance creation' }
Estudiante class >> new: unNombre grado: unGrado division: unaDivision dni: unDNI encargado: unSocio [
^(self new) new: unNombre grado: unGrado division: unaDivision dni: unDNI encargado: unSocio

]

{ #category : #accessing }
Estudiante >> dni [
	^ DNI
]

{ #category : #'instance creation' }
Estudiante >> new: unNombre grado: unGrado division: unaDivision dni: unDNI encargado: unSocio [

nombre:= unNombre.
grado:= unGrado.
division:= unaDivision .
DNI:= unDNI.
encargado:= unSocio.
^self.
]
