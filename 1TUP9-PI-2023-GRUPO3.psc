Algoritmo turnosVacunatorio
	
	Definir opcionS, stockVacunas, indicePaciente, filasPacientes, columnasPacientes, filasHorarios, columnasHorarios, filasVacunas Como Entero
	Definir entrada, entradaMayu, turnosHorarios, horarios, vacunas, pacientes Como Caracter
	Definir diaLibre, nombreDuplicado, dniDuplicado Como Logico
	entrada = ""
	indicePaciente = 0
	filasPacientes = 40
	columnasPacientes = 6
	filasHorarios = 5
	columnasHorarios = 9
	filasVacunas = 6
	
	// array con las horas
    Dimension horarios[8]
    horarios[0] = "08:00"
    horarios[1] = "08:30"
    horarios[2] = "09:00"
    horarios[3] = "09:30"
    horarios[4] = "10:00"
    horarios[5] = "10:30"
    horarios[6] = "11:00"
    horarios[7] = "11:30"
	
	// array con los dias
	Dimension turnosHorarios[filasHorarios, columnasHorarios]
	turnosHorarios[0,0] = "Lunes"
	turnosHorarios[1,0] = "Martes"
	turnosHorarios[2,0] = "Mi�rcoles"
	turnosHorarios[3,0] = "Jueves"
	turnosHorarios[4,0] = "Viernes"
	
	// ciclo para cargar el arreglo de los horarios
	Para i = 0 Hasta filasHorarios - 1
		Para j = 0 Hasta columnasHorarios - 2  
			turnosHorarios[i,j + 1] = horarios[j]
		FinPara
	FinPara
	
	// array de vacunas
	Dimension vacunas[6]
	vacunas[0] = "Neumococo conjugada"
	vacunas[1] = "Poliomielitis (IPV o Salk)"
	vacunas[2] = "Qu�ntuple (o pentavalente)"
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
	
	// array de los datos de los pacientes
	Dimension pacientes[filasPacientes, columnasPacientes]
	
	Repetir
		
		Escribir "1. Reservar turno"
		
		Escribir "2. Buscar paciente"
		
		Escribir "3. Ver agenda vacunatorio"
		
		Escribir "4. Ordenar y mostrar lista pacientes"
		
		Escribir "   a. Por edad"
		
		Escribir "   b. Por vacuna a aplicar"
		
		Escribir "5. Listado/s"
		
		Escribir "   a. Cantidad turnos otorgados por d�a"
		
		Escribir "   b. Cantidad de vacunas a aplicar por vacuna"
		
		
		Escribir "Ingrese un numero (o SALIR)"
		
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
				Escribir "Funci�n reservar"
				reservarTurno(turnosHorarios, filasHorarios, columnasHorarios, pacientes, indicePaciente, vacunas, stockVacunas, vacunasSelec, diaLibre, dniDuplicado, filasVacunas)
				
			"2":
				Escribir "Funci�n buscar"
				buscarPaciente(pacientes, filasPacientes)
				
			"3":
				Escribir "Funci�n ver agenda"
				mostrarAgenda(turnosHorarios, filasHorarios, columnasHorarios)
				
			"4":
				Escribir "Funci�n ordenar y mostrar"
				ordenarYMostrar(pacientes, filasPacientes, columnasPacientes, indicePaciente)
				
			"5":
				Escribir "Funci�n listado"
				mostrarContadores(pacientes, filasPacientes)
				
		Fin Segun
		
	Mientras Que (entradaMayu <> "SALIR") 
	
	Escribir "Se sali� del sistema."
	
FinAlgoritmo

SubProceso reservarTurno(arregloHorarios, filas, columnas, pacientes, indicePaciente Por Referencia, vacunas, stockVacunas, vacunasSelec Por Referencia, diaLibre Por Referencia, dniDuplicado Por Referencia, filasVacunas)
	diaLibre = Verdadero
	dniDuplicado = Falso
	mostrarDias(arregloHorarios, filas, columnas)
	elegirTurno(arregloHorarios, filas, columnas, pacientes, indicePaciente, diaLibre)
	Si diaLibre
		cargarPaciente(pacientes, indicePaciente, dniDuplicado)
		Si no dniDuplicado Entonces
			mostrarVacunas(pacientes, vacunas, stockVacunas, filasVacunas)
			elegirVacuna(pacientes, vacunas, stockVacunas, indicePaciente)
			indicePaciente = indicePaciente + 1
		FinSi
	FinSi
