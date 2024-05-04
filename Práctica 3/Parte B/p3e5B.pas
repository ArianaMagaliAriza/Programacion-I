{a) Implemente un módulo que lea una secuencia de caracteres que representan una palabra
(termina con blanco o asterisco), y retorne la cantidad de consonantes y vocales de dicha palabra.
b) Utilizando el módulo implementado en a) realice un programa que procese una secuencia de
caracteres terminada en ‘*’, e informe la cantidad de consonantes y vocales para cada una de sus
palabras y la posición de las palabras (orden en el que fue ingresada) con mayor cantidad de
consonantes y vocales.}

program p3e5B;
uses crt;
type
  letras=set of char;
const
  fin='*';
  
procedure ConsVoc(c:char;vocales,consonantes:letras;var v,cons:integer);
begin
 while(c<>' ')and(c<>fin)do begin
   if(c in vocales)then v:=v+1;
   if(c in consonantes)then cons:=cons+1;
   readln(c);
 end;
end;

var
  vocales,consonantes:letras;
  c:char;
  v,cons,vmax,consmax,orden,pvmax,pconsmax:integer; 
BEGIN
  vmax:=0;
  consmax:=0;
  consonantes:=['A'..'Z']+['a'..'z'];
  vocales:=['A','E','I','O','U','a','e','i','o','u'];
  consonantes:=consonantes-vocales;
  orden:=0;
  writeln('Ingrese una secuencia de caracteres:');
  readln(c);
  while(c<>fin)do begin
    v:=0;
    cons:=0;
    ConsVoc(c,vocales,consonantes,v,cons);
    orden:=orden+1;
    if(v>vmax)then begin 
      vmax:=v;
      pvmax:=orden;
    end;
    if(cons>consmax)then begin
      consmax:=cons;
      pconsmax:=orden;
    end;
    readln(c);
  end;
  writeln('La posicion de la palabra con mayor cantidad de vocales es ',pvmax);
  writeln('La posicion de la palabra con mayor cantidad de consonantes es ',pconsmax);
  readkey;
END.
