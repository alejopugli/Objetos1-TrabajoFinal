Class {
	#name : #ActualizarCuota,
	#superclass : #Actualizaciones,
	#instVars : [
		'mes',
		'año',
		'nuevoValor'
	],
	#category : #'Objetos1-TrabajoFinal-InterfaceDeUsuario'
}

{ #category : #'as yet unclassified' }
ActualizarCuota >> actualizarValor [
	[ cooperativa actualizarValorCuota: nuevoValor mes: mes año: año ]
		on: Error
		do: [ ^ self call: RenderDatosIncorrectos new ].
	self call: RenderOperacionCorrectaGeneral new
]

{ #category : #accessing }
ActualizarCuota >> año [
	^ año
]

{ #category : #accessing }
ActualizarCuota >> año: anObject [
	año := anObject asNumber
	
]

{ #category : #accessing }
ActualizarCuota >> mes [
	^ mes
]

{ #category : #accessing }
ActualizarCuota >> mes: anObject [
	mes := anObject asNumber
]

{ #category : #accessing }
ActualizarCuota >> nuevoValor [
	^ nuevoValor
]

{ #category : #accessing }
ActualizarCuota >> nuevoValor: anObject [
	nuevoValor := anObject asNumber
]

{ #category : #rendering }
ActualizarCuota >> renderBotones: html [
	html
		form: [ html paragraph: 'Actualizacion del valor de Cuota'.
			html text: 'Nuevo Valor: '.
			html numberInput
				class: 'form-input';
				on: #nuevoValor of: self;
				value: 0.
			html break.
			html text: 'Mes: '.
			html select
				list: (cooperativa cuotas collect: [ :each | each mes ]);
				callback: [ :value | self mes: value ];selected: self mes.
			html break.
			html text: 'Año: '.
			html select
				list: (cooperativa cuotas collect: [ :each | each año ]);
				callback: [ :value | self año: value ];
				selected: self año.
			html break.
			html submitButton
				class: 'btn';
				callback: [ self actualizarValor ];
				with: 'Actualizar'.
			html submitButton
				class: 'btn';
				callback: [ self volver ];
				with: 'Volver' ]
]
