Class {
	#name : #Cobros,
	#superclass : #Object,
	#instVars : [
		'valor'
	],
	#category : #'Objetos1-TrabajoFinal-model'
}

{ #category : #'instance creation' }
Cobros class >> new: valor [
^(self new) new: valor.
]

{ #category : #'instance creation' }
Cobros >> actualizarValor: nuevoValor [
	nuevoValor > 0
		ifTrue: [ valor := nuevoValor.
			^ true ].
	^ Error signal
]

{ #category : #'instance creation' }
Cobros >> new: val [

valor:= val.
^self.
]

{ #category : #accessing }
Cobros >> valor [
	^ valor
]
