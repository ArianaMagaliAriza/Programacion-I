{Construir un programa que lee desde teclado una secuencia de números reales hasta que se
introduzca el 50. Informar los 7 números mayores de la secuencia.
Nota: Implemente la solución sin almacenar TODOS los números leídos.}

program p6e11;
uses crt;
const
  fin=50;
  cantMax=7;
type
  max=array[1..cantMax]of integer;
procedure inicializarVector(var m:max);
var
  i:integer;
begin
  for i:=1 to cantMax do m[i]:=0;
end;
procedure analizarMax(var m:max;n:integer);
var
  i,j:integer;
begin
  for i:=1 to cantMax do begin
    if(i=1)and(n>m[i])then begin
      for j:=i to(cantMax-1)do m[i+1]:=m[i];
      m[i]:=n;
    end
    else if(1<i)and(i<cantMax)and(n>m[i])and(n<m[i-1])then begin
      for j:= i to(cantMax-1)do m[i+1]:=m[i];
      m[i]:=n;
    end
    else if(i=cantMax)and(n>m[i])and(n<m[i-1])then m[i]:=n;
  end;
end;
var
  m:max;
  i,n:integer;
BEGIN
  inicializarVector(m);
  writeln('Ingrese un numero:');
  read(n);
  while(n<>fin)do begin
    analizarMax(m,n);
    write('Los siete numeros mayores son:');
    for i:=1 to cantMax do write(m[i],' ');
    writeln('Ingrese un numero:');
    read(n);
  end;
  writeln('Los siete numeros mayores son:');
  for i:=1 to cantMax do write(m[i],' ');
  readkey;
END.

