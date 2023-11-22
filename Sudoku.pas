program Sudoku;

uses crt;
var 
	tableroRes, tableroUsuario: array [1..9, 1..9] of integer;
	i, j: integer;
	
procedure llenarTableroResuelto;
begin
	// Tablero Resuelto 1
	tableroRes[1, 1]:= 7;
	tableroRes[1, 2]:= 1;
	tableroRes[1, 3]:= 5;
	tableroRes[1, 4]:= 8;
	tableroRes[1, 5]:= 3;
	tableroRes[1, 6]:= 2;
	tableroRes[1, 7]:= 9;
	tableroRes[1, 8]:= 4;
	tableroRes[1, 9]:= 6;
	tableroRes[2, 1]:= 6;
	tableroRes[2, 2]:= 3;
	tableroRes[2, 3]:= 9;
	tableroRes[2, 4]:= 7;
	tableroRes[2, 5]:= 4;
	tableroRes[2, 6]:= 5;
	tableroRes[2, 7]:= 1;
	tableroRes[2, 8]:= 2;
	tableroRes[2, 9]:= 8;
	tableroRes[3, 1]:= 4;
	tableroRes[3, 2]:= 2;
	tableroRes[3, 3]:= 8;
	tableroRes[3, 4]:= 1;
	tableroRes[3, 5]:= 9;
	tableroRes[3, 6]:= 6;
	tableroRes[3, 7]:= 5;
	tableroRes[3, 8]:= 7;
	tableroRes[3, 9]:= 3;
	tableroRes[4, 1]:= 1;
	tableroRes[4, 2]:= 8;
	tableroRes[4, 3]:= 3;
	tableroRes[4, 4]:= 2;
	tableroRes[4, 5]:= 5;
	tableroRes[4, 6]:= 7;
	tableroRes[4, 7]:= 4;
	tableroRes[4, 8]:= 6;
	tableroRes[4, 9]:= 9;
	tableroRes[5, 1]:= 2;
	tableroRes[5, 2]:= 6;
	tableroRes[5, 3]:= 7;
	tableroRes[5, 4]:= 9;
	tableroRes[5, 5]:= 8;
	tableroRes[5, 6]:= 4;
	tableroRes[5, 7]:= 3;
	tableroRes[5, 8]:= 5;
	tableroRes[5, 9]:= 1;
	tableroRes[6, 1]:= 9;
	tableroRes[6, 2]:= 5;
	tableroRes[6, 3]:= 4;
	tableroRes[6, 4]:= 6;
	tableroRes[6, 5]:= 1;
	tableroRes[6, 6]:= 3;
	tableroRes[6, 7]:= 2;
	tableroRes[6, 8]:= 8;
	tableroRes[6, 9]:= 7;
	tableroRes[7, 1]:= 5;
	tableroRes[7, 2]:= 4;
	tableroRes[7, 3]:= 1;
	tableroRes[7, 4]:= 3;
	tableroRes[7, 5]:= 7;
	tableroRes[7, 6]:= 8;
	tableroRes[7, 7]:= 6;
	tableroRes[7, 8]:= 9;
	tableroRes[7, 9]:= 2;
	tableroRes[8, 1]:= 3;
	tableroRes[8, 2]:= 7;
	tableroRes[8, 3]:= 6;
	tableroRes[8, 4]:= 4;
	tableroRes[8, 5]:= 2;
	tableroRes[8, 6]:= 9;
	tableroRes[8, 7]:= 8;
	tableroRes[8, 8]:= 1;
	tableroRes[8, 9]:= 5;
	tableroRes[9, 1]:= 8;
	tableroRes[9, 2]:= 9;
	tableroRes[9, 3]:= 2;
	tableroRes[9, 4]:= 5;
	tableroRes[9, 5]:= 6;
	tableroRes[9, 6]:= 1;
	tableroRes[9, 7]:= 7;
	tableroRes[9, 8]:= 3;
	tableroRes[9, 9]:= 4;
end;

procedure crearPistas; // Procedimiento que crea las pistas mostradas al usuario
var
	i, j, k: integer;
begin
	for i:= 1 to 9 do  // Bucle anidado que copia los valores del tablero resuleto al tablero del usuario
		for j:= 1 to 9 do
			tableroUsuario[i, j]:= tableroRes[i, j];
			
	for k:= 1 to 64 do  // Bucle que se repite 64 veces
	begin
		repeat
			i:= random(9) + 1; // Selecciona una fila aleatoria 
			j:= random(9) + 1; // Selecciona una columan aleatoria 
		until (tableroUsuario[i, j] <> 0); // Sigue repitiendo este proceso hasta que no queden celdas sin 0
		tableroUsuario[i, j]:= 0; // Reemplaza el valor del tablero por un 0
	end;
end;

BEGIN
	while true do
	begin
		llenarTableroResuelto;
		writeln('Mostrando tablero...');
		writeln();
		writeln('-----------------------');
		for i:= 1 to 9 do
		begin
			write('| ');
			for j:= 1 to 9 do
			begin
				write(tableroRes[i, j], ' ');
				if (j mod 3 = 0) then
					write('|');
			end;
			writeln();
			if (i mod 3 = 0) then
				writeln('-----------------------');
		end;
		exit;
	end;
END.

