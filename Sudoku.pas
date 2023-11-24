program Sudoku;

uses crt;
type
	matriz = array [1..9, 1..9] of integer;  // Tipo de variable de arreglo bidimensional de entero
	matrizBoolean = array [1..9, 1..9] of boolean; // Tipo de variable de arreglo bidimensional de tipo booleano
var 
	tableroRes1, tableroRes2, tableroRes3, tableroRes4, tableroRes5, tableroUsuario: matriz; // Variables de tipo matriz para almacenar los distintos tableros a utilizar
	tableroPistas: matrizBoolean; // Variable de tipo matriz de boolean
	i, j, fila, columna, elegirTablero, num: integer;
	nombre: string;
	
procedure instrucciones; // Procedimiento que muestra las instrucciones del juego
begin
	writeln('-----------------------------------------------------------------------------------------------------------------------');
	writeln();
	writeln('----------------------------------------------Bienvenido al Sudoku!----------------------------------------------------');
	writeln();
	writeln('-----------------------------------------------------------------------------------------------------------------------');
	writeln();
	writeln('Las reglas son las siguientes:');
	writeln();
	writeln('- Al iniciar el juego el tablero tendrá 17 pistas que seran de ayuda para completar el Sudoku');
	writeln();
	writeln('- Debera ingresar la fila y la columna donde quiera ingresar un numero');
	writeln();
	writeln('- Tanto la fila como la columna debe ser un numero entre el 1 y el 9');
	writeln();
	writeln('- No esta permitido ingresar un numero donde ya exista un pista, las pistas no se pueden modificar');
	writeln();
	writeln('- Una vez elegida la posicion donde desea poner un numero, podra ingresar el numero que quiera entre el 1 y 9');
	writeln();
	writeln('- Si el numero ingresado en la posicion es incorrecto se vera en rojo, de lo contrario se vera en verde');
	writeln();
	writeln('- Tendra la opcion de rendirse y ver la solucion del Sudoku en cada turno');
	writeln();
	writeln('- El juego acabara cuando complete el Sudoku correctamente o se rinda');

	writeln();
	writeln('-----------------------------------------------------------------------------------------------------------------------');
	writeln();
	writeln('Ahora es tiempo de jugar! Exito!');
	writeln();
	writeln('Presione enter para continuar...');
	readln();
	Clrscr;
end;
	
