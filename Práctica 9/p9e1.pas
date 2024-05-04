{Escribir un programa que lea una secuencia de números enteros terminada en 999 y los almacene
en una lista simple. Utilizando la lista creada implementar:
a) un módulo que reciba la lista y devuelva como resultado la cantidad de números con 3 dígitos.
b) un módulo que reciba la lista y un número y determine si dicho número está o no en la lista. La
búsqueda debe terminar al encontrar la primera ocurrencia del número buscado.
c) Un módulo que reciba la lista y libere la memoria reservada.}

program p9e1;
uses crt;
const
  fin=999;
type
  lista=^nodo;
  nodo=record
       num:integer;
       sig:lista;
       end;
procedure agregarAdelante(var l:lista;n: integer);
var
  nue:lista;
begin
  new(nue);
  nue^.num:= n;
  nue^.sig := l;
  l:= nue;
end;  
procedure cargarLista(var l:lista);
var
  n:integer;
begin
  writeln('Ingrese un numero:');
  readln(n);
  while(n<>fin)do begin
    agregarAdelante(l,n);
    writeln('Ingrese un numero:');
    readln(n);
  end;
end;
function cant3Dig(l:lista):integer;
var
  cant:integer;
begin
  cant:=0;
  while(l<>nil)do begin
    if(l^.num>99)and(l^.num<1000)then cant:=cant+1;
    l:=l^.sig;
  end;
  cant3Dig:=cant;
end;
procedure buscarNumero(l:lista);
var
  n:integer;
begin
  writeln('Ingrese un numero a buscar:');
  readln(n);
  while(l^.num<>n)and(l<>nil)do l:=l^.sig;
  if(l^.num=n)then writeln('El numero ',n,' esta en la lista')
  else writeln('El numero ',n,' no esta en la lista');
end;
procedure liberarMemoria(var l:lista);
var
  act:lista;
begin
  while(l<>nil)do begin
    act:=l;
    l:=l^.sig;
    dispose(act);
  end;
end;
var
  l:lista;
BEGIN
  l:=nil;
  cargarLista(l);
  writeln('Hay un total de ',cant3Dig(l),' numeros de tres digitos');
  buscarNumero(l);
  liberarMemoria(l);
  readkey;
END.

