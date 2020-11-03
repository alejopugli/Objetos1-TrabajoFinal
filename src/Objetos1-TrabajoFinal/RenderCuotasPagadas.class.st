Class {
	#name : #RenderCuotasPagadas,
	#superclass : #BuscarSocio,
	#category : #'Objetos1-TrabajoFinal-InterfaceDeUsuario'
}

{ #category : #rendering }
RenderCuotasPagadas >> renderBotones: html [
	cooperativa socios
		detect: [ :each | each nroSocio = aBuscar ]
		ifFound: [ :socio | 
			html
				unorderedList: [ socio pagos
						do: [ :each | html listItem: [ self renderCuota: each on: html ] ] ] ]
				.html submitButton
		class: 'btn';
		callback: [ self volver ];
		with: 'Volver'
]

{ #category : #rendering }
RenderCuotasPagadas >> renderCuota: aPago on: html [
	html
		render: 'Mes: ';
		render: aPago corresponde mes;
		render: ' año: ';
		render: aPago corresponde año;
		render: ' monto: ';
		render: aPago monto.
]
