{Implementar 2 versiones de un módulo que cuente la cantidad de palabras que hay en un arreglo
de caracteres con un máximo de 150 caracteres:
a) Implementar una versión del módulo que tenga en cuenta una dimensión lógica para indicar la
posición del último carácter.
b) Implementar una versión del módulo que asuma que el último carácter es punto.
Nota: en ambos casos, por seguridad, realice las verificaciones para no pasarse de la longitud
máxima.}

program p6e8;
uses crt;
const
 fin='.';
 dimF=16;
type
  vector=array[1..dimF]of char;
procedure cargarVector(var v:vector);
var
  i:integer;
begin
  writeln('Ingrese una secuencia: ');
  for i:=1 to dimF do read(v[i]);
  writeln(' ');
end;
procedure moduloDimL(v:vector;var modDimL:integer);
var
  i,cantP,dimL:integer;
begin
  i:=1;
  cantP:=0;
  writeln('Ingrese la dimension logica del vector');
  readln(dimL);
  while(dimL<dimF)and(i<dimL)do begin
    while(v[i]=' ')do i:=i+1;
      cantP:=cantP+1;
      i:=i+1;
    while(v[i]<>' ')do i:=i+1;
  end;
  modDimL:=cantP;
end;
function moduloPunto(v:vector):integer;//anda mal :( //
var
  i,cantP:integer;
begin
  i:=1;
  cantP:=0;
  while(i<dimF)and(v[i]<>fin)do begin
    while(v[i]=' ')do i:=i+1;
    cantP:=cantP+1;
    i:=i+1;
    while(v[i]<>' ')do i:=i+1;
  end;
  moduloPunto:=cantP;
end;
var
  v:vector;
  modDimL:integer;
BEGIN
  cargarVector(v);
  moduloDimL(v,modDimL);
  writeln('La secuencia tiene ',modDimL,' palabras');
  writeln('La secuencia tiene ',moduloPunto(v),' palabras');
  readkey;	
END.

