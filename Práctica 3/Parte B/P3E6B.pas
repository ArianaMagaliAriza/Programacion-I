{Se lee una secuencia de caracteres terminada en ‘.’. Determinar si la secuencia cumple con el patrón A@B. En caso de no cumplir, informar las partes que no verificaron el patrón.
A@B. donde:
@ es el carácter ‘@’ que seguro existe.
A debe ser una secuencia de letras mayúsculas.
B debe ser una secuencia de caracteres que no aparecieron en A.
* 
Ejemplo: la siguiente secuencia cumple el patrón MTL@aePsz.}

program P3E6B;
uses crt;
type
  letras=set of char;
const
  fin='.';
procedure sA(mayu:letras;var secA:letras;var a:boolean);
var
  c:char;
begin
  writeln('Ingrese una secuencia de caracteres:');
  readln(c);
  while(c<>'@')do begin
    if(not(c in mayu))then a:=false;
    secA:=secA+[c];
    readln(c);
  end;
end;

procedure sB(secA:letras;var b:boolean);
var
  c:char;
begin
  readln(c);
  while(c<>fin)do begin
    if(c in secA)then b:=false;
    readln(c);
  end;
end;

var
  mayu,secA:letras;
  a,b:boolean;
BEGIN
  a:=true;
  b:=true;
  mayu:=['A'..'Z'];
  secA:=[];
  sA(mayu,secA,a);
  if(a) then begin
    sB(secA,b);
    if(b)then writeln('Se cumple la secuencia')
    else writeln('No se cumple B')
  end
  else writeln('No se cumple A');
  readkey;
END.
