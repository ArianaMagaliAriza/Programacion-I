{Se dispone de un vector con a lo sumo 150 nombres de flores. Realizar un programa que lea desde el
teclado un nombre de una flor e informe:
a) la posición del vector que coincida con este nombre.
b) Idem a) pero asumiendo que los nombres están ordenados.
Nota: Tener en cuenta que dicho nombre puede no existir.}

program p6e5;
uses crt;
const
  dimF=150;
type
  flor=string[25];
  vector=array[1..dimF]of flor;
procedure cargarVector(var v:vector;var dimL:integer);
var
  i:integer;
begin
  dimL:=0;
  i:=1;
  readln(v[i]);
  while(v[i]<>'.')and(dimL<=dimF)do begin
     dimL:=dimL+1;
     i:=i+1;
     readln(v[i]);
  end;
end;
procedure BuscarPosNombreSinOrden(v:vector;dimL:integer);
var
  nombre:flor;
  exito:boolean;
  pos:integer;
begin
  writeln('Ingrese un nombre de flor:');
  readln(nombre);
  pos:=1;
  exito:=false;
  while(pos<=dimF)and(exito)do begin
    if(v[pos]=nombre)then begin
      exito:=true;
      writeln('La flor ',nombre,' esta en la posicion ',pos,' del vector');
    end
    else pos:=pos+1;
  end;
  if(exito=false)then writeln('El nombre de flor ingresado no existe');
end;
procedure BuscarPosNombreConOrden(v:vector;dimL:integer);
var
  nombre:flor;
  pos:integer;
begin
  writeln('Ingrese un nombre de flor:');
  readln(nombre);
  pos:=1;
  while(pos<=dimF)and(v[pos]<nombre)do pos:=pos+1;
  if(pos>dimF)or(v[pos]>nombre)then writeln('El nombre de flor ingresado no existe')
  else if(v[pos]=nombre)then writeln('La flor ',nombre,' esta en la posicion ',pos,' del vector');
end;
var
  v:vector;
  dimL:integer;
BEGIN
  cargarVector(v,dimL);
  BuscarPosNombreSinOrden(v,dimL);
  BuscarPosNombreConOrden(v,dimL);
  readkey;
END.

  
