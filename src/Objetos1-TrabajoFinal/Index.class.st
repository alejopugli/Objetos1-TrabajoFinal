"
Para usar la wa evalue el siguiente comando:
WAAdmin register: IndexPage  asApplicationAt: 'index'.
Luego dirijase a localhost:8080/index
"
Class {
	#name : #Index,
	#superclass : #WAComponent,
	#classVars : [
		'cooperativa'
	],
	#category : #'Objetos1-TrabajoFinal-InterfaceDeUsuario'
}

{ #category : #'class initialization' }
Index class >> initialize [
 cooperativa := Cooperativa new
]

{ #category : #rendering }
Index >> renderBotones: html [
	self subclassResponsibility
]

{ #category : #rendering }
Index >> renderContentOn: html [
	html
		form: [ html heading
				level: 1;
				with: 'Bienvenido a su Cooperativa'.
			self renderBotones: html ]
]

{ #category : #hooks }
Index >> style [
	^ '.btn{
   color: #4d74e2;
    border: 1px solid #4d74e2;
background-color:transparent;
    width: 120px;
    height: 25px;
    margin-top: 10px;
    margin-right: 12px;
}
.btn:hover, .btn:focus{
color: white;
    border-color:transparent;
background-color: #4d74e2;
}
h1{
width:500px;
font-family:Arial;
text-align:center
}
'
]

{ #category : #rendering }
Index >> volver [
	self answer
]
