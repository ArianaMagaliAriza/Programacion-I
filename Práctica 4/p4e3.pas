{Una empresa necesita un programa para procesar información relacionada con 15 de sus
oficinas que dispone para alquilar por hora. Para cada oficina se lee su número, metros
cuadrados, habitaciones, cantidad de horas que alquiladas en el mes y precio por hora. Se
pide:
a) Piense en las entidades involucradas en el problema y defina las estructuras de datos
en consecuencia.
b) Realizar un módulo que procese la información de cada oficina y retorne la que menos
horas fue alquiladas.
c) Realizar un módulo que calcule el monto total recaudado.
d) Realizar un programa que utilizando el módulo implementado en a) y b) informe la
oficina con menor cantidad de horas de alquiler y el monto total recaudado.}

program p4e3;
uses crt;
const
  fin=15;
type
  oficina=record
          num:integer;
          m2:integer;
          habitaciones:integer;
          h_mes:1..999;
          precio_h:integer;
          end;
procedure leeryMenorOficina(var min:integer;var o:oficina;var Menor_of:oficina);
begin
  writeln('Ingrese el numero de oficina:');
  readln(o.num);
  writeln('Ingrese los metros cuadrados de la oficina:');
  readln(o.m2);
  writeln('Ingrese la cantidad de habitaciones:');
  readln(o.habitaciones);
  writeln('Ingrese la cantidad de horas alquiladas en el mes:');
  readln(o.h_mes);
  writeln('Ingrese el precio del alquiler por hora:');
  readln(o.precio_h);
  if (o.h_mes<min) then Menor_of:=o;
end;
procedure montoTotal(o:oficina;var m_total:integer);
var
  monto_of:integer;
begin
  monto_of:=o.h_mes*o.precio_h;
  m_total:=m_total+ monto_of;
end;

var
  o,Menor_of:oficina;
  min,m_total,i:integer;
BEGIN
  min:=999;
  m_total:=0;
  for i:= 1 to fin do begin
    leeryMenorOficina(min,o,Menor_of);
    montoTotal(o,m_total);
  end;
  writeln('La oficina con menor cantidad de horas alquiladas es la oficina es la siguiente:');
  writeln('N° de oficina:',Menor_of.num);
  writeln('Metros cuadrados:',Menor_of.m2);
  writeln('Cantidad de habitaciones:',Menor_of.habitaciones);
  writeln('Cantidad de horas alquiladas en el mes:',Menor_of.h_mes);
  writeln('Precio del alquiler por hora:',Menor_of.precio_h);
  writeln('El monto total recaudado es ',m_total);
  readkey;	
END.

