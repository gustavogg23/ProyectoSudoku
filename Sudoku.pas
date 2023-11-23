program Sudoku;

uses crt;
type
	matriz = array [1..9, 1..9] of integer;
	matrizBoolean = array [1..9, 1..9] of boolean;
var 
	tableroRes1, tableroRes2, tableroRes3, tableroRes4, tableroRes5, tableroUsuario: matriz;
	tableroPistas: matrizBoolean;
	i, j, fila, columna, elegirTablero, num: integer;
	nombre: string;
	
procedure llenarTablerosResueltos;
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
			tableroUsuario[i, j]:= arr[i, j];
			tableroPistas[i, j]:= true; // Establece las posiciones en cada fila y columna como pista
		end;
			
	for k:= 1 to 64 do  // Bucle que se repite 64 veces
	begin
		repeat
			i:= random(9) + 1; // Selecciona una fila aleatoria 
			j:= random(9) + 1; // Selecciona una columan aleatoria 
		until (tableroUsuario[i, j] <> 0); // Sigue repitiendo este proceso hasta que no queden celdas sin 0
		tableroUsuario[i, j]:= 0; // Reemplaza el valor del tablero por un 0
		tableroPistas[i, j]:= false; // Las posiciones reemplazadas por un 0 dejan de estar establecidas como pistas
	end;
end;

procedure imprimirTableroUsuario(var arr, tabResuelto: matriz);
var 
	i, j: integer;
begin
	writeln('SUDOKU');
	writeln('    ');
	writeln('-----------------------');
	for i:= 1 to 9 do
	begin
		write('| ');
		for j:= 1 to 9 do
		begin
			if (arr[i, j] = 0) then
			begin
				write('  ');
			end
			else
			begin
				if (arr[i, j] <> tabResuelto[i, j]) then
				begin
					TextColor(Red);
					write(arr[i, j], ' ');
					TextColor(White);
				end
				else
				begin
					TextColor(Green);
					write(arr[i, j], ' ');
					TextColor(White);
				end;
			end;
			if (j mod 3 = 0) then
				write('|');
		end;
		write(' F', i);
		writeln();
		if (i mod 3 = 0) then
			writeln('-----------------------');
	end;
end;

procedure pedirNombre;
var
	contNombre: integer;
	nombreValido: boolean;
begin
	repeat
		write('Por favor ingrese su nombre: ');
		readln(nombre);
		nombreValido:= True; 
		for contNombre:= 1 to length(nombre) do // Bucle que pasa por cada caracter de la variable nombre
		begin
			if not (nombre[contNombre] in ['A'..'Z', 'a'..'z', ' ']) then // Verifica que el nombre solo tiene letras y espacios
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

function pedirPosicion: boolean;
var
	fil, col, error: integer;
	nroEntrada: string;
begin
	repeat
		write('Por favor ingrese la fila (1-9): ');
		readln(nroEntrada);
		Val(nroEntrada, fil, error);
		if (error <> 0) or (fil < 1) or (fil > 9) then
		begin
			writeln('Entrada invalida, por favor ingrese un numero valido.');
		end;
	until (error = 0) and (fil >= 1) and (fil <= 9);
	repeat
		write('Por favor ingrese la columna (1-9): ');
		readln(nroEntrada);
		Val(nroEntrada, col, error);
		if (error <> 0) or (col < 1) or (col > 9) then
		begin
			writeln('Entrada invalida, por favor ingrese un numero valido.');
		end;
	until (error = 0) and (col >= 1) and (col <= 9);
	if (tableroPistas[fil, col]) then
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

function pedirNumero(var tabRes: matriz): integer;
var
	nroError, contLetras: integer;
	entrada: string;
	opcValida: boolean;
begin
	num:= -1;
	repeat
		write('Ingrese el numero que desea colocar en esa posicion (escriba "rendirse" para abandonar la partida): ');
		readln(entrada);
		for i:= 1 to length(entrada) do
			entrada[i]:= UpCase(entrada[i]);
		opcValida:= true;
		for contLetras:= 1 to length(entrada) do
		begin
			if not (entrada[contLetras] in ['A'..'Z']) then
			begin
				opcValida:= false;
				break;
			end;
		end;
		if not opcValida or (entrada <> 'RENDIRSE') then
		begin
			writeln('Opcion invalida');
		end
		else if (entrada = 'RENDIRSE') then
		begin
			writeln('Has decidido rendirte');
			writeln('Presiona enter para ver la solucion del Sudoku');
			readln();
			Clrscr;
			writeln('-----------------------');
			for i:= 1 to 9 do
			begin
				write('| ');
				for j:= 1 to 9 do
				begin
					TextColor(Green);
					write(tabRes[i, j], ' ');
					TextColor(White);
					if (j mod 3 = 0) then
						write('|');
				end;
				write(' F', i);
				writeln();
				if (i mod 3 = 0) then
					writeln('-----------------------');
			end;
			writeln();
			writeln('Presiona enter para salir...');
			readln();
			Halt;
		end;
		Val(entrada, num, nroError);
		if (nroError <> 0) then
		begin
			writeln('Entrada invalida, por favor ingrese un numero valido.');
			num:= -1;
		end
		else if (num < 1) and (num > 9) then
		begin
			write('El numero debe estar entre 1 y 9, por favor ingresa un numero valido.');
			num:= -1;
		end;
	until (num <> -1) or (entrada = 'RENDIRSE');
	pedirNumero:= num;
end;

function juegoTerminado(var tabSol: matriz): boolean;
var
	i, j: integer;
begin
	for i:= 1 to 9 do
	begin
		for j:= 1 to 9 do
			begin
				if (tableroUsuario[i, j] <> tabsol[i, j]) then
				begin
					juegoTerminado:= false;
					exit;
				end;
		end;
	end;
	writeln('Felicitaciones ', nombre, '! Has logrado completar el Sudoku!');
	juegoTerminado:= true;
end;

BEGIN
	randomize;
	while true do
	begin
		llenarTablerosResueltos;
		elegirTablero:= random(5) + 1;
		pedirNombre;
		case elegirTablero of
		1: begin
			Clrscr;
			crearPistas(tableroRes1);
			repeat
				Clrscr;
				imprimirTableroUsuario(tableroUsuario, tableroRes1);
				writeln();
				if pedirPosicion then
				begin
					tableroUsuario[fila, columna]:= pedirNumero(tableroRes1);
					Clrscr;
					imprimirTableroUsuario(tableroUsuario, tableroRes1);
				end;
			until juegoTerminado(tableroRes1);
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