procedure llenarTablerosResueltos; // Procedimiento que llena 5 tablero con diferentes datos
begin
	// Tablero Resuelto 1
	tableroRes1[1, 1]:= 7;
	tableroRes1[1, 2]:= 1;
	tableroRes1[1, 3]:= 5;
	tableroRes1[1, 4]:= 8;
	tableroRes1[1, 5]:= 3;
	tableroRes1[1, 6]:= 2;
	tableroRes1[1, 7]:= 9;
	tableroRes1[1, 8]:= 4;
	tableroRes1[1, 9]:= 6;
	tableroRes1[2, 1]:= 6;
	tableroRes1[2, 2]:= 3;
	tableroRes1[2, 3]:= 9;
	tableroRes1[2, 4]:= 7;
	tableroRes1[2, 5]:= 4;
	tableroRes1[2, 6]:= 5;
	tableroRes1[2, 7]:= 1;
	tableroRes1[2, 8]:= 2;
	tableroRes1[2, 9]:= 8;
	tableroRes1[3, 1]:= 4;
	tableroRes1[3, 2]:= 2;
	tableroRes1[3, 3]:= 8;
	tableroRes1[3, 4]:= 1;
	tableroRes1[3, 5]:= 9;
	tableroRes1[3, 6]:= 6;
	tableroRes1[3, 7]:= 5;
	tableroRes1[3, 8]:= 7;
	tableroRes1[3, 9]:= 3;
	tableroRes1[4, 1]:= 1;
	tableroRes1[4, 2]:= 8;
	tableroRes1[4, 3]:= 3;
	tableroRes1[4, 4]:= 2;
	tableroRes1[4, 5]:= 5;
	tableroRes1[4, 6]:= 7;
	tableroRes1[4, 7]:= 4;
	tableroRes1[4, 8]:= 6;
	tableroRes1[4, 9]:= 9;
	tableroRes1[5, 1]:= 2;
	tableroRes1[5, 2]:= 6;
	tableroRes1[5, 3]:= 7;
	tableroRes1[5, 4]:= 9;
	tableroRes1[5, 5]:= 8;
	tableroRes1[5, 6]:= 4;
	tableroRes1[5, 7]:= 3;
	tableroRes1[5, 8]:= 5;
	tableroRes1[5, 9]:= 1;
	tableroRes1[6, 1]:= 9;
	tableroRes1[6, 2]:= 5;
	tableroRes1[6, 3]:= 4;
	tableroRes1[6, 4]:= 6;
	tableroRes1[6, 5]:= 1;
	tableroRes1[6, 6]:= 3;
	tableroRes1[6, 7]:= 2;
	tableroRes1[6, 8]:= 8;
	tableroRes1[6, 9]:= 7;
	tableroRes1[7, 1]:= 5;
	tableroRes1[7, 2]:= 4;
	tableroRes1[7, 3]:= 1;
	tableroRes1[7, 4]:= 3;
	tableroRes1[7, 5]:= 7;
	tableroRes1[7, 6]:= 8;
	tableroRes1[7, 7]:= 6;
	tableroRes1[7, 8]:= 9;
	tableroRes1[7, 9]:= 2;
	tableroRes1[8, 1]:= 3;
	tableroRes1[8, 2]:= 7;
	tableroRes1[8, 3]:= 6;
	tableroRes1[8, 4]:= 4;
	tableroRes1[8, 5]:= 2;
	tableroRes1[8, 6]:= 9;
	tableroRes1[8, 7]:= 8;
	tableroRes1[8, 8]:= 1;
	tableroRes1[8, 9]:= 5;
	tableroRes1[9, 1]:= 8;
	tableroRes1[9, 2]:= 9;
	tableroRes1[9, 3]:= 2;
	tableroRes1[9, 4]:= 5;
	tableroRes1[9, 5]:= 6;
	tableroRes1[9, 6]:= 1;
	tableroRes1[9, 7]:= 7;
	tableroRes1[9, 8]:= 3;
	tableroRes1[9, 9]:= 4;	
	// Tablero Resuelto 2
	tableroRes2[1, 1]:= 8;
	tableroRes2[1, 2]:= 3;
	tableroRes2[1, 3]:= 2;
	tableroRes2[1, 4]:= 7;
	tableroRes2[1, 5]:= 5;
	tableroRes2[1, 6]:= 1;
	tableroRes2[1, 7]:= 4;
	tableroRes2[1, 8]:= 9;
	tableroRes2[1, 9]:= 6;
	tableroRes2[2, 1]:= 7;
	tableroRes2[2, 2]:= 4;
	tableroRes2[2, 3]:= 5;
	tableroRes2[2, 4]:= 6;
	tableroRes2[2, 5]:= 9;
	tableroRes2[2, 6]:= 3;
	tableroRes2[2, 7]:= 2;
	tableroRes2[2, 8]:= 1;
	tableroRes2[2, 9]:= 8;
	tableroRes2[3, 1]:= 1;
	tableroRes2[3, 2]:= 9;
	tableroRes2[3, 3]:= 6;
	tableroRes2[3, 4]:= 4;
	tableroRes2[3, 5]:= 8;
	tableroRes2[3, 6]:= 2;
	tableroRes2[3, 7]:= 7;
	tableroRes2[3, 8]:= 5;
	tableroRes2[3, 9]:= 3;
	tableroRes2[4, 1]:= 9;
	tableroRes2[4, 2]:= 8;
	tableroRes2[4, 3]:= 4;
	tableroRes2[4, 4]:= 2;
	tableroRes2[4, 5]:= 7;
	tableroRes2[4, 6]:= 6;
	tableroRes2[4, 7]:= 5;
	tableroRes2[4, 8]:= 3;
	tableroRes2[4, 9]:= 1;
	tableroRes2[5, 1]:= 2;
	tableroRes2[5, 2]:= 5;
	tableroRes2[5, 3]:= 7;
	tableroRes2[5, 4]:= 1;
	tableroRes2[5, 5]:= 3;
	tableroRes2[5, 6]:= 8;
	tableroRes2[5, 7]:= 6;
	tableroRes2[5, 8]:= 4;
	tableroRes2[5, 9]:= 9;
	tableroRes2[6, 1]:= 6;
	tableroRes2[6, 2]:= 1;
	tableroRes2[6, 3]:= 3;
	tableroRes2[6, 4]:= 9;
	tableroRes2[6, 5]:= 4;
	tableroRes2[6, 6]:= 5;
	tableroRes2[6, 7]:= 8;
	tableroRes2[6, 8]:= 2;
	tableroRes2[6, 9]:= 7;
	tableroRes2[7, 1]:= 3;
	tableroRes2[7, 2]:= 7;
	tableroRes2[7, 3]:= 8;
	tableroRes2[7, 4]:= 5;
	tableroRes2[7, 5]:= 1;
	tableroRes2[7, 6]:= 4;
	tableroRes2[7, 7]:= 9;
	tableroRes2[7, 8]:= 6;
	tableroRes2[7, 9]:= 2;
	tableroRes2[8, 1]:= 4;
	tableroRes2[8, 2]:= 2;
	tableroRes2[8, 3]:= 9;
	tableroRes2[8, 4]:= 3;
	tableroRes2[8, 5]:= 6;
	tableroRes2[8, 6]:= 7;
	tableroRes2[8, 7]:= 1;
	tableroRes2[8, 8]:= 8;
	tableroRes2[8, 9]:= 5;
	tableroRes2[9, 1]:= 5;
	tableroRes2[9, 2]:= 6;
	tableroRes2[9, 3]:= 1;
	tableroRes2[9, 4]:= 8;
	tableroRes2[9, 5]:= 2;
	tableroRes2[9, 6]:= 9;
	tableroRes2[9, 7]:= 3;
	tableroRes2[9, 8]:= 7;
	tableroRes2[9, 9]:= 4;
	// Tablero Resuelto 3
	tableroRes3[1, 1]:= 5;
	tableroRes3[1, 2]:= 3;
	tableroRes3[1, 3]:= 4;
	tableroRes3[1, 4]:= 8;
	tableroRes3[1, 5]:= 7;
	tableroRes3[1, 6]:= 1;
	tableroRes3[1, 7]:= 2;
	tableroRes3[1, 8]:= 9;
	tableroRes3[1, 9]:= 6;
	tableroRes3[2, 1]:= 6;
	tableroRes3[2, 2]:= 7;
	tableroRes3[2, 3]:= 2;
	tableroRes3[2, 4]:= 3;
	tableroRes3[2, 5]:= 4;
	tableroRes3[2, 6]:= 9;
	tableroRes3[2, 7]:= 5;
	tableroRes3[2, 8]:= 8;
	tableroRes3[2, 9]:= 1;
	tableroRes3[3, 1]:= 1;
	tableroRes3[3, 2]:= 8;
	tableroRes3[3, 3]:= 9;
	tableroRes3[3, 4]:= 2;
	tableroRes3[3, 5]:= 5;
	tableroRes3[3, 6]:= 6;
	tableroRes3[3, 7]:= 7;
	tableroRes3[3, 8]:= 4;
	tableroRes3[3, 9]:= 3;
	tableroRes3[4, 1]:= 9;
	tableroRes3[4, 2]:= 4;
	tableroRes3[4, 3]:= 7;
	tableroRes3[4, 4]:= 1;
	tableroRes3[4, 5]:= 3;
	tableroRes3[4, 6]:= 2;
	tableroRes3[4, 7]:= 8;
	tableroRes3[4, 8]:= 6;
	tableroRes3[4, 9]:= 5;
	tableroRes3[5, 1]:= 2;
	tableroRes3[5, 2]:= 1;
	tableroRes3[5, 3]:= 6;
	tableroRes3[5, 4]:= 5;
	tableroRes3[5, 5]:= 9;
	tableroRes3[5, 6]:= 8;
	tableroRes3[5, 7]:= 3;
	tableroRes3[5, 8]:= 7;
	tableroRes3[5, 9]:= 4;
	tableroRes3[6, 1]:= 8;
	tableroRes3[6, 2]:= 5;
	tableroRes3[6, 3]:= 3;
	tableroRes3[6, 4]:= 7;
	tableroRes3[6, 5]:= 6;
	tableroRes3[6, 6]:= 4;
	tableroRes3[6, 7]:= 1;
	tableroRes3[6, 8]:= 2;
	tableroRes3[6, 9]:= 9;
	tableroRes3[7, 1]:= 4;
	tableroRes3[7, 2]:= 2;
	tableroRes3[7, 3]:= 5;
	tableroRes3[7, 4]:= 6;
	tableroRes3[7, 5]:= 8;
	tableroRes3[7, 6]:= 3;
	tableroRes3[7, 7]:= 9;
	tableroRes3[7, 8]:= 1;
	tableroRes3[7, 9]:= 7;
	tableroRes3[8, 1]:= 7;
	tableroRes3[8, 2]:= 6;
	tableroRes3[8, 3]:= 8;
	tableroRes3[8, 4]:= 9;
	tableroRes3[8, 5]:= 1;
	tableroRes3[8, 6]:= 5;
	tableroRes3[8, 7]:= 4;
	tableroRes3[8, 8]:= 3;
	tableroRes3[8, 9]:= 2;
	tableroRes3[9, 1]:= 3;
	tableroRes3[9, 2]:= 9;
	tableroRes3[9, 3]:= 1;
	tableroRes3[9, 4]:= 4;
	tableroRes3[9, 5]:= 2;
	tableroRes3[9, 6]:= 7;
	tableroRes3[9, 7]:= 6;
	tableroRes3[9, 8]:= 5;
	tableroRes3[9, 9]:= 8;
	//Tablero Resuelto 4
	tableroRes4[1, 1]:= 1;
	tableroRes4[1, 2]:= 2;
	tableroRes4[1, 3]:= 9;
	tableroRes4[1, 4]:= 6;
	tableroRes4[1, 5]:= 8;
	tableroRes4[1, 6]:= 3;
	tableroRes4[1, 7]:= 4;
	tableroRes4[1, 8]:= 5;
	tableroRes4[1, 9]:= 7;
	tableroRes4[2, 1]:= 6;
	tableroRes4[2, 2]:= 4;
	tableroRes4[2, 3]:= 8;
	tableroRes4[2, 4]:= 7;
	tableroRes4[2, 5]:= 1;
	tableroRes4[2, 6]:= 5;
	tableroRes4[2, 7]:= 2;
	tableroRes4[2, 8]:= 9;
	tableroRes4[2, 9]:= 3;
	tableroRes4[3, 1]:= 3;
	tableroRes4[3, 2]:= 7;
	tableroRes4[3, 3]:= 5;
	tableroRes4[3, 4]:= 9;
	tableroRes4[3, 5]:= 2;
	tableroRes4[3, 6]:= 4;
	tableroRes4[3, 7]:= 6;
	tableroRes4[3, 8]:= 1;
	tableroRes4[3, 9]:= 8;
	tableroRes4[4, 1]:= 4;
	tableroRes4[4, 2]:= 9;
	tableroRes4[4, 3]:= 1;
	tableroRes4[4, 4]:= 8;
	tableroRes4[4, 5]:= 3;
	tableroRes4[4, 6]:= 2;
	tableroRes4[4, 7]:= 5;
	tableroRes4[4, 8]:= 7;
	tableroRes4[4, 9]:= 6;
	tableroRes4[5, 1]:= 2;
	tableroRes4[5, 2]:= 3;
	tableroRes4[5, 3]:= 7;
	tableroRes4[5, 4]:= 5;
	tableroRes4[5, 5]:= 4;
	tableroRes4[5, 6]:= 6;
	tableroRes4[5, 7]:= 1;
	tableroRes4[5, 8]:= 8;
	tableroRes4[5, 9]:= 9;
	tableroRes4[6, 1]:= 5;
	tableroRes4[6, 2]:= 8;
	tableroRes4[6, 3]:= 6;
	tableroRes4[6, 4]:= 1;
	tableroRes4[6, 5]:= 9;
	tableroRes4[6, 6]:= 7;
	tableroRes4[6, 7]:= 3;
	tableroRes4[6, 8]:= 2;
	tableroRes4[6, 9]:= 4;
	tableroRes4[7, 1]:= 8;
	tableroRes4[7, 2]:= 1;
	tableroRes4[7, 3]:= 3;
	tableroRes4[7, 4]:= 2;
	tableroRes4[7, 5]:= 6;
	tableroRes4[7, 6]:= 9;
	tableroRes4[7, 7]:= 7;
	tableroRes4[7, 8]:= 4;
	tableroRes4[7, 9]:= 5;
	tableroRes4[8, 1]:= 9;
	tableroRes4[8, 2]:= 5;
	tableroRes4[8, 3]:= 4;
	tableroRes4[8, 4]:= 3;
	tableroRes4[8, 5]:= 7;
	tableroRes4[8, 6]:= 1;
	tableroRes4[8, 7]:= 8;
	tableroRes4[8, 8]:= 6;
	tableroRes4[8, 9]:= 2;
	tableroRes4[9, 1]:= 7;
	tableroRes4[9, 2]:= 6;
	tableroRes4[9, 3]:= 2;
	tableroRes4[9, 4]:= 4;
	tableroRes4[9, 5]:= 5;
	tableroRes4[9, 6]:= 8;
	tableroRes4[9, 7]:= 9;
	tableroRes4[9, 8]:= 3;
	tableroRes4[9, 9]:= 1;
	// Tablero Resuelto 5
	tableroRes5[1, 1]:= 3;
	tableroRes5[1, 2]:= 7;
	tableroRes5[1, 3]:= 4;
	tableroRes5[1, 4]:= 9;
	tableroRes5[1, 5]:= 2;
	tableroRes5[1, 6]:= 8;
	tableroRes5[1, 7]:= 5;
	tableroRes5[1, 8]:= 1;
	tableroRes5[1, 9]:= 6;
	tableroRes5[2, 1]:= 1;
	tableroRes5[2, 2]:= 8;
	tableroRes5[2, 3]:= 5;
	tableroRes5[2, 4]:= 7;
	tableroRes5[2, 5]:= 6;
	tableroRes5[2, 6]:= 3;
	tableroRes5[2, 7]:= 4;
	tableroRes5[2, 8]:= 9;
	tableroRes5[2, 9]:= 2;
	tableroRes5[3, 1]:= 9;
	tableroRes5[3, 2]:= 6;
	tableroRes5[3, 3]:= 2;
	tableroRes5[3, 4]:= 4;
	tableroRes5[3, 5]:= 1;
	tableroRes5[3, 6]:= 5;
	tableroRes5[3, 7]:= 3;
	tableroRes5[3, 8]:= 8;
	tableroRes5[3, 9]:= 7;
	tableroRes5[4, 1]:= 8;
	tableroRes5[4, 2]:= 2;
	tableroRes5[4, 3]:= 7;
	tableroRes5[4, 4]:= 5;
	tableroRes5[4, 5]:= 4;
	tableroRes5[4, 6]:= 9;
	tableroRes5[4, 7]:= 6;
	tableroRes5[4, 8]:= 3;
	tableroRes5[4, 9]:= 1;
	tableroRes5[5, 1]:= 6;
	tableroRes5[5, 2]:= 4;
	tableroRes5[5, 3]:= 9;
	tableroRes5[5, 4]:= 8;
	tableroRes5[5, 5]:= 3;
	tableroRes5[5, 6]:= 1;
	tableroRes5[5, 7]:= 2;
	tableroRes5[5, 8]:= 7;
	tableroRes5[5, 9]:= 5;
	tableroRes5[6, 1]:= 5;
	tableroRes5[6, 2]:= 3;
	tableroRes5[6, 3]:= 1;
	tableroRes5[6, 4]:= 6;
	tableroRes5[6, 5]:= 7;
	tableroRes5[6, 6]:= 2;
	tableroRes5[6, 7]:= 9;
	tableroRes5[6, 8]:= 4;
	tableroRes5[6, 9]:= 8;
	tableroRes5[7, 1]:= 4;
	tableroRes5[7, 2]:= 9;
	tableroRes5[7, 3]:= 6;
	tableroRes5[7, 4]:= 1;
	tableroRes5[7, 5]:= 5;
	tableroRes5[7, 6]:= 7;
	tableroRes5[7, 7]:= 8;
	tableroRes5[7, 8]:= 2;
	tableroRes5[7, 9]:= 3;
	tableroRes5[8, 1]:= 2;
	tableroRes5[8, 2]:= 1;
	tableroRes5[8, 3]:= 8;
	tableroRes5[8, 4]:= 3;
	tableroRes5[8, 5]:= 9;
	tableroRes5[8, 6]:= 6;
	tableroRes5[8, 7]:= 7;
	tableroRes5[8, 8]:= 5;
	tableroRes5[8, 9]:= 4;
	tableroRes5[9, 1]:= 7;
	tableroRes5[9, 2]:= 5;
	tableroRes5[9, 3]:= 3;
	tableroRes5[9, 4]:= 2;
	tableroRes5[9, 5]:= 8;
	tableroRes5[9, 6]:= 4;
	tableroRes5[9, 7]:= 1;
	tableroRes5[9, 8]:= 6;
	tableroRes5[9, 9]:= 9;
