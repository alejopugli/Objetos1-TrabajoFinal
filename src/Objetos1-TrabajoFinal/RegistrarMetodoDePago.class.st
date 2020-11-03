Class {
	#name : #RegistrarMetodoDePago,
	#superclass : #Registros,
	#instVars : [
		'nombre',
		'comision',
		'metodoDePago'
	],
	#category : #'Objetos1-TrabajoFinal-InterfaceDeUsuario'
}

{ #category : #accessing }
RegistrarMetodoDePago >> comision [
	^ comision
]

{ #category : #accessing }
RegistrarMetodoDePago >> comision: anObject [
	comision := anObject asNumber
]

{ #category : #rendering }
RegistrarMetodoDePago >> corroborarMetodoDePago [
	metodoDePago := [ cooperativa
		agregarMetodoDePago: nombre
		comision: comision ]
		on: Error
		do: [ ^ self call: RenderDatosIncorrectos new ].
	self call: RenderOperacionCorrectaGeneral new
]

{ #category : #accessing }
RegistrarMetodoDePago >> nombre [
	^ nombre
]

{ #category : #accessing }
RegistrarMetodoDePago >> nombre: anObject [
	nombre := anObject
]

{ #category : #rendering }
RegistrarMetodoDePago >> renderBotones: html [
	html
		form: [ html paragraph: 'Registrar Metodo De Pago'.
			html text: 'nombre: '.
			html textInput
				class: 'form-input';
				on: #nombre of: self.
			html break.
			html text: 'comision: '.
			html textInput
				class: 'form-input';
				on: #comision of: self; value: 0.
			html break.
			html submitButton
				class: 'btn';
				callback: [ self corroborarMetodoDePago ];
				with: 'Registrar'.
			html submitButton
				class: 'btn';
				callback: [ self volver ];
				with: 'Volver' ]
]
