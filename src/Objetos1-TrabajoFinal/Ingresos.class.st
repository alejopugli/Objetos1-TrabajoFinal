Class {
	#name : #Ingresos,
	#superclass : #Consultas,
	#classVars : [
		'de',
		'hasta'
	],
	#category : #'Objetos1-TrabajoFinal-InterfaceDeUsuario'
}

{ #category : #accessing }
Ingresos >> de [
	^ de
]

{ #category : #accessing }
Ingresos >> de: anObject [
	de := anObject asDate
]

{ #category : #accessing }
Ingresos >> hasta [
	^ hasta
]

{ #category : #accessing }
Ingresos >> hasta: anObject [
	hasta := anObject asDate
]

{ #category : #rendering }
Ingresos >> renderBotones: html [
	html
		form: [ html text: 'de: '.
			html dateInput
				callback: [ :value | self de: value ];
				with: self de.
			html break.
			html text: 'hasta: '.
			html dateInput
				callback: [ :value | self hasta: value ];
				with: self hasta.
			html break.
			html submitButton
				class: 'btn';
				callback: [ self call: RenderIngresos new ];
				value: 'Calcular Ingresos'.
			html submitButton
				class: 'btn';
				callback: [ self volver ];
				with: 'volver' ]
]
