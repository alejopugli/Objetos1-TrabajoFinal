Class {
	#name : #RenderDatosIncorrectos,
	#superclass : #Registros,
	#category : #'Objetos1-TrabajoFinal-InterfaceDeUsuario'
}

{ #category : #'as yet unclassified' }
RenderDatosIncorrectos >> renderBotones: html [
	html text: 'Los datos ingresados son incorrectos. Pruebe de nuevo '.
	html submitButton
		class: 'btn';
		callback: [ self volver ];
		with: 'Volver'
]
