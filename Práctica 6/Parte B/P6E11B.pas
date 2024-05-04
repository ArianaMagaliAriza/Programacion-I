{Construir un programa que implemente y use:
a) un módulo que reciba una matriz y un valor N, y que retorne dicha matriz en la que se ha eliminado la N-ésima fila.
b) un módulo que reciba una matriz A, un vector B y un valor N, y que inserte el vector B como columna N-ésima de la matriz A.
Nota: realizar las validaciones correspondientes.}


program P6E11B;
uses crt;
const
  DimF=10;
type
  matriz=array[1..DimF,1..DimF]of integer;
  vector=array[1..DimF]of integer;
procedure cargarMatriz(var m:matriz;var DimL_filas,DimL_colum:integer);
var
  f,c:integer;
begin
  writeln('Ingrese una cantidad de filas:');
  readln(DimL_filas);
  writeln('Ingrese una cantidad de columnas');
  readln(DimL_colum);
  if(DimL_filas<=DimF)and(DimL_colum<=DimF)then
  for f:=1 to DimL_filas do begin 
    for c:=1 to DimL_colum do begin
      writeln('Ingrese un nro:');
      readln(m[f,c]); 
    end;
  end;
end;

procedure leerVector(var v:vector;DimL_filas:integer);
var 
  i:integer;
begin
  for i:= 1 to DimL_filas do begin
    writeln('Ingrese un numero:');
    readln(v[i]);
  end;
end;
procedure eliminarFila(var m:matriz;x,DimL_colum:integer;var DimL_filas:integer);
var
 f,c:integer;
begin
  if(x>0)and(x<DimL_filas)then begin
    for f:=x to DimL_filas-1 do for c:=1 to DimL_colum do m[x,c]:=m[x+1,c];
    DimL_filas:=DimL_filas-1;
  end
  else if(x=DimL_filas)then DimL_filas:=DimL_filas-1
  else writeln('no se pudo eliminar la fila');
end;
procedure insertarColumna(var m:matriz;v:vector;x,DimL_filas:integer;var DimL_colum:integer);
var
  c,f:integer;
begin
  if(x<=DimL_colum)and(x>0)then begin
    DimL_colum:=DimL_colum+1;
    for c:=DimL_colum downto x do for f:=1 to DimL_filas do m[f,c]:=m[f,c-1];
    for f:=1 to DimL_filas do m[f,x]:=v[f];
  end
  else if(x=DimL_colum+1)then begin
    DimL_colum:=DimL_colum+1;
    for f:=01 to DimL_filas do m[f,x]:=v[f];
  end
  else writeln('no se pudo insertar la columna');
end;
var
  m:matriz;
  v:vector;
  DimL_colum,DimL_filas,x,fi,co:integer;
BEGIN
  cargarMatriz(m,DimL_filas,DimL_colum);
  for fi:=1 to DimL_filas do begin 
    for co:=1 to DimL_colum do write(m[fi,co],' ');
    writeln(' ');
  end;
  writeln('Ingrese el nro de una fila a eliminar:');
  readln(x);
  eliminarFila(m,x,DimL_colum,DimL_filas);
  for fi:=1 to DimL_filas do begin 
    for co:=1 to DimL_colum do write(m[fi,co],' ');
    writeln(' ');
  end;
  leerVector(v,DimL_filas);
  writeln('Ingrese un nro de columna a insertar:');
  readln(x);
  insertarColumna(m,v,x,DimL_filas,DimL_colum);
  for fi:=1 to DimL_filas do begin 
    for co:=1 to DimL_colum do write(m[fi,co],' ');
    writeln(' ');
  end;
  readkey;	
END.
