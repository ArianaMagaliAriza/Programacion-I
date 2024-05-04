{Se lee una secuencia de caracteres terminada en ‘*’. Informar si la secuencia cumple con el patrón: V&Q%W. En caso de no ser así terminar
de procesar e informar en qué subsecuencia se dejó de cumplir el patrón. Se sabe que:
& es el carácter ‘&’ y % es el carácter ‘%’ que seguro existen.
V es una secuencia de palabras, donde todas las palabras comienzan con la letra ‘o’ y terminan con una la letra ‘n’.
Q es una secuencia de palabras, donde todas las palabras tienen todas las vocales.
W es una secuencia de palabras donde todas las palabras de longitud mayor que 5, tienen tres ‘s’.
 
Ejemplo. La siguiente secuencia cumple con el patrón:
ocasion operacion ocupacion& euforia cautiverio ecuacion% sucesorias suspensorio casa*}

program P3E7B;//50 min-70 min//
uses crt;
type
  letras=set of char;
const
  fin='*';
procedure secV(var cumple:boolean);
var
  ant,c:char;
begin
  cumple:=true;
  writeln('Ingrese una secuencia:');
  readln(c);
  while(c<>'&')and(cumple)do begin
    while(c=' ')do readln(c);
    if(c='o')then cumple:=true
    else cumple:=false;
    while(c<>'&')and(c<>' ')do begin
      ant:=c;
      readln(c);
    end;
    if(ant='n')and(cumple)then cumple:=true
      else cumple:=false;
  end;
end;

procedure secQ(var cumple2:boolean);
var
  vocales,vocal_p:letras;
  c:char;
begin
  cumple2:=true;
  vocales:=['a','e','i','o','u'];
  readln(c);
  while(c<>'%')and(cumple2)do begin
    vocal_p:=[];
    while(c=' ')do readln(c);
    while(c<>'%')and(c<>' ')do begin
      if(c in vocales)then vocal_p:=vocal_p+[c];
      readln(c);
    end;
    if(vocal_p=vocales)then cumple2:=true
    else cumple2:=false;
  end;
end;

procedure secW(var cumple3:boolean);
var
  c:char;
  cantS,cantD:integer;
begin
  cumple3:=true;
  readln(c);
  while(c<>fin)and(cumple3)do begin
    cantS:=0;
    cantD:=0;
    while(c=' ')do readln(c);
    if(c='s')then cantS:=cantS+1;
    while(c<>fin)and(c<>' ')do begin
      cantD:=cantD+1;
      readln(c);
    end;
    if(cantD>5)and(cantS<>3)then cumple3:=false
    else cumple3:=true;
  end;
end;

var
  c,c2,c3:boolean;
BEGIN
  secV(c);
  if(c)then begin
    secQ(c2);
    if(c2)then begin
      secW(c3);
      if(c3)then writeln('Se cumple la secuencia')
      else writeln('No se cumple la secuencia W');
    end
	else writeln('No se cumple la secuencia Q');
  end
  else writeln('No se cumple la secuencia V');
  readkey;
END.

