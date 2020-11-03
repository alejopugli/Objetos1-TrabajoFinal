Class {
	#name : #RenderOperacionCorrectaGeneral,
	#superclass : #Index,
	#category : #'Objetos1-TrabajoFinal-InterfaceDeUsuario'
}

{ #category : #rendering }
RenderOperacionCorrectaGeneral >> renderBotones: html [
	html text: 'La operación se realizó con éxito '.
	html break.
	html submitButton
		class: 'btn';
		callback: [ self volver ];
		with: 'Volver'
]