end;

procedure crearPistas(var arr: matriz); // Procedimiento que crea las pistas mostradas al usuario
var
	i, j, k: integer;
begin
	for i:= 1 to 9 do  // Bucle anidado que copia los valores del tablero resuleto al tablero del usuario
		for j:= 1 to 9 do
		begin
			tableroUsuario[i, j]:= arr[i, j]; // Copia los datos de un tablero resuelto al tablero en el que jugará el usuario
			tableroPistas[i, j]:= true; // Establece las posiciones en cada fila y columna como pista
		end;
			
	for k:= 1 to 64 do  // Bucle que se repite 64 veces
	begin
		repeat
			i:= random(9) + 1; // Selecciona una fila aleatoria para convertir el elemento en 0
			j:= random(9) + 1; // Selecciona una columan aleatoria para convertir el elemento en 0
		until (tableroUsuario[i, j] <> 0); // Sigue repitiendo este proceso hasta que no queden celdas sin 0
		tableroUsuario[i, j]:= 0; // Reemplaza el valor del tablero por un 0
		tableroPistas[i, j]:= false; // Las posiciones reemplazadas por un 0 dejan de estar establecidas como pistas
	end;
end;

procedure imprimirTableroUsuario(var arr, tabResuelto: matriz); // procedimiento que imprime el tablero del usuario
var 
	i, j: integer;
