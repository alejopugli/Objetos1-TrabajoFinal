Class {
	#name : #IndexPage,
	#superclass : #Index,
	#category : #'Objetos1-TrabajoFinal-InterfaceDeUsuario'
}

{ #category : #rendering }
IndexPage >> actualizaciones [ 
	self call: Actualizaciones  new
]

{ #category : #rendering }
IndexPage >> consultas [
 self call: Consultas new
]

{ #category : #rendering }
IndexPage >> registros [
	self call: Registros new
]

{ #category : #rendering }
IndexPage >> renderBotones: html [
	html submitButton
		class: 'btn';
		callback: [ self consultas ];
		with: 'Consultar'.
	html submitButton
		class: 'btn';
		callback: [ self registros ];
		with: 'Registrar'.
	html submitButton
		class: 'btn';
		callback: [ self actualizaciones ];
		with: 'Actualizar'.
		
]
