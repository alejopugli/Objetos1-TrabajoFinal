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
Pago >> monto [
	^ monto
]

{ #category : #'instance creation' }
Pago >> new: nroSocio cobro: matriCuota metodoDePago: unMetodoDePago [
corresponde := nroSocio .
fecha:= Date today.
monto:= unMetodoDePago cobrarComision: matriCuota  valor.
]