FinSubProceso

SubProceso mostrarDias(arregloHorarios, filas, columnas)
	Para i = 0 Hasta filas - 1
		contador = 0
		todasLibres = Verdadero 
		Para j = 1 hasta columnas - 1
			Si Longitud(arregloHorarios[i, j]) > 5  Entonces
				contador = contador + 1
			FinSi
		FinPara
		Si contador == columnas - 1 Entonces
			todasLibres = Falso
		FinSi
		Si todasLibres Entonces
			Mostrar i + 1, " - ", arregloHorarios[i, 0]
		SiNo
			Mostrar i + 1, " - ", arregloHorarios[i, 0], " - No hay turnos disponibles"
		FinSi
	FinPara
FinSubProceso

SubProceso elegirTurno(arregloHorarios, filas, columnas, pacientes, indicePaciente Por Referencia, diaLibre Por Referencia)
	Definir contadorOcupado Como Entero
	Definir  dia, hora Como Real
	Definir diaCaracter, horaCaracter Como Caracter
	contadorOcupado = 0
	
	Repetir
		Escribir "Elija el dia 1-5"
		Leer diaCaracter
		esNumero = validarDato(diaCaracter)
		Si esNumero
			dia = ConvertirANumero(diaCaracter)
			Mientras dia < 1 o dia > 5
				Escribir "Error: elija el dia 1-5"
				Leer diaCaracter
				dia = ConvertirANumero(diaCaracter)
				esNumero = validarDato(diaCaracter)
			FinMientras
		FinSi
		
	Mientras Que no esNumero
	
	Para i = dia - 1 Hasta dia - 1 Hacer
		Para j = 1 Hasta 8 Hacer
			Si Longitud(arregloHorarios[i, j]) > 5 Entonces
				contadorOcupado = contadorOcupado + 1
			FinSi
		FinPara
	FinPara
	
	Si contadorOcupado == 8 Entonces
		Escribir "El dia que eligi� tiene todos los horarios ocupados."
		Escribir " "
		diaLibre = Falso
	Sino 
		Para i = dia - 1 Hasta dia - 1 Hacer
			Mostrar arregloHorarios[dia - 1, 0], ":"
			Para j = 1 hasta 8 Hacer
				Mostrar "  ", j, " - ", arregloHorarios[dia - 1, j]
			FinPara
		FinPara
		
		Repetir
			Escribir "Elija la hora 1-8"
			Leer horaCaracter
			esNumero = validarDato(horaCaracter)
			Si esNumero
				hora = ConvertirANumero(horaCaracter)
				Mientras hora < 1 o hora > 8 o no esNumero
					Escribir "Error: elija el horario 1-8"
					Leer horaCaracter
					esNumero = validarDato(horaCaracter)
					Si esNumero
						hora = ConvertirANumero(horaCaracter)
					FinSi
				FinMientras
				
				Mientras Longitud(arregloHorarios[dia - 1, hora]) > 5 o no esNumero
					Escribir "Elija otra hora por favor. Esa ya est� ocupada"
					Leer horaCaracter
					esNumero = validarDato(horaCaracter)
					Si esNumero
						hora = ConvertirANumero(horaCaracter)
					FinSi
				FinMientras
			FinSi
		Mientras Que no esNumero

		pacientes[indicePaciente, 4] = arregloHorarios[dia - 1, 0]
		
		pacientes[indicePaciente, 5] = arregloHorarios[dia  - 1, hora]
		
		diaOcupado = Concatenar(arregloHorarios[dia - 1, hora], " (Ocupado)")
		arregloHorarios[dia - 1, hora] =  diaOcupado
	FinSi
FinSubProceso

