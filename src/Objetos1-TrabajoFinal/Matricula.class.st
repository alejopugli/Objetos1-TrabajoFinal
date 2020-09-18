Class {
	#name : #Matricula,
	#superclass : #Cobros,
	#category : #'Objetos1-TrabajoFinal-model'
}

{ #category : #'instance creation' }
Matricula class >> new: valor [
^(self new) new:valor.
]

{ #category : #'instance creation' }
Matricula >> new: unValor [
super new: unValor.
^self.
]
