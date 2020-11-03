Class {
	#name : #RenderIngresos,
	#superclass : #Ingresos,
	#category : #'Objetos1-TrabajoFinal-InterfaceDeUsuario'
}

{ #category : #rendering }
RenderIngresos >> renderBotones: html [
	html
		paragraph: [ html
				text: 'La cantidad de ingresos entre las fechas ingresadas es de: '.
			html render: (cooperativa calcularIngresos: de hasta: hasta).
			html text: '   '.
			html submitButton
				class: 'btn';
				callback: [ self volver ];
				with: 'aceptar' ]
]