SubProceso cargarPaciente(pacientes, indicePaciente Por Referencia, dniDuplicado Por Referencia)
	Definir nombre, apellido, dni, edad Como Caracter
	Definir edadEnMeses Como Logico
	edadEnMeses = Falso
	
		Escribir "Ingrese su nombre"
		Leer nombre
		esNumero = validarDato(nombre)
		Mientras esNumero o nombre == " "
			Escribir "Ingrese su nombre por favor"
			Leer nombre
			esNumero = validarDato(nombre)
		FinMientras
		
		Escribir "Ingrese su apellido"
		Leer apellido
		esNumero = validarDato(apellido)
		Mientras esNumero o apellido == " "
			Escribir "Ingrese su apellido por favor"
			Leer apellido
			esNumero = validarDato(apellido)
		FinMientras
		
		nombreCompleto = nombre + " " + apellido
		pacientes[indicePaciente, 0] = nombreCompleto
		
		Repetir
			Escribir "Ingrese su DNI"
			Leer dni
			esNumero = validarDato(dni)
			Mientras no esNumero o ConvertirANumero(dni) < 1000000 o ConvertirANumero(dni) > 99999999
				Escribir "Ingrese un DNI v�lido menor a 1000000 o mayor a 99999999"
				Leer dni
				esNumero = validarDato(dni)
			FinMientras
			
			encontrarDNI = buscarDNI(pacientes, 5, 1, dni)
			
			Si no encontrarDNI Entonces
				dniDuplicado = Falso
				pacientes[indicePaciente, 1] = dni
				
				Repetir
					Escribir "Ingrese su edad"
					Escribir "   a. En meses"
					Escribir "   b. En a�os"
					Leer edad
				Mientras Que edad<>"a" y edad<>"b"
				
				si edad="a" Entonces
					edadEnMeses = Verdadero
					Escribir "Edad en meses 1-11"
					Leer edad
					esNumero = validarDato(edad)
						Mientras no esNumero o ConvertirANumero(edad) < 1 o ConvertirANumero(edad) > 11
							Escribir "Ingrese su edad nuevamente"
							Leer edad
							esNumero = validarDato(edad)
						FinMientras
				SiNo
					Escribir "Edad en a�os"
					Leer edad
					esNumero = validarDato(edad)
						Mientras no esNumero o ConvertirANumero(edad) < 1 o ConvertirANumero(edad) > 90
							Escribir "Ingrese su edad nuevamente"
							Leer edad
							esNumero = validarDato(edad)
						FinMientras
				FinSi
				Si edadEnMeses Entonces
					edad = "0." + Subcadena(edad, 0, 1)
				FinSi
				pacientes[indicePaciente, 2] = edad
			SiNo
				dniDuplicado = Verdadero
				Escribir "Ya hay otro paciente con ese DNI"
			FinSi
		Mientras Que encontrarDNI
FinSubProceso

SubProceso mostrarVacunas(pacientes, vacunas, stockVacunas, filasVacunas)
	Para i<- 0 Hasta filasVacunas-1 Hacer
		Si stockVacunas[i] > 0 Entonces
			Mostrar i + 1, " - ", vacunas[i]
		SiNo
			Mostrar i + 1, " - ", vacunas[i] , " - STOCK AGOTADO" 
		FinSi
	Fin Para
FinSubProceso

SubProceso elegirVacuna(pacientes, vacunas, stockVacunas, indicePaciente Por Referencia)
	Definir entrada Como Caracter
	Mostrar "Que vacuna desea: "
	Leer entrada
	esNumero = validarDato(entrada)
	Mientras no esNumero
		Mostrar "Que vacuna desea: "
		Leer entrada
		esNumero = validarDato(entrada)
		Si esNumero
			Mientras ConvertirANumero(entrada) < 1 o ConvertirANumero(entrada) > 6
				Mostrar "Ingrese una de las vacunas mostradas: "
				Leer entrada
				esNumero = validarDato(entrada)
			FinMientras
		FinSi
	FinMientras
	
	Si esNumero
		Mientras ConvertirANumero(entrada) < 1 o ConvertirANumero(entrada) > 6
			Mostrar "Ingrese una de las vacunas mostradas: "
			Leer entrada
			esNumero = validarDato(entrada)
			Mientras no esNumero
				Mostrar "Ingrese un n�mero por favor: "
				Leer entrada
				esNumero = validarDato(entrada)
			FinMientras
		FinMientras
		
		Mientras no esNumero o stockVacunas[ConvertirANumero(entrada)-1] == 0
			Mostrar "Esta vacuna no tiene stock. Ingrese otra: "
			Leer entrada
			esNumero = validarDato(entrada)
			Si esNumero
				Mientras ConvertirANumero(entrada) < 1 o ConvertirANumero(entrada) > 6
					Mostrar "Ingrese una de las vacunas mostradas: "
					Leer entrada
					esNumero = validarDato(entrada)
					Mientras no esNumero
						Mostrar "Ingrese un n�mero por favor: "
						Leer entrada
						esNumero = validarDato(entrada)
					FinMientras
				FinMientras
			FinSi
		FinMientras
	FinSi
		
	Si stockVacunas[ConvertirANumero(entrada)-1] > 0
		vacunaSelec = vacunas[ConvertirANumero(entrada)-1]
		stockVacunas[ConvertirANumero(entrada)-1] = (stockVacunas[ConvertirANumero(entrada)-1]) - 1
		Mostrar stockVacunas[ConvertirANumero(entrada)-1]
		pacientes[indicePaciente, 3] = vacunaSelec
	FinSi
	
