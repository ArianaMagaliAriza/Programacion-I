{Se dispone de un módulo que carga un vector con a lo sumo 2000 nombres de personas, ordenadas
de forma ascendente. Realice un programa que implemente módulos que reciban dicho vector y
permitan:
a) Buscar y devolver la posición en la que se encuentra una persona cuyo nombre se recibe como
parámetro.
Tener en cuenta que dicha persona puede no existir.
b) Insertar un nombre recibido en el vector conservando su orden. Recuerde validar el espacio.
c) Eliminar un nombre recibido del vector en caso de existir. Considere que no hay nombres
repetidos.
d) Modifique c) considerando ahora que puede haber repetidos.}

program p6e10;
uses crt;
const
  dimF=2000;
type
  nombre=string[25];
  rango=1..dimF;
  persona=array[rango]of nombre;
procedure cargarVector(var p:persona;var dimL:integer);
var
  i:integer;
begin
  writeln('Ingrese la dimension logica:');
  readln(dimL);
  writeln('Ingrese nombres ordenados(',dimL,' nombres):');
  for i:= 1 to dimL do readln(p[i]);
end;
procedure buscarNombre(p:persona;n:nombre;dimL:integer);
var
  i:integer;
begin
  i:=1;
  while(i<=dimL)and(p[i]<n)do i:=i+1;
  if(p[i]=n)then writeln('La persona ingresada esta en la posicion ',i)
  else writeln('La persona ingresada no existe');
end;
procedure insertarNombre(var p:persona;n:nombre;var dimL:integer);
var
  i,pos:integer;
begin
  if(dimL<dimF)then begin
    i:=1;
    while(i<=dimL)and(p[i]<n)do i:=i+1;
    pos:=i;
    for i:=dimL downto pos do p[i+1]:=p[i];
    p[pos]:=n;
    dimL:=dimL+1;
  end
  else writeln('No se pudo insertar el nombre ingresado');
end;
procedure eliminarNombre(var p:persona;n:nombre;var dimL:integer);
var
  i,j,pos:integer;
begin
  i:=1;
  while(i<dimL)and(p[i]<n)do i:=i+1;
  if(p[i]=n)then begin
    pos:=i;
    while(p[i]=n)do begin
      for j:=pos to (dimL-1) do p[j]:=p[j+1];
      dimL:=dimL-1;
    end;
  end
  else if(p[i]>n)then writeln('El nombre ingresado no existe');
end;
var
  n:nombre;
  p:persona;
  dimL,i:integer;
BEGIN
  cargarVector(p,dimL);
  writeln('Ingrese un nombre a buscar:');
  readln(n);
  buscarNombre(p,n,dimL);
  writeln('Ingrese un nombre a insertar:');
  readln(n);
  insertarNombre(p,n,dimL);
  writeln('Ingrese un nombre a eliminar:');
  readln(n);
  eliminarNombre(p,n,dimL);
  for i:= 1 to dimL do write(p[i],' ');
  readkey;	
END.

