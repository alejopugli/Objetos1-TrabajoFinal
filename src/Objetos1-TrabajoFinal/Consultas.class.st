Class {
	#name : #Consultas,
	#superclass : #Index,
	#category : #'Objetos1-TrabajoFinal-InterfaceDeUsuario'
}

{ #category : #rendering }
Consultas >> pagoDeSocio [
	self call: BuscarSocio new
]

{ #category : #rendering }
Consultas >> renderBotones: html [
	html submitButton
		class: 'btn';
		callback: [ self sociosAlDia ];
		with: 'Socios Al Día'.
	html submitButton
		class: 'btn';
		callback: [ self pagoDeSocio ];
		with: 'Pagos de Socio'.
	html submitButton
		class: 'btn';
		callback: [ self ingresos ];
		with: 'Ingresos'.
	html submitButton
		class: 'btn';
		callback: [ self volver ];
		with: 'Volver'
]

{ #category : #accessing }
Consultas >> sociosAlDia [
	self call: SociosAlDia new
]

{ #category : #rendering }
Consultas >> volver [
	self answer
]
