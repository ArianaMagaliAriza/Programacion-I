{Realizar todas las modificaciones necesarias al ejercicio anterior para el caso que la carga de
caracteres termine cuando se lea el carácter ‘.’ o hasta que se almacenaron los 600 caracteres (tener
en cuenta que en el vector se pueden cargar como máximo 600 valores). Declare una constante
que represente el valor de fin de la lectura desde teclado (en este caso el punto).}

program p6e4;
uses crt;
const
 dimF=600;
 fin='.';
type
  carac=set of char;
  vector=array[1..dimF]of char;
procedure cargarVector(var v:vector;var dimL:integer);
var
  i:integer;
begin
  i:=1;
  writeln('Ingrese un caracter:');
  readln(v[i]);
  while(v[i]<>fin)and(dimL<=dimF)do begin
    dimL:=dimL+1;
    i:=i+1;
    writeln('Ingrese un caracter:');
    readln(v[i]);
  end;
end;
procedure consonantes(v:vector;dimL:integer;mayu,minu:carac;var cantCons:integer;var porcentCons:real);
var
  abece,cons,vocales:carac;
  i,cantChar:integer;
begin
  abece:=mayu+minu;
  vocales:=['a','e','i','o','u','A','E','I','O','U'];
  cons:=abece-vocales;
  cantChar:=0;
  cantCons:=0;
  for i:=1 to dimL do begin
    if(v[i]in abece)then cantChar:=cantChar+1;
    if(v[i]in cons)then cantCons:=cantCons+1;
  end;
  porcentCons:=(cantCons*100)/cantChar;
end;
procedure digMayuMinu(v:vector;dimL:integer;mayu,minu:carac;var cantDig,cantMay,cantMin:integer;var porcentDig,porcentMay,porcentMin:real);
var
  dig:carac;
  i:integer;
begin
  dig:=['0'..'9'];
  cantDig:=0;
  cantMay:=0;
  cantMin:=0;
  for i:=1 to dimL do begin
    if(v[i]in dig)then cantDig:=cantDig+1
    else if(v[i]in mayu)then cantMay:=cantMay+1
    else if(v[i]in minu)then cantMin:=cantMin+1;
  end;
  porcentdig:=(cantDig*100)/dimL;
  porcentMay:=(cantMay*100)/dimL;
  porcentMin :=(cantMin*100)/dimL;
end;
var
  v:vector;
  mayu,minu:carac;
  dimL,cantCons,cantDig,cantMay,cantMin:integer;
  porcentCons,porcentDig,porcentMay,porcentMin:real;
BEGIN
  dimL:=0;
  mayu:=['A'..'Z'];
  minu:=['a'..'z'];
  cargarVector(v,dimL);
  consonantes(v,dimL,mayu,minu,cantCons,porcentCons);
  digMayuMinu(v,dimL,mayu,minu,cantDig,cantMay,cantMin,porcentDig,porcentMay,porcentMin);
  writeln('La cantidad de consonantes es ',cantCons,' y el porcentaje es de ',porcentCons,'%');
  writeln('La cantidad de digitos es ',cantDig,' y el porcentaje es de ',porcentDig,'%');
  writeln('La cantidad de mayusculas es ',cantMay,' y el porcentaje es de ',porcentMay,'%');
  writeln('La cantidad de minusculas es ',cantMin,' y el porcentaje es de ',porcentMin,'%');
  readkey;	
END.