FinSubProceso

Funcion esNumero = validarDato(valorIngresado) 
	Definir esNumero Como Logico
	
	esNumero <- Verdadero 
	i <- 0
	
	Mientras esNumero Y i <= Longitud(valorIngresado)-1 Hacer
		letra <- SubCadena(valorIngresado, i, Longitud(valorIngresado)-1)
		Si letra >= "0" y letra <= "9"  Entonces
			esNumero = Verdadero
		Sino
			esNumero = Falso
		Fin Si
		i <- i + 1
	Fin Mientras
Fin Funcion

SubProceso buscarPaciente(arrayPacientes, filasPacientes) 
    Definir dni Como Caracter
    Definir i como Entero
    Definir encontrado Como Logico
	
    Mostrar"Ingrese el dni: "
    Leer dni
    i = 0
    encontrado = Falso
	
    Mientras i < filasPacientes-1 y no encontrado
        Si arrayPacientes[i,1] == dni Entonces
            encontrado = Verdadero
            Mostrar "Nombre y apellido: ", arrayPacientes[i, 0]
            Mostrar "DNI: ", arrayPacientes[i, 1]
            Mostrar "Edad: ", arrayPacientes[i, 2]
            Mostrar "Vacuna: ", arrayPacientes[i, 3]
            Mostrar "D�a: ", arrayPacientes[i, 4]
            Mostrar "Hora: ", arrayPacientes[i, 5]
			Mostrar " "
        FinSi
        i = i + 1
    FinMientras
	
    Si no encontrado  Entonces
        Escribir "No se encontr� el DNI buscado"
		Escribir " "
    FinSi
FinSubProceso

Funcion encontrado = buscarDNI(arrayPacientes, filas, columnaABuscar, datoAEncontrar)  
    Definir encontrado Como Logico
    indexPaciente = 0
    encontrado = Falso
	
    Mientras indexPaciente < filas - 1 y no encontrado
        Si arrayPacientes[indexPaciente, columnaABuscar] == datoAEncontrar Entonces
            encontrado = Verdadero
        FinSi
		indexPaciente =  indexPaciente + 1
    FinMientras
FinFuncion

SubProceso mostrarAgenda(array,filas,columnas)
	Para i<-0 Hasta filas-1  Hacer
		Mostrar Sin Saltar array[i,0], ": "
		Para j<-1 Hasta columnas-1 Hacer
			mostrar sin saltar array[i,j], " | "
		Fin Para
		Mostrar " "
		Mostrar " "
	Fin Para
FinSubProceso

SubProceso ordenarYMostrar(arrayPacientes, filas, columnasPaciente, indicePacientes)
	Definir orden Como Caracter
	Repetir
		Escribir "Ordenar y mostrar lista pacientes"
		Escribir "   a. Por edad"
		Escribir "   b. Por vacuna a aplicar"
		Leer orden
	Mientras Que orden<>"a" y orden<>"b"
	
	si orden="a" Entonces
		ordenarLista(arrayPacientes, filas , columnasPaciente, 2, indicePacientes)
	SiNo
		ordenarLista(arrayPacientes, filas , columnasPaciente, 3, indicePacientes)
	FinSi
FinSubProceso

