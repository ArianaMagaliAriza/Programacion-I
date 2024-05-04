{Dada una lista de lugares turísticos identificados por nombre y país, definir una estructura de datos
para almacenarlos y escribir un programa que implemente los siguientes módulos:
a) Calcular la longitud de la lista.
b) Calcular la cantidad de veces que aparece un país dado (un país puede aparecer más de una
vez, ya que puede haber diferentes lugares turísticos).
c) Dado un país, si existe, generar una nueva lista con los nombres de sus lugares turísticos.
d) Agregar al final de la lista creada en c) un nuevo lugar turístico.   }

program p9e3;
uses crt;
const
  fin='0';
type
  texto=string[25];
  lista=^nodo;
  nodo=record
       nombre:texto;
       pais:texto;
       sig:lista;
       end;
procedure cargarLista(var l:lista);
var
  nue:lista;
  n:texto;
begin
  writeln('Ingrese el nombre de un lugar turistico:');
  readln(n);
  while(n<>fin)do begin
    new(nue);
    nue^.nombre:=n;
    writeln('Ingrese el pais del lugar turistico:');
    readln(nue^.pais);
    nue^.sig:=l;
    l:=nue;
    writeln('Ingrese el nombre de un lugar turistico:');
    readln(n);
  end;
end;
function LargoLista(l:lista):integer;
var largo:Integer;
begin
  largo:=0;
  while(l<>nil)do begin
    largo:=largo+1;
    l:=l^.sig;
  end;
  LargoLista:=largo;
end;
procedure cantPais(l:lista);
var 
  x:texto;
  cant:integer;
begin
  cant:=0;
  writeln('Ingrese un pais:');
  readln(x);
  while(l<>nil)do begin
    if(l^.pais=x)then cant:=cant+1;
    l:=l^.sig;
  end;
  writeln(x,' aparece ',cant,' veces en la lista');
end;
procedure listaPais(l:lista;var pri,ult:lista);
var
  nue:lista;
  n:texto;
begin
  writeln('Ingrese un pais:');
  readln(n);
  while(l<>nil)do begin 
    if (l^.pais=n) then begin
      new(nue);
      nue^.nombre:=l^.nombre;
      nue^.pais:=l^.pais;
      nue^.sig:=nil;
      if(pri<>nil)then ult^.sig:=nue
               else pri:=nue;
      ult:=nue;
    end;
    l:=l^.sig;
  end;
end;
procedure AgregarAlFinalPais(var pri,ult:lista);
var 
  nue:lista;
  x,n:texto;
begin
  n:=pri^.pais;
  writeln('Ingrese el nombre de un lugar turistico de ',n,':');
  readln(x);
  new(nue);
  nue^.nombre:=x;
  nue^.pais:=n;
  nue^.sig:=nil;
  if(pri<>nil)then ult^.sig:=nue
              else pri:=nue;
  ult:=nue;
end;
procedure Imprimir(pri:lista);
var n:texto;
begin
  n:=pri^.pais;
  writeln('La lista de los lugares turisticos de ',n,' son:');
  while(pri<>nil)do begin 
    writeln(pri^.nombre);
    pri:=pri^.sig;
  end;
end;
procedure liberarMemoria(var l,pri,ult:lista);
var act:lista;
begin
  while(l<>nil)do begin
    act:=l;
    l:=l^.sig;
    dispose(act);
  end;
end;
var
  l,pri,ult:lista;
BEGIN
  l:=nil;
  pri:=nil;
  ult:=nil;
  cargarLista(l);
  writeln('La lista tiene un largo de ',LargoLista(l),' nodos');
  cantPais(l);
  listaPais(l,pri,ult);
  AgregarAlFinalPais(pri,ult);
  Imprimir(pri);
  liberarMemoria(l,pri,ult);
  readkey;
END.