begin
	writeln('--------SUDOKU--------');
	writeln('    ');
	writeln('  -----------------------');
	for i:= 1 to 9 do
	begin
		write('F', i, '| '); // Dentro del bucle se imprime al lado de cada fila el numero que le corresponde a dicha fila
		for j:= 1 to 9 do
		begin
			if (arr[i, j] = 0) then // Si el valor que corresponde a la posición es un cero se imprime un espacio vacío
			begin
				write('  ');
			end
			else
			begin
				if (arr[i, j] <> tabResuelto[i, j]) then // Si el valor en esta posición en el tablero del usuario es diferente al valor en la misma posición en el tablero resuelto el número se muestra en rojo
				begin
					TextColor(Red);
					write(arr[i, j], ' ');
					TextColor(White);
				end
				else if (tableroPistas[i, j]) then
				begin
					TextColor(Green); // Si el número es una pista se imprime en color verde
					write(arr[i, j], ' ');
					TextColor(White);
				end
				else
				begin
					TextColor(Blue); // Si el número ingresado por el usuario es correcto se imprime en color azul
					write(arr[i, j], ' ');
					TextColor(White);
				end;
			end;
			if (j mod 3 = 0) then // Si el número de la columna es divisible entre 3 se imprime una línea vertical para separar los cuadrantes
				write('|');
		end;
		writeln();
		if (i mod 3 = 0) then // Si el número de la fila es divisible entre 3 se imprime una línea horizontal para dividir el tablero
			writeln('  -----------------------');
	end;
