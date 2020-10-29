Class {
	#name : #BuscarSocio,
	#superclass : #Index,
	#category : #'Objetos1-TrabajoFinal-InterfaceDeUsuario'
}

{ #category : #rendering }
BuscarSocio >> cuotasPagadas: nro [
	cooperativa usuarios detect: [ :each | each nroSocio = nro ] ifNone: [  ]
]

{ #category : #rendering }
BuscarSocio >> cuotasPagadas: nro with: html [
	cooperativa usuarios
		detect: [ :each | each nroSocio = nro ]
		ifNone: [  ]
]

{ #category : #rendering }
BuscarSocio >> renderBotones: html [
	html
		form: [ html label
				class: 'lbl';
				with: 'Ingrese nro de socio: '.
			html textInput class: 'form-input'.
			html button
				callback: [ self cuotasPagadas: html ];
				with: 'aceptar' ]
]
