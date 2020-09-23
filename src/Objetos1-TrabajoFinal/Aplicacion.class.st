Class {
	#name : #Aplicacion,
	#superclass : #SpPresenter,
	#instVars : [
		'cooperativa',
		'botonRegistrar',
		'botonConsultar',
		'botonActualizar',
		'pantallaInicial'
	],
	#category : #'Objetos1-TrabajoFinal-InterfaceDeUsuario'
}

{ #category : #specs }
Aplicacion class >> defaultSpec [
	^ SpBoxLayout newVertical
		add:
			(SpBoxLayout newHorizontal
				add: #botonRegistrar;
				add: #botonConsultar;
				add: #botonActualizar;
				yourself);
		add: #pantallaInicial;
		yourself
]

{ #category : #specs }
Aplicacion >> connectPresenters [
botonRegistrar  action: [ pantallaInicial  label: botonRegistrar  label ].
botonConsultar  action: [ pantallaInicial  label: botonConsultar  label ].
botonActualizar  action: [ pantallaInicial label: botonActualizar  label ].
]

{ #category : #initialization }
Aplicacion >> initializePresenters [
	pantallaInicial := self newLabel.
	pantallaInicial label: 'Bienvenido a Cooperativa tm'.
	botonRegistrar := self newButton.
	botonRegistrar label: 'Registrar'.
	botonConsultar := self newButton.
	botonConsultar label: 'Consultar'.
	botonActualizar := self newButton.
	botonActualizar label: 'Actualizar'.
	self focusOrder add: botonRegistrar ;add: botonConsultar ; add: botonActualizar .
]

{ #category : #initialization }
Aplicacion >> initializeWindow: aWindowPresenter [
	aWindowPresenter title: 'Cooperativa';initialExtent: 400@100
]

{ #category : #widgets }
Aplicacion >> newButton [
^ self instantiate: SpButtonPresenter
]