end;

procedure pedirNombre; // Procedimiento que pide y valida el nombre de usuario del jugador
var
	contNombre: integer;
	nombreValido: boolean;
begin
	repeat
		write('Por favor ingrese su nombre de usuario: ');
		readln(nombre);
		nombreValido:= True; 
		for contNombre:= 1 to length(nombre) do // Bucle que pasa por cada caracter de la variable nombre
		begin
			if not (nombre[contNombre] in ['A'..'Z', 'a'..'z', '1'..'9']) then // Verifica que el nombre solo tiene letras y numeros
			begin
				nombreValido:= False; // En caso de que no se cumpla la condición, la variable se le asigan el valor False
				break;                 
			end;
		end;
		if not nombreValido then
		begin
			writeln('Nombre invalido.'); // Imprime un mensaje de error si la variable tiene el valor False
		end;
	until nombreValido;
end;

function pedirPosicion: boolean; // Función que verifica que la posición que el usuario desea modificar es válida
var
	fil, col, error: integer;
	nroEntrada: string;
begin
	repeat
		write('Por favor ingrese la fila (1-9): ');
		readln(nroEntrada);
		Val(nroEntrada, fil, error); // Intenta convertir la entrada del usuario a un número entero
		if (error <> 0) or (fil < 1) or (fil > 9) then // Si la entrada no es un número entero o entre 1 y 9, se muestra un mensaje de error
		begin
			writeln('Entrada invalida, por favor ingrese un numero valido.');
		end;
	until (error = 0) and (fil >= 1) and (fil <= 9); // Se repite hasta que se ingrese un número válido
	repeat
		write('Por favor ingrese la columna (1-9): ');
		readln(nroEntrada);
		Val(nroEntrada, col, error);
		if (error <> 0) or (col < 1) or (col > 9) then
		begin
			writeln('Entrada invalida, por favor ingrese un numero valido.');
		end;
	until (error = 0) and (col >= 1) and (col <= 9);
	if (tableroPistas[fil, col]) then // En caso de que la posición ingresada por el usuario corresponda a la posición de una pista, se imrpime un mensaje de error
	begin
		writeln('La posicion ingresada ya contiene una pista y no puede ser modificada, por favor ingrese una posicion diferentes.');
		pedirPosicion:= false;
		readln();
	end
	else
	begin
		fila:= fil;
		columna:= col;
		pedirPosicion:= true;
	end;
