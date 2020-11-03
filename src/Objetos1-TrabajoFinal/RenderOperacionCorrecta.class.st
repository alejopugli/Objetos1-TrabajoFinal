Class {
	#name : #RenderOperacionCorrecta,
	#superclass : #RegistrarSocio,
	#category : #'Objetos1-TrabajoFinal-InterfaceDeUsuario'
}

{ #category : #'as yet unclassified' }
RenderOperacionCorrecta >> renderBotones: html [
	html text: 'La operación se realizó con éxito '.
	html break.
	html text: 'Desea Agregar otro Estudiante A cargo'.
	html break.
	html submitButton
		class: 'btn';
		callback: [ self volver ];
		with: 'Si'.
	html submitButton
		class: 'btn';
		callback: [ self call: IndexPage new ];
		with: 'No'
]
