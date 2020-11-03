Class {
	#name : #BuscarSocio,
	#superclass : #Consultas,
	#classVars : [
		'aBuscar'
	],
	#category : #'Objetos1-TrabajoFinal-InterfaceDeUsuario'
}

{ #category : #rendering }
BuscarSocio >> aBuscar [
^aBuscar 
]

{ #category : #rendering }
BuscarSocio >> aBuscar: nro [
	aBuscar := nro asNumber
]

{ #category : #rendering }
BuscarSocio >> renderBotones: html [
	html
		form: [ html text: 'Ingrese nro de socio: '.
			html select
				list:
					(cooperativa socios
						ifNotEmpty: [ :oc | oc collect: [ :each | each nroSocio ] ]);
				callback: [ :value | self aBuscar: value ];
				selected:1.
			html break.
			html submitButton
				class: 'btn';
				callback: [ self call: RenderCuotasPagadas new ];
				with: 'aceptar'.
			html submitButton
				class: 'btn';
				callback: [ self volver ];
				with: 'Volver' ]
]
