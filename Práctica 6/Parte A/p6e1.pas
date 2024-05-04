{Realizar un programa que implemente y use:
a) un módulo que cargue un vector con 50 números enteros y lo retorne.
b) un módulo que reciba el vector generado en a) y retorne el promedio de sus valores y el
porcentaje de números negativos y positivos.
c) un módulo que reciba el vector generado en a) y dos valores enteros que representan un rango de
valores y que retorne la cantidad de elementos del vector que estén dentro de ese rango.
d) un módulo que reciba el vector generado en a) y retorne los dos valores máximos entre sus
elementos junto con la posición donde se encuentran.}

program p6e1;
uses crt;
const
  fin=50;
type
  vector=array[1..fin]of integer;
procedure cargarVector(var v:vector);
var
  i:integer;
begin
  for i:=1 to fin do readln(v[i]);
end;
procedure promedio(v:vector;var prom,porcentajeN,porcentajeP:real);
var
  i,suma,cantN,cantP:integer;
begin
  suma:=0;
  cantN:=0;
  cantP:=0;
  for i:=1 to fin do begin
    suma:=suma+v[i];
    if(v[i]<0)then cantN:=cantN+1
    else if (v[i]>0)then cantP:=cantP+1;
  end;
  prom:=suma/fin;
  porcentajeN:=(cantN*100)/fin;
  porcentajeP:=(cantP*100)/fin;
end;
procedure cantRango(v:vector;a,b:integer;var cantR:integer);
var
  i:integer;
begin
  cantR:=0;
  for i:=1 to fin do
  if (v[i]>=a)and(v[i]<=b)then cantR:=cantR+1;
end;
procedure maxPos(v:vector;var max,max2,pos,pos2:integer);
var
  i:integer;
begin
  max:=-1;
  max2:=-1;
  for i:=1 to fin do begin
  if(v[i]>max)then begin
    max2:=max;
    pos2:=pos;
    max:=v[i];
    pos:=i;
  end
  else if(v[i]>max2)then begin
    max2:=v[i];
    pos2:=i;
  end;
  end;
end;
var
  v:vector;
  a,b,cantR,max,max2,pos,pos2:integer;
  prom,porcentajeN,porcentajeP:real;
BEGIN
  cargarVector(v);
  promedio(v,prom,porcentajeN,porcentajeP);
  writeln('Ingrese el valor para a:');
  readln(a);
  writeln('Ingrese el valor para b:');
  readln(b);
  cantRango(v,a,b,cantR);
  maxPos(v,max,max2,pos,pos2);
  writeln('El promedio es ',prom);
  writeln('El porcentaje de numeros negativos',porcentajeN);
  writeln('El porcentaje de numeros positivos',porcentajeP);
  writeln('La cantidad de numeros entre',a,' y ',b,' es ',cantR);
  writeln('Los dos valores maximos son ',max,' en la posicion ',pos,' y ',max2,' en la posicion ',pos2);
  readkey;	
END.

