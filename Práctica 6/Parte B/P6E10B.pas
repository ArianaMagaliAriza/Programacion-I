{Se desea programar un juego similar a la batalla naval. En dicho juego participan 2 jugadores,
cada uno posee 5 barcos simples (de un casillero) ubicados en un tablero de 10x10. El juego 
consiste en tratar de descubrir en qué posiciones están los barcos del contrincante. 
Los jugadores dan alternadamente una posición del adversario y éste responde agua o hundido. 
Informar el nombre del ganador.}

program P6E10B;
uses crt;
const
  fin=10;
type
  tablero=array[1..fin,1..fin]of boolean;
procedure InicializarTablero(var t:tablero);
var
  f,c:integer;
begin
  for f:=1 to fin do
    for c:=1 to fin do t[f,c]:=false;
end;
procedure PosicionarBarcos(t:tablero);
var
  i,f,c:integer;
begin
  for i:= 1 to 10 do begin  
    writeln('Ingrese una fila:');
    readln(f);
    writeln('Ingrese una columna:');
    readln(c);
    t[f,c]:=true;
  end;
end;
procedure DarPosicion(var t:tablero;var b:integer);
var
  f,c:integer;
begin
  writeln('Ingrese una fila:');
  readln(f);
  writeln('Ingrese una columna:');
  readln(c);
  if(t[f,c]=true)then begin
    t[f,c]:=false;
    b:=b-1;
    writeln('Hundido');
  end
  else writeln('Agua');
end;
var
  t:tablero;
  b1,b2:integer;
BEGIN
  InicializarTablero(t);
  PosicionarBarcos(t);
  b1:=5;
  b2:=5;
  While(b1>0)and(b2>0)do begin
    DarPosicion(t,b1);
    if(b1>0)then DarPosicion(t,b2);
  end;
  if(b1=0)then writeln('El Ganador es el jugardor 2')
  else writeln('El Ganador es el jugardor 1');
  readkey;
END.

