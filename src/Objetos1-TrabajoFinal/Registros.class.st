Class {
	#name : #Registros,
	#superclass : #Index,
	#category : #'Objetos1-TrabajoFinal-InterfaceDeUsuario'
}

{ #category : #rendering }
Registros >> registrarCuota [
	self call: RegistrarCuota new
]

{ #category : #'as yet unclassified' }
Registros >> registrarMetodoDePago [
 self call: RegistrarMetodoDePago new.
]

{ #category : #'as yet unclassified' }
Registros >> registrarPago [
	self call: RegistrarPago new
]

{ #category : #rendering }
Registros >> registrarSocio [
	self call: RegistrarSocio new
]

{ #category : #rendering }
Registros >> renderBotones: html [
	html submitButton
		class: 'btn';
		callback: [ self registrarSocio ];
		with: 'Socio'.
	html submitButton
		class: 'btn';
		callback: [ self registrarPago ];
		with: 'Pago'.
	html submitButton
		class: 'btn';
		callback: [ self registrarCuota ];
		with: 'Cuota'.
	html submitButton
		class: 'btn';
		callback: [ self registrarMetodoDePago ];
		with: 'Metodo De Pago'.
	html submitButton
		class: 'btn';
		callback: [ self volver ];
		with: 'Volver'
]
