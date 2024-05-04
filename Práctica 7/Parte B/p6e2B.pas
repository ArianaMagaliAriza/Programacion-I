{Realizar un módulo que reciba un vector A y dos valores I, J. El módulo debe devolver el vector A
del cual se suprimen las componentes que se encuentran entre las posiciones I y J (inclusive las
componentes de dichas posiciones).}

program p6e2B;
uses crt;
const
  dimF=14;
type
  vector=array[1..dimF]of char;
procedure cargarVector(var v:vector;var dimL:integer);
var
  i:integer;
begin
  writeln('Ingrese la dimension logica:');
  readln(dimL);
  writeln('Ingrse los valores del vector (',dimL,' caracteres):');
  for i:= 1 to dimL do readln(v[i]);
end;
procedure cargarDosValores(var A,B:char);
begin
  writeln('Ingrese un caracter:');
  readln(A);
  writeln('Ingrese un caracter:');
  readln(B);
end;
procedure suprimirComponentes(var v:vector;var dimL:integer;A,B:char);
var
  i,j,pos,pos2,dif:integer;
begin
  i:=1;
  while(v[i]<A)do i:=i+1;
  pos:=i;
  while(v[i]<B)do i:=i+1;
  pos2:=i;
  dif:=pos2-(pos-1);
  for j:= pos2+1 to dimL do begin
    v[pos]:=v[j];
    pos:=pos+1;
  end;
  dimL:=dimL-dif; 
end;
procedure ImprimirVector(v:vector;dimL:integer);
var
  i:integer;
begin
  writeln('El vector quedo asi:');
  for i:= 1 to dimL do write(v[i],' ');
end;
var
  v:vector;
  dimL:integer;
  A,B:char;
BEGIN
  cargarVector(v,dimL);
  cargarDosValores(A,B);
  suprimirComponentes(v,dimL,A,B);
  ImprimirVector(v,dimL);
  readkey;
END.
