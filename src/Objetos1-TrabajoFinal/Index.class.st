Class {
	#name : #Index,
	#superclass : #WAComponent,
	#category : #'Objetos1-TrabajoFinal-InterfaceDeUsuario'
}

{ #category : #rendering }
Index >> renderContentOn: html [
	html paragraph: 'Bienvenido a su cooperativa'.
	html
		paragraph: [ html text: '¿Que Desea Hacer? '.
			html button
				text: 'Consultar';
				callback: 'localhost:8080/Index/Consultas'.
			html button text: 'Registrar'.
			html button text: 'Actualizar' ]
]