end;

function pedirNumero(var tabRes: matriz): integer; // Función que pide y valida el número que quiere ingresar el usuario en la posición seleccionada
var
	nroError, contLetras: integer;
	entrada: string;
	opcValida: boolean;
begin
	num:= -1;
	repeat
		write('Ingrese el numero que desea colocar en esa posicion (escriba "rendirse" para abandonar la partida): '); // Da la opción de rendirse y salir del juego
		readln(entrada);
		for i:= 1 to length(entrada) do
			entrada[i]:= UpCase(entrada[i]); // Convierte cada carcater de la entrada en mayúscula
		opcValida:= true;
		for contLetras:= 1 to length(entrada) do
		begin
			if not (entrada[contLetras] in ['A'..'Z']) then // verifica que la entrada solo tenga letras en caso de querer rendirse
			begin
				opcValida:= false;
				break;
			end;
		end;
		if not opcValida or (entrada <> 'RENDIRSE') then // Se repite hasta que ingrese la palabra correcta
		begin
			writeln('Opcion invalida');
		end
		else if (entrada = 'RENDIRSE') then // En caso de rendirse imprime el tablero con todos los números en su lugar correcto
		begin
			writeln();
			writeln('Has decidido rendirte');
			writeln('Presiona enter para ver la solucion del Sudoku');
			readln();
			Clrscr;
			writeln('  -----------------------');
			for i:= 1 to 9 do
			begin
				write('F', i, '| ');
				for j:= 1 to 9 do
				begin
					TextColor(Green);
					write(tabRes[i, j], ' ');
					TextColor(White);
					if (j mod 3 = 0) then
						write('|');
				end;
				writeln();
				if (i mod 3 = 0) then
					writeln('  -----------------------');
			end;
			writeln();
			writeln('Presiona enter para salir...');
			readln();
			Halt;
		end;
		Val(entrada, num, nroError); // Si la entrada no es rendirse, verifica que sea un número 
		if (nroError <> 0) or (num < 1) or (num > 9) then
		begin
			writeln('Entrada invalida, por favor ingrese un numero valido.');
			num:= -1;
		end
		else if (num < 1) and (num > 9) then // Si el número ingresado no está entre 1 y 9 imprime un mnesaje de error
		begin
			write('El numero debe estar entre 1 y 9, por favor ingresa un numero valido.');
			num:= -1;
		end;
	until (num <> -1) or (entrada = 'RENDIRSE'); // Se repite el bucle hasta que el usuario escriba rendirse o un número entre 1 y 9
	pedirNumero:= num;
