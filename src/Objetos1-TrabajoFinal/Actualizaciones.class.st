Class {
	#name : #Actualizaciones,
	#superclass : #Index,
	#category : #'Objetos1-TrabajoFinal-InterfaceDeUsuario'
}

{ #category : #rendering }
Actualizaciones >> actualizarCuota [
	self call: ActualizarCuota new
]

{ #category : #rendering }
Actualizaciones >> actualizarMatricula [
	self call: ActualizarMatricula new
]

{ #category : #rendering }
Actualizaciones >> renderBotones: html [
	html submitButton
		class: 'btn';
		callback: [ self actualizarCuota ];
		with: 'Cuota'.
	html submitButton
		class: 'btn';
		callback: [ self actualizarMatricula ];
		with: 'Matricula'.
	html submitButton
		class: 'btn';
		callback: [ self volver ];
		with: 'Volver'
]
