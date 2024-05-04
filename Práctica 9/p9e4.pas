{Dada una lista de aviones (marca, modelo y cantidad de asientos), definir la estructura que permita
almacenarlos y escribir un programa que implemente:
a) Un módulo que reciba una lista de aviones y un avión y lo agregue a la lista. Se sabe que la lista
está ordenada por marca en forma descendente y se pide agregar el avión a la lista de forma que
se mantenga el orden.
b) Un módulo que reciba una lista de aviones y un avión, y elimine el elemento de la lista que
coincida totalmente con el avión recibido. Además, debe retornar si la eliminación se realizó o no.}

program p9e4;
uses crt;
type
  texto=string[25];
  avion=record
        marca:texto;
        modelo:texto;
        asientos:texto;
        end;
  lista=^nodo;
  nodo=record
        datos:avion;
        sig:lista;
        end;  
        
procedure AgregarAlFinal(var l:lista;n:texto);
var
  nue:lista;
begin
  new(nue);
  nue^.datos.marca:=n;
  writeln('Ingrese el modelo del avion:');
  readln(nue^.datos.modelo);
  writeln('Ingrese la cantidad de asientos del avion:');
  readln(nue^.datos.asientos);
  nue^.sig:=nil;
end; 
   
procedure cargarLista(var l:lista);
var
  n:texto;
begin
  l:=nil;
  writeln('Ingrese la marca del avion:');
  readln(n);
  while(n<>'0')do begin
    AgregarAlFinal(l,n);
    writeln('Ingrese la marca del avion:');
    readln(n);
  end;
end;

procedure leerAvion(var a:avion);
begin
  writeln('Ingrese la marca del avion:');
  readln(a.marca);
  writeln('Ingrese el modelo del avion:');
  readln(a.modelo);
  writeln('Ingrese la cantidad de asientos del avion:');
  readln(a.asientos);
end;

procedure agregarAvionOrdenado(var l:lista;a:avion);
var
  nue,ant,act:lista;
begin
    new(nue);
    nue^.datos.marca:=a.marca;
    nue^.datos.modelo:=a.modelo;
    nue^.datos.asientos:=a.asientos;
    act:=l;
    ant:=l;
    while(act<>nil)and(act^.datos.marca>a.marca)do begin
      ant:=act;
      act:=act^.sig;
    end;
    if(ant=act)then l:=nue
               else act^.sig:=nue;
    nue^.sig:=act;
end;

procedure eliminarAvion(var l:lista;a:avion);
var
  ant,act:lista;
  exito:boolean;
begin
  exito:=false;
  act:=l;
  while(act<>nil)and(l^.datos.marca<>a.marca)do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(act<>nil)then begin
    if(l=act)then l:=act^.sig
    else ant^.sig:=act^.sig;
    dispose(act);
    exito:=true;
  end;
  if(exito=true)then writeln('El elemento se elimino con exito')
                else writeln('No se puedo eliminar el elemento');
end;

procedure Imprimir(l:lista);
begin
  while(l<>nil)do begin
  writeln('Marca:',l^.datos.marca);
  writeln('Modelo:',l^.datos.modelo);
  writeln('Asientos:',l^.datos.asientos);
  writeln(' ');
  l:=l^.sig;
  end;
end;
procedure liberarMemoria(var l:lista);
var act:lista;
begin
  while(l<>nil)do begin
    act:=l;
    l:=l^.sig;
    dispose(act);
  end;
end;

var
  l:lista;
  a:avion;
BEGIN
  l:=nil;
  cargarLista(l);
  Imprimir(l);
  leerAvion(a);
  agregarAvionOrdenado(l,a);
  Imprimir(l);
  leerAvion(a);
  eliminarAvion(l,a);
  Imprimir(l);
  liberarMemoria(l);
  readkey;
END.

