Class {
	#name : #RegistrarPago,
	#superclass : #Registros,
	#instVars : [
		'nroSocio',
		'mes',
		'año',
		'metodoDePago'
	],
	#category : #'Objetos1-TrabajoFinal-InterfaceDeUsuario'
}

{ #category : #accessing }
RegistrarPago >> año [
	^ año
]

{ #category : #accessing }
RegistrarPago >> año: anObject [
	año := anObject asNumber
]

{ #category : #rendering }
RegistrarPago >> corroborarPago [
	[ cooperativa
		pagoCuota: nroSocio
		mes: mes
		año: año
		metodoDePago: metodoDePago ]
		on: Error
		do: [ ^ self call: RenderDatosIncorrectos new ].
	self call: RenderOperacionCorrectaGeneral new
]

{ #category : #accessing }
RegistrarPago >> mes [
	^ mes
]

{ #category : #accessing }
RegistrarPago >> mes: anObject [
	mes := anObject asNumber
]

{ #category : #accessing }
RegistrarPago >> metodoDePago [
	^ metodoDePago
]

{ #category : #accessing }
RegistrarPago >> metodoDePago: anObject [
	cooperativa metodosDePago
		detect: [ :metodo | metodo nombre = anObject ]
		ifFound: [ :value | metodoDePago := value ]
]

{ #category : #accessing }
RegistrarPago >> nroSocio [
	^ nroSocio
]

{ #category : #accessing }
RegistrarPago >> nroSocio: anObject [
	nroSocio := anObject asNumber
]

{ #category : #rendering }
RegistrarPago >> renderBotones: html [
	html
		form: [ html paragraph: 'Registro de Pago'.
			html text: 'NRO Socio: '.
			html select
				list: (cooperativa socios collect: [ :each | each nroSocio ]);
				callback: [ :value | self nroSocio: value ];
				selected: 1.
			html break.
			html text: 'Mes: '.
			html select
				list: (cooperativa cuotas collect: [ :each | each mes ]) asSet;
				callback: [ :value | self mes: value ];
				selected: 1.
			html break.
			html text: 'Año: '.
			html select
				list: (cooperativa cuotas collect: [ :each | each año ]) asSet;
				callback: [ :value | self año: value ];
				selected: Date today year.
			html break.
			html text: 'Metodo De Pago: '.
			html select
				list: (cooperativa metodosDePago collect: [ :each | each nombre ]);
				callback: [ :value | self metodoDePago: value ];
				selected: cooperativa metodosDePago first.
			html break.
			html submitButton
				class: 'btn';
				callback: [ self corroborarPago ];
				with: 'Registrar'.
			html submitButton
				class: 'btn';
				callback: [ self volver ];
				with: 'Volver' ]
]
