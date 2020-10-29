Class {
	#name : #SociosAlDia,
	#superclass : #Index,
	#category : #'Objetos1-TrabajoFinal-InterfaceDeUsuario'
}

{ #category : #rendering }
SociosAlDia >> renderBotones: html [
	(cooperativa sociosAlDia isEmpty)
		ifTrue: [ html paragraph: 'No hay socios ingresados' ]
		ifFalse: [ html
				unorderedList: [ cooperativa sociosAlDia
						do: [ :socio | html listItem: [ self renderSocio: socio on: html ] ] ] ]
]

{ #category : #rendering }
SociosAlDia >> renderSocio: socio on: html [
	html
		render: socio name;
		render: ' ';
		render: socio nroSocio;
		render: ' ';
		render: socio dni;
		render: socio aCargo.
]
