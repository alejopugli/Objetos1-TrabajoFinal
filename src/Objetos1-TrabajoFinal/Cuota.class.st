Class {
	#name : #Cuota,
	#superclass : #Cobros,
	#instVars : [
		'mes',
		'año'
	],
	#category : #'Objetos1-TrabajoFinal-model'
}

{ #category : #'instance creation' }
Cuota class >> new: valor mes: mes año: año [
^(self new) new: valor mes: mes año: año.
]

{ #category : #accessing }
Cuota >> año [
	^ año
]

{ #category : #comparing }
Cuota >> between: fromDate and: toDate [

]

{ #category : #accessing }
Cuota >> mes [
	^ mes
]

{ #category : #'instance creation' }
Cuota >> new: unValor mes: unMes año: unAño [
self new: unValor.
mes:= unMes.
año:= unAño.
^self.
]
