{Realice dos módulos que reciban dos listas ordenadas de enteros A y B y devuelvan:
a) En el primer módulo: otra lista C ordenada que sea la resultante de unir las dos listas recibidas.
b) En el segundo módulo: la lista A donde se inserten los elementos de la lista B, y la lista A continúa
ordenada.
Realice además un tercer módulo que reciba la lista A, y un número entero, y se eliminen todas las
ocurrencias de ese número de la lista.}

program p9e12;
uses crt;
const
  fin=999;
type
  lista=^nodo;
  nodo=record
       n:integer;
       sig:lista;
       end;
       
procedure agregarAtras(var l:lista;n:integer);
var
  nue,act:lista;
begin
  new(nue);
  nue^.n:=n;
  nue^.sig:=nil;
  if(l<>nil)then begin
    act:=l;
    while(act^.sig<>nil)do act:=act^.sig ;
    act^.sig:=nue;
  end
  else l:=nue;
end;
procedure cargarLista(var l:lista);
var
  n:integer;
begin
  l:=nil;
  writeln('Ingrese un nro:');
  readln(n);
  while(n<>fin)do begin
    agregarAtras(l,n);
    writeln('Ingrese un nro:');
    readln(n);
  end;
end;
{procedure minimo(var A,B:lista;var min:integer);
begin
  if(A=nil)and(B=nil)then min:=fin
  else if(A<>nil)and(B<>nil)then begin
    if(A^.n<=B^.n)then begin
      min:=A^.n;
      A:=A^.sig;
    end
    else begin
      min:=B^.n;
      B:=B^.sig;
    end;
  end
  else begin 
    if(A<>nil)and(B=nil)then begin
      min:=A^.n;
      A:=A^.sig;
    end
    else if(A=nil)and(B<>nil)then begin
      min:=B^.n;
      B:=B^.sig;
    end
  end;
end;
procedure merge(A,B:lista;var C:lista);
var
  min:integer;
begin
  C:=nil;
  minimo(A,B,min);
  while(min<>fin)do begin
    agregarAtras(C,min);
    minimo(A,B,min);
  end;
end;}
procedure agregarListaOrdenada(var A,B:lista);
var
  act,ant,nue:lista;
  encontre:boolean;
begin
  encontre:=false;
  new(nue);
  nue^.n:=B^.n;
  act:=A;
  ant:=A;
  while(act<>nil)and(not encontre)do begin
    if(nue^.n<=act^.n)then encontre:=true
    else begin
      ant:=act;
      act:=act^.sig;
    end;
  end;
  if(ant=act)then A:=nue
             else ant^.sig:=nue;
  nue^.sig:=act;
end;
procedure incertarB_en_A(var A:lista;B:lista);
begin
  while(B<>nil)do begin
    agregarListaOrdenada(A,B);
    B:=B^.sig;
  end;
end;
{procedure eliminarNro(var l:lista);
var
  ant,act:lista;
  num:integer;
  ok,encontre:boolean;
begin
  writeln('Ingrese un nro a eliminar:');
  readln(num);
  ant:=l;
  act:=l;
  ok:=false;
  encontre:=false;
  while(act<>nil)do begin
    while(act<>nil)and(not ok)do begin
      if(act^.n=num)then ok:=true
      else begin
        ant:=act;
        act:=act^.sig;
      end;
    end;
    if(ok)then begin
      if(not encontre)then encontre:=true;
      if(act=l)then l:=act^.sig
      else ant^.sig:=act^.sig;
      dispose(act);
      act:=ant^.sig;
      ok:=false;
    end;
  end;
  if(not encontre)then writeln('el nro ingresado no esta en la lista');
end;}
procedure imprimirLista(l:lista);
begin
  while(l<>nil)do begin
    write(l^.n,' ');
    l:=l^.sig;
  end;
  writeln(' ');
end;

var
 A,B:lista;
BEGIN
  cargarLista(A);
  cargarLista(B);
  {merge(A,B,C);}
  writeln('Lista A:');
  imprimirLista(A);
  writeln('Lista B:');
  imprimirLista(B);
  incertarB_en_A(A,B);
  writeln('Lista A:');
  imprimirLista(A);
  writeln('Lista B:');
  imprimirLista(B);
  {writeln('Lista C');
  imprimirLista(C);
  eliminarNro(l);
  imprimirLista(l);}
  readkey;
END.
