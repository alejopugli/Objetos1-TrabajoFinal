Class {
	#name : #RegistrarCuota,
	#superclass : #Registros,
	#instVars : [
		'valor',
		'mes',
		'año'
	],
	#classVars : [
		'cuota'
	],
	#category : #'Objetos1-TrabajoFinal-InterfaceDeUsuario'
}

{ #category : #accessing }
RegistrarCuota >> año [
	^ año
]

{ #category : #accessing }
RegistrarCuota >> año: anObject [
	año := anObject asNumber 
]

{ #category : #'as yet unclassified' }
RegistrarCuota >> corroborarCuota [
	cuota := [ cooperativa altaDeCuota: valor mes: mes año: año ]
		on: Error
		do: [^ self call: RenderDatosIncorrectos new ].
	self call: RenderOperacionCorrectaGeneral new
]

{ #category : #accessing }
RegistrarCuota >> mes [
	^ mes
]

{ #category : #accessing }
RegistrarCuota >> mes: anObject [
	mes := anObject asNumber
]

{ #category : #rendering }
RegistrarCuota >> renderBotones: html [
	html
		form: [ html paragraph: 'Registro de Cuotas'.
			html text: 'cuotas en el sistema: '.
			html
				render:
					(cooperativa cuotas
						size).
			html break.
			html break.
			html text: 'Valor: '.
			html numberInput
				class: 'form-input';
				on: #valor of: self;
				value: 0.
			html break.
			html text: 'Mes: '.
			html select
				list: (Interval from: 1 to: 12);
				selected: 1;
				callback: [ :value | self mes: value ].
			html break.
			html text: 'Año: '.
			html select
				list: (Interval from: Date today year to: Date today year + 10);
				selected: [ :value | value first ];
				callback: [ :value | self año: value ].
			html break.
			html submitButton
				class: 'btn';
				callback: [ self corroborarCuota ];
				with: 'Registrar'.
			html submitButton
				class: 'btn';
				callback: [ self volver ];
				with: 'Volver' ]
]

{ #category : #accessing }
RegistrarCuota >> valor [
	^ valor
]

{ #category : #accessing }
RegistrarCuota >> valor: anObject [
	valor := anObject asNumber
]
