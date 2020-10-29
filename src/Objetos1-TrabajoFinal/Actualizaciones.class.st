Class {
	#name : #Actualizaciones,
	#superclass : #Index,
	#category : #'Objetos1-TrabajoFinal-InterfaceDeUsuario'
}

{ #category : #rendering }
Actualizaciones >> consultas [ 
]

{ #category : #rendering }
Actualizaciones >> cuota [
]

{ #category : #rendering }
Actualizaciones >> renderBotones: html [
	html submitButton
		class: 'btn';
		callback: [ self cuota ];
		with: 'Cuota'.
	html submitButton
		class: 'btn';
		callback: [ self consultas ];
		with: 'Matricula'.
	html submitButton
		class: 'btn';
		callback: [ self volver ];
		with: 'Volver'
]

{ #category : #rendering }
Actualizaciones >> volver [
 self answer 
	
]
