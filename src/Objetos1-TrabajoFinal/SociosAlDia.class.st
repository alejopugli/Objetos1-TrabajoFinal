Class {
	#name : #SociosAlDia,
	#superclass : #Consultas,
	#category : #'Objetos1-TrabajoFinal-InterfaceDeUsuario'
}

{ #category : #rendering }
SociosAlDia >> renderBotones: html [
	cooperativa sociosAlDia isEmpty
		ifTrue: [ html paragraph: 'No hay ningun socio al día' ]
			ifFalse:
			[ html
				unorderedList: [ cooperativa sociosAlDia
						do: [ :socio | html listItem: [ self renderSocio: socio on: html ] ] ] ].
				html submitButton
			class: 'btn';
		callback: [ self volver ];
		with: 'Volver'
]

{ #category : #rendering }
SociosAlDia >> renderSocio: socio on: html [
	html
		render: socio nroSocio;
		render: ' con DNI: ';
		render: socio dni;
		render: ' a cargo de: ';
		render: (socio aCargo collect: [ :estudiante | estudiante nombre ])
]
