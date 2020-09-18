Class {
	#name : #MetodoDePago,
	#superclass : #Object,
	#instVars : [
		'comision',
		'nombre'
	],
	#category : #'Objetos1-TrabajoFinal-model'
}

{ #category : #'instance creation' }
MetodoDePago class >> new: nombre comision: comision [
^(self new) new: nombre comision: comision

]

{ #category : #'as yet unclassified' }
MetodoDePago >> cobrarComision: unMonto [

^ unMonto - (unMonto * comision / 100). 
]

{ #category : #'instance creation' }
MetodoDePago >> new: unNombre comision: unaComision [

nombre:= unNombre.
comision:= unaComision.
^self
]

{ #category : #accessing }
MetodoDePago >> nombre [
	^ nombre
]
