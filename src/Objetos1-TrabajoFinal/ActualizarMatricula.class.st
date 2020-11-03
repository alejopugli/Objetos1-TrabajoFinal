Class {
	#name : #ActualizarMatricula,
	#superclass : #Actualizaciones,
	#instVars : [
		'nuevoValor'
	],
	#category : #'Objetos1-TrabajoFinal-InterfaceDeUsuario'
}

{ #category : #'as yet unclassified' }
ActualizarMatricula >> actualizarValor [
	[cooperativa actualizarValorMatricula: nuevoValor]
		on: Error
		do: [ ^ self call: RenderDatosIncorrectos new ].
	self call: RenderOperacionCorrectaGeneral new
]

{ #category : #accessing }
ActualizarMatricula >> nuevoValor [
	^ nuevoValor
]

{ #category : #accessing }
ActualizarMatricula >> nuevoValor: anObject [
	nuevoValor := anObject asNumber 
]

{ #category : #rendering }
ActualizarMatricula >> renderBotones: html [
	html
		form: [ html paragraph: 'Actualizacion del valor de matricula'.
			html
				render: 'valor actual: ';
				render: cooperativa matricula valor.
			html break.
			html text: 'Nuevo Valor: '.
			html numberInput
				class: 'form-input';
				on: #nuevoValor of: self;
				value: 0.
			html break.
			html submitButton
				class: 'btn';
				callback: [ self actualizarValor ];
				with: 'Actualizar'.
			html submitButton
				class: 'btn';
				callback: [ self volver ];
				with: 'Volver' ]
]
