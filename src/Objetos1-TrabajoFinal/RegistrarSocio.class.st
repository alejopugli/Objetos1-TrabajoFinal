Class {
	#name : #RegistrarSocio,
	#superclass : #Registros,
	#instVars : [
		'telefono',
		'dni'
	],
	#classVars : [
		'socio'
	],
	#category : #'Objetos1-TrabajoFinal-InterfaceDeUsuario'
}

{ #category : #'as yet unclassified' }
RegistrarSocio >> corroborarSocio [
	socio := [ cooperativa altaDeSocio: dni tel: telefono ]
		on: Error
		do: [ ^ self call: RenderDatosIncorrectos new ].
	self call: RenderIngresarEstudiante new
]

{ #category : #accessing }
RegistrarSocio >> dni [
	^ dni
]

{ #category : #accessing }
RegistrarSocio >> dni: anObject [
	dni := anObject asNumber 
]

{ #category : #'as yet unclassified' }
RegistrarSocio >> renderBotones: html [
	html
		form: [ html paragraph: 'Registro de socio'.
			html text: 'telefono: '.
			html numberInput
				class: 'form-input';
				on: #telefono of: self;
				value: 0.
			html break.
			html text: 'DNI: '.
			html numberInput
				class: 'form-input';
				on: #dni of: self;
				value: 0.
			html break.
			html submitButton
				class: 'btn';
				callback: [ self corroborarSocio ];
				with: 'Registrar'.
			html submitButton
				class: 'btn';
				callback: [ self volver ];
				with: 'Volver' ]
]

{ #category : #accessing }
RegistrarSocio >> telefono [
	^ telefono
]

{ #category : #accessing }
RegistrarSocio >> telefono: anObject [
	telefono := anObject asNumber
]
