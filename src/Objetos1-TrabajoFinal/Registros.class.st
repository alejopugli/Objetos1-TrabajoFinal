Class {
	#name : #Registros,
	#superclass : #Index,
	#category : #'Objetos1-TrabajoFinal-InterfaceDeUsuario'
}

{ #category : #rendering }
Registros >> cuota [
]

{ #category : #'as yet unclassified' }
Registros >> metodoDePago [
]

{ #category : #'as yet unclassified' }
Registros >> pago [
]

{ #category : #rendering }
Registros >> renderBotones: html [
	html submitButton
		class: 'btn';
		callback: [ self socio ];
		with: 'Socio'.
	html submitButton
		class: 'btn';
		callback: [ self pago ];
		with: 'Pago'.
	html submitButton
		class: 'btn';
		callback: [ self cuota ];
		with: 'Cuota'.
	html submitButton
		class: 'btn';
		callback: [ self metodoDePago ];
		with: 'Metodo De Pago'.
	html submitButton
		class: 'btn';
		callback: [ self volver ];
		with: 'Volver'
]

{ #category : #rendering }
Registros >> socio [
	
]

{ #category : #rendering }
Registros >> volver [
	self answer
]
