{Dada una matriz de números enteros de 50 x 50, realizar un programa para:
a) Imprimir los elementos de las filas pares de la matriz.
b) Imprimir los elementos de las columnas impares de la matriz.
c) Imprimir los elementos de la diagonal principal. }

program p6e5B;
uses crt;
const
  fin=3;
type
  rango=1..50;
  matriz=array[rango,rango]of integer;
procedure cargarMatriz(var m:matriz);
var
  i,j:integer;
begin
  for i:=1 to fin do  begin
    for j:=1 to fin do begin
     writeln('Ingrese un numero para la casilla [',i,',',j,']:');
     readln(m[i,j]);
   end;
  end;
end;
procedure ImprimirFilaPar(m:matriz);
var
  i,j,test:integer;
begin
  for i:=1 to fin do begin
    test:=i mod 2;
    if(test=0)then begin
      writeln('Los elementos de la fila ',i,' son:'); 
      for j:=1 to fin do write(m[i,j],',');
      writeln(' ');
    end;
  end;
end;
procedure ImprimirColumnaImpar(m:matriz);
var
  i,j,test:integer;
begin
  for j:=1 to fin do begin
    test:=j mod 2;
    if(test<>0)then begin
      writeln('Los elementos de la columna ',j,' son:');
      for i:=1 to fin do write(m[i,j],',');
      writeln(' ');
    end;
  end;
end;
procedure ImprimirDiagonalPrincipal(m:matriz);
var
  i,j:integer;
begin
  j:=1;
  writeln('Los elementos de la diagonal principal son:');
  for i:=1 to fin do begin
    write(m[i,j],',');
    j:=j+1;
  end;
end;
var
  m:matriz;
BEGIN
  cargarMatriz(m);
  ImprimirFilaPar(m);
  ImprimirColumnaImpar(m);
  ImprimirDiagonalPrincipal(m);
  readkey;
END.


