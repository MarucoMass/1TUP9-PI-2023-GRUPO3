Algoritmo sin_titulo
	
	Definir opcionS, stockVacunas, indice Como Entero
	indice = 0

	Definir entrada, entradaMayu, turnosHorarios, horarios, vacunas, pacientes Como Caracter
	
	// array con las horas
	Dimension horarios[8]
	horarios[0] = "  1- 08:00"
	horarios[1] = "  2- 08:30"
	horarios[2] = "  3- 09:00"
	horarios[3] = "  4- 09:30"
	horarios[4] = "  5- 10:00"
	horarios[5] = "  6- 10:30"
	horarios[6] = "  7- 11:00"
	horarios[7] = "  8- 11:30"
	
	// array con los dias
	Dimension turnosHorarios[5, 9]
	turnosHorarios[0,0] = "1. Lunes"
	turnosHorarios[1,0] = "2. Martes"
	turnosHorarios[2,0] = "3. Miércoles"
	turnosHorarios[3,0] = "4. Jueves"
	turnosHorarios[4,0] = "5. Viernes"
	
	// ciclo para cargar el arreglo de los horarios
	Para i = 0 Hasta 4 
		Para j = 0 Hasta 7  
			turnosHorarios[i,j + 1] = horarios[j]
		FinPara
	FinPara
	
	// array de vacunas
	Dimension vacunas[6]
	vacunas[0] = "Neumococo conjugada"
	vacunas[1] = "Poliomielitis (IPV o Salk)"
	vacunas[2] = "Quíntuple (o pentavalente)"
	vacunas[3] = "Rotavirus"
	vacunas[4] = "Meningococo"
	vacunas[5] = "Tripe Viral"
	
	// array del stock cuyo indice corresponde al del arrays de vacunas
	Dimension stockVacunas[6]
	stockVacunas[0] = 10
	stockVacunas[1] = 10
	stockVacunas[2] = 10
	stockVacunas[3] = 10
	stockVacunas[4] = 10
	stockVacunas[5] = 10
	
	Dimension pacientes[50, 6]
	
	entrada = ""
	
	Repetir
		
		Escribir "1. Reservar turno"
		
		Escribir "2. Buscar paciente"
		
		Escribir "3. Ver agenda vacunatorio"
		
		Escribir "4. Ordenar y mostrar lista pacientes"
		
		Escribir "   a. Por edad"
		
		Escribir "   b. Por vacuna a aplicar"
		
		Escribir "5. Listado/s"
		
		Escribir "   a. Cantidad turnos otorgados por día"
		
		Escribir "   b. Cantidad de vacunas a aplicar por vacuna"
		
		
		Escribir "Ingrese un numero(o SALIR)"
		
		Leer entrada
		entradaMayu = Mayusculas(entrada)
		
		Repetir
			
			si entrada <> "1" y entrada <> "5" y entrada <> "2" y entrada <>"3" y entrada <> "4" y entradaMayu <> "SALIR" Entonces
				
				Escribir " Error, ingrese nuevamente:"
				Leer entrada
				entradaMayu = Mayusculas(entrada)
			FinSi
		Hasta Que (entrada = "1" o entrada = "5" o entrada = "2" o entrada = "3" o entrada = "4" o entradaMayu = "SALIR")
		
		Segun entrada Hacer
			
			"1":
				Escribir "Funcion reservar"
				
				mostrarHorarios(turnosHorarios, 5, 9, pacientes)
				//Para i = 0 Hasta 5 Hacer
					//para j = 0 hasta 5
						//Mostrar pacientes[i, j]
					//FinPara
				//FinPara
				mostrar pacientes[0, 0]
				mostrar pacientes[0, 1]
				mostrar pacientes[0, 2]
				mostrar pacientes[0, 3]
				mostrar pacientes[0, 4]
				mostrar pacientes[0, 5]
			"2":
				
				Escribir "Funcion buscar"
				
				//Funcion buscar
				
			"3":
				
				Escribir "Funcion ver agenda"
				
				//Funcion ver agenda
				
			"4":
				
				Escribir "Funcion ordenar y mostrar"
				
				//Funcion ordenar y mostrar
				
			"5":
				
				Escribir "Funcion listado"
				
				//Funcion listado
				
		Fin Segun
		
	Mientras Que (entradaMayu <> "SALIR") 
	
	Escribir "Se salio del sistema"
	
FinAlgoritmo



SubProceso mostrarHorarios(arreglo, filas, columnas, pacientes)
	Para i = 0 Hasta filas - 1
		Mostrar arreglo[i, 0] , ":"
		Para j = 1 hasta columnas - 1
			Mostrar "  " , arreglo[i, j]
		FinPara
	FinPara
	
	// mando a llamar este subproceso aca para que una vez que muestre los dias se ejecute la eleccion del horario
	//tambien por si elige un dia "ocupado" asi vuelve para atras y elige otro dia
	elegirHorario(arreglo, 9, pacientes)
	
FinSubProceso


SubProceso elegirHorario(arreglo, filas, pacientes)
	Escribir "Elija el dia 1-5"
	Leer dia
	
	Mientras dia < 1 o dia > 5
		Escribir "Error: elija el dia 1-5"
		Leer dia
	FinMientras
	
	Para i = 0 hasta filas - 1
		Mostrar arreglo[dia - 1, i]
	FinPara
	
	Escribir "Elija la hora 1-8"
	Leer hora
	
	Mientras hora < 1 o hora > 8 
		Escribir "Error: elija el horario 1-8"
		Leer hora
	FinMientras
	
	// Aca si elige un dia que esta "ocupado" manda a llamar al subproceso que muestra los dias
	Si arreglo[dia - 1, hora] = "  Ocupado"
		Escribir "Elija otro horario por favor. Ese ya está ocupado"
		mostrarHorarios(arreglo, 5, 9, pacientes)
	FinSi
	
	cargarPaciente(indice, dia, hora, pacientes)
	indice = indice + 1
	arreglo[dia - 1, hora] = "  Ocupado"

FinSubProceso



SubProceso cargarPaciente(index, dia, hora, pacientes)
	Definir nombre, apellido, dni, edad Como Caracter
	
		Escribir "Ingrese su nombre"
		Leer nombre
		
		Escribir "Ingrese su apellido"
		Leer apellido
		
		nombreCompleto = Concatenar(nombre, apellido)
		pacientes[index, 0] = nombreCompleto
		
		Escribir "Ingrese su dni"
		Leer dni
		pacientes[0, 1] = dni
		
		Escribir "Ingrese su edad"
		Leer edad
		pacientes[0, 2] = edad
		
		pacientes[0, 3] = edad
		
		pacientes[0, 4] = ConvertirATexto(dia)
		
		pacientes[0, 5] = ConvertirATexto(hora)
	
		
FinSubProceso

	