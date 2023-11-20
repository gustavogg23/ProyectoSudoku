program Sudoku;

uses crt;
var 
	tablero: array [1..9, 1..9] of integer;
	i, j: integer;
	
procedure llenarTablero;
var
	i, j: integer;
begin
	for i:= 1 to 9 do
		for j:= 1 to 9 do
			tablero[i, j]:= random(9) + 1;
end;

BEGIN
	randomize;
	llenarTablero;
	writeln('Mostrando tablero...');
	writeln();
	for i:= 1 to 9 do
	begin
		for j:= 1 to 9 do
			write(tablero[i, j], ' ');
		writeln();
	end;
END.