SubProceso ordenarLista(arrayPacientes, filas, columnasPaciente, columnaAOrdenar, indicePacientes)	
	Definir aux, aux2 Como caracter; 
	Para i<-0 Hasta filas-2 Hacer 
		para k<-i+1 hasta filas-1 Hacer 
			si arrayPacientes[i,columnaAOrdenar] < arrayPacientes[k,columnaAOrdenar] Entonces
				Para j<-0 Hasta columnasPaciente-1 Hacer 
					aux <- arrayPacientes[i,j];
					arrayPacientes[i,j] <- arrayPacientes[k,j]; 
					arrayPacientes[k,j] <- aux; 
				Fin Para
			FinSi
		FinPara
	FinPara
	
	Para i = 0 Hasta indicePacientes - 1 Hacer
		Mostrar "Nombre y apellido: ", arrayPacientes[i, 0]
		Mostrar "DNI: ", arrayPacientes[i, 1]
		Mostrar "Edad: ", arrayPacientes[i, 2]
		Mostrar "Vacuna: ", arrayPacientes[i, 3]
		Mostrar "D�a: ", arrayPacientes[i, 4]
		Mostrar "Hora: ", arrayPacientes[i, 5]
		Mostrar " "
	FinPara
FinSubProceso

SubProceso mostrarContadores(arrayPacientes, filas)
	Definir orden Como Caracter
	Repetir
		Escribir "Listado/s"
		Escribir "   a. Cantidad turnos otorgados por d�a"
		Escribir "   b. Cantidad de vacunas a aplicar por vacuna"
		Leer orden
	Mientras Que orden<>"a" y orden<>"b"
	
	Si orden="a" Entonces
		contadorDeDias(arrayPacientes, filas, 4)
	SiNo
		contadorDeVacunas(arrayPacientes, filas, 3)
	FinSi
FinSubProceso

SubProceso contadorDeDias(arrayPacientes, filas, columnaElegida)
	Definir contador1, contador2, contador3, contador4, contador5 Como Entero
	Para i<-0 Hasta filas-1  Hacer
		Para j<-columnaElegida Hasta columnaElegida Hacer
			Segun arrayPacientes[i, j] Hacer
				"Lunes":
					contador1 = contador1 + 1
				"Martes":
					contador2 = contador2 + 1
				"Mi�rcoles":
					contador3 = contador3 + 1
				"Jueves":
					contador4 = contador4 + 1
				"Viernes":
					contador5 = contador5 + 1
				De Otro Modo:
			Fin Segun
		Fin Para
	Fin Para
	Mostrar "La cantidad de turnos para el Lunes es de: ", contador1
	Mostrar "La cantidad de turnos para el Martes es de: ", contador2
	Mostrar "La cantidad de turnos para el Miercoles es de: ", contador3
	Mostrar "La cantidad de turnos para el Jueves es de: ", contador4
	Mostrar "La cantidad de turnos para el Viernes es de: ", contador5
FinSubProceso

SubProceso contadorDeVacunas(arrayPacientes, filas, columnaElegida)
	Definir contador1, contador2, contador3, contador4, contador5, contador6 Como Entero
	Para i<-0 Hasta filas-1  Hacer
		Para j<-columnaElegida Hasta columnaElegida Hacer
			Segun arrayPacientes[i, j] Hacer
				"Neumococo conjugada":
					contador1 = contador1 + 1
				"Poliomielitis (IPV o Salk)":
					contador2 = contador2 + 1
				"Qu�ntuple (o pentavalente)":
					contador3 = contador3 + 1
				"Rotavirus":
					contador4 = contador4 + 1
				"Meningococo":
					contador5 = contador5 + 1
				"Tripe Viral":
					contador6 = contador6 + 1
				De Otro Modo:
			Fin Segun
		Fin Para
	Fin Para
	Mostrar "La cantidad de vacunas a aplicar para Neumococo conjugada es de: ", contador1
	Mostrar "La cantidad de vacunas a aplicar para Poliomielitis (IPV o Salk) es de: ", contador2
	Mostrar "La cantidad de vacunas a aplicar para Qu�ntuple (o pentavalente) es de: ", contador3
	Mostrar "La cantidad de vacunas a aplicar para Rotavirus es de: ", contador4
	Mostrar "La cantidad de vacunas a aplicar para Meningococo es de: ", contador5
	Mostrar "La cantidad de vacunas a aplicar para Tripe Viral es de: ", contador6
FinSubProceso
	