{Realizar un programa que lea de teclado un vector de 600 caracteres. Finalizada la carga informar:
a) La cantidad y porcentaje de consonantes sobre el total de caracteres alfabéticos.
b) La cantidad y porcentaje de caracteres que son dígitos, letras mayúsculas, letras minúsculas
sobre el total de caracteres ingresados.}

program p6e3;
uses crt;
const
 fin=600;
type
  carac=set of char;
  vector=array[1..fin]of char;
procedure cargarVector(var v:vector);
var
 i:integer;
begin
  for i:=1 to fin do readln(v[i]);
end;
procedure consonantes(v:vector;mayu,minu:carac;var cantCons:integer;var porcentCons:real);
var
  abece,cons,vocales:carac;
  i,cantChar:integer;
begin
  abece:=mayu+minu;
  vocales:=['a','e','i','o','u','A','E','I','O','U'];
  cons:=abece-vocales;
  cantChar:=0;
  cantCons:=0;
  for i:=1 to fin do begin
    if(v[i]in abece)then cantChar:=cantChar+1;
    if(v[i]in cons)then cantCons:=cantCons+1;
  end;
  porcentCons:=(cantCons*100)/cantChar;
end;
procedure digMayuMinu(v:vector;mayu,minu:carac;var cantDig,cantMay,cantMin:integer;var porcentDig,porcentMay,porcentMin:real);
var
  dig:carac;
  i:integer;
begin
  dig:=['0'..'9'];
  cantDig:=0;
  cantMay:=0;
  cantMin:=0;
  for i:=1 to fin do begin
    if(v[i]in dig)then cantDig:=cantDig+1
    else if(v[i]in mayu)then cantMay:=cantMay+1
    else if(v[i]in minu)then cantMin:=cantMin+1;
  end;
  porcentdig:=(cantDig*100)/fin;
  porcentMay:=(cantMay*100)/fin;
  porcentMin :=(cantMin*100)/fin;
end;
var
  v:vector;
  mayu,minu:carac;
  cantCons,cantDig,cantMay,cantMin:integer;
  porcentCons,porcentDig,porcentMay,porcentMin:real;
BEGIN
  mayu:=['A'..'Z'];
  minu:=['a'..'z'];
  cargarVector(v);
  consonantes(v,mayu,minu,cantCons,porcentCons);
  digMayuMinu(v,mayu,minu,cantDig,cantMay,cantMin,porcentDig,porcentMay,porcentMin);
  writeln('La cantidad de consonantes es ',cantCons,' y el porcentaje es de ',porcentCons,'%');
  writeln('La cantidad de digitos es ',cantDig,' y el porcentaje es de ',porcentDig,'%');
  writeln('La cantidad de mayusculas es ',cantMay,' y el porcentaje es de ',porcentMay,'%');
  writeln('La cantidad de minusculas es ',cantMin,' y el porcentaje es de ',porcentMin,'%');
  readkey;	
END.

  
