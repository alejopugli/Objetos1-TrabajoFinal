Class {
	#name : #RenderIngresarEstudiante,
	#superclass : #RegistrarSocio,
	#instVars : [
		'nombre',
		'grado',
		'division',
		'dniEstudiante'
	],
	#classVars : [
		'estudiante'
	],
	#category : #'Objetos1-TrabajoFinal-InterfaceDeUsuario'
}

{ #category : #'as yet unclassified' }
RenderIngresarEstudiante >> corroborarEstudiante [
	estudiante := [ socio
		altaEstudiante: nombre
		grado: grado
		division: division
		dni: dniEstudiante ]
		on: Error
		do: [
			^ self call: RenderDatosIncorrectos new ].
	self call: RenderOperacionCorrecta new
]

{ #category : #accessing }
RenderIngresarEstudiante >> division [
	^ division
]

{ #category : #accessing }
RenderIngresarEstudiante >> division: anObject [
	division := anObject 
]

{ #category : #accessing }
RenderIngresarEstudiante >> dniEstudiante [
	^ dniEstudiante
]

{ #category : #accessing }
RenderIngresarEstudiante >> dniEstudiante: anObject [
	dniEstudiante := anObject asNumber
]

{ #category : #accessing }
RenderIngresarEstudiante >> grado [
	^ grado
]

{ #category : #accessing }
RenderIngresarEstudiante >> grado: anObject [
	grado := anObject asNumber
]

{ #category : #accessing }
RenderIngresarEstudiante >> nombre [
	^ nombre
]

{ #category : #accessing }
RenderIngresarEstudiante >> nombre: anObject [
	nombre := anObject
]

{ #category : #'as yet unclassified' }
RenderIngresarEstudiante >> renderBotones: html [
	html
		form: [ html
				text: 'Registro del Estudiante a Cargo del socio: ';
				render: socio nroSocio.
			html break.
			html text: 'Nombre: '.
			html textInput
				class: 'form-input';
				on: #nombre of: self.
			html break.
			html text: 'Grado: '.
			html numberInput
				class: 'form-input';
				on: #grado of: self;
				value: 0.
			html break.
			html text: 'Division: '.
			html textInput
				class: 'form-input';
				on: #division of: self;
				value: 0.
			html break.
			html text: 'DNI: '.
			html numberInput
				class: 'form-input';
				on: #dniEstudiante of: self;
				value: 0.
			html break.
			html submitButton
				class: 'btn';
				callback: [ self corroborarEstudiante ];
				with: 'Registrar'.
	]
]
