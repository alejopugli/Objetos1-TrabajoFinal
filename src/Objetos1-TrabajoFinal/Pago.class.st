Class {
	#name : #Pago,
	#superclass : #Object,
	#instVars : [
		'monto',
		'fecha',
		'de',
		'corresponde'
	],
	#category : #'Objetos1-TrabajoFinal-model'
}

{ #category : #'instance creation' }
Pago class >> new: nroSocio cobro: unCobro metodoDePago: unMetodoDePago [
^(self new) new: nroSocio cobro: unCobro  metodoDePago: unMetodoDePago
]

{ #category : #accessing }
Pago >> corresponde [
	^ corresponde
]

{ #category : #accessing }
Pago >> fecha [
	^ fecha
]

{ #category : #accessing }
Pago >> fecha: anObject [
"solo para el uso de test, no se cumple el ocultamiento de información"
	fecha := anObject
]

{ #category : #accessing }
Pago >> monto [
	^ monto
]

{ #category : #'instance creation' }
Pago >> new: nroSocio cobro: matriCuota metodoDePago: unMetodoDePago [
	de := nroSocio.
	corresponde := matriCuota .
	fecha := Date today.
	monto := unMetodoDePago cobrarComision: matriCuota valor.
	^ self
]