end;

function juegoTerminado(var tabSol: matriz): boolean; // Esta función verifica que el tablero del usuario sea igual al tablero resuelto
var
	i, j: integer;
begin
	for i:= 1 to 9 do
	begin
		for j:= 1 to 9 do
			begin
				if (tableroUsuario[i, j] <> tabsol[i, j]) then // Si algún número del tablero del usuario es diferente al tablero resuelto la función devuelve un valor false
				begin
					juegoTerminado:= false;
					exit;
				end;
		end;
	end;
	writeln('Felicitaciones ', nombre, '! Has logrado completar el Sudoku!');
	juegoTerminado:= true; // Si el tablero del usuario es igual al tablero resuelto, la función devuelve true
end;

BEGIN // Bloque principal del programa
	while true do
	begin
		instrucciones;
		pedirNombre;
		Clrscr;
		llenarTablerosResueltos;
		randomize;
		elegirTablero:= random(5) + 1; // Aquí se elige al azar uno de los 5 tableros completos que será el qu el usuario tendrá que completar
		case elegirTablero of
		1: begin
			Clrscr;
			crearPistas(tableroRes1); // Se crean las pistas en posiciones al azar tomando valores del tablero resuelto que haya tocado
			repeat
				Clrscr;
				imprimirTableroUsuario(tableroUsuario, tableroRes1);
				writeln();
				if pedirPosicion then // Pide la posición donde el jugador desea ingresar un número, si es válida el programa continua
				begin
					tableroUsuario[fila, columna]:= pedirNumero(tableroRes1); // Pide el número que quiere ingresar el usuario en la posición seleccionada
					Clrscr;
					imprimirTableroUsuario(tableroUsuario, tableroRes1); // Vuelve a impimir el tablero del usuario con los números ingresado por el usuario
				end;
			until juegoTerminado(tableroRes1); // Esto se repite hasta que el usuario complete el Sudoku
			exit;
		end;
		2: begin
			Clrscr;
			crearPistas(tableroRes2);
			repeat
				Clrscr;
				imprimirTableroUsuario(tableroUsuario, tableroRes2);
				writeln();
				if pedirPosicion then
				begin
					tableroUsuario[fila, columna]:= pedirNumero(tableroRes2);
					Clrscr;
					imprimirTableroUsuario(tableroUsuario, tableroRes2);
				end;
			until juegoTerminado(tableroRes2);
			exit;
		end;
		3: begin
			Clrscr;
			crearPistas(tableroRes3);
			repeat
				Clrscr;
				imprimirTableroUsuario(tableroUsuario, tableroRes3);
				writeln();
				if pedirPosicion then
				begin
					tableroUsuario[fila, columna]:= pedirNumero(tableroRes3);
					Clrscr;
					imprimirTableroUsuario(tableroUsuario, tableroRes3);
				end;
			until juegoTerminado(tableroRes3);
			exit;
		end;
		4: begin
			Clrscr;
			crearPistas(tableroRes4);
			repeat
				Clrscr;
				imprimirTableroUsuario(tableroUsuario, tableroRes4);
				writeln();
				if pedirPosicion then
				begin
					tableroUsuario[fila, columna]:= pedirNumero(tableroRes4);
					Clrscr;
					imprimirTableroUsuario(tableroUsuario, tableroRes4);
				end;
			until juegoTerminado(tableroRes4);
			exit;
		end;
		5: begin
			Clrscr;
			crearPistas(tableroRes5);
			repeat
				Clrscr;
				imprimirTableroUsuario(tableroUsuario, tableroRes5);
				writeln();
				if pedirPosicion then
				begin
					tableroUsuario[fila, columna]:= pedirNumero(tableroRes5);
					Clrscr;
					imprimirTableroUsuario(tableroUsuario, tableroRes5);
				end;
			until juegoTerminado(tableroRes5);
			exit;
		end;
		end;
	end;	
END.

