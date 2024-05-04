{La casa central de una cadena de bicicleterías recibe la información de las ventas de cada
mes correspondientes al año 2015, de cada una de sus 7 sucursales. La información recibida
para cada mes por cada sucursal es: cantidad de bicicletas vendidas, monto total facturado,
cantidad de bicicletas defectuosas, y monto total devuelto por bicicletas defectuosas.
Implementar un programa que procese la información previa para informar:
a) Sucursal con menor ganancia.
b) Para cada sucursal el mes en que más vendió.
c) Recaudación promedio en el mes de marzo de todas las sucursales.}

program p4e6;
uses crt;
const
  sucursal=7;
  meses=12;
type
  mes=record
      cantVendidas:integer;
      montoFacturado:real;
      cantDevueltas:integer;
      montoDevuelto:real;
      end;
Procedure leerMes(var m:mes);
begin
  writeln('Ingrese la cantidad de bicicletas vendidas:');
  readln(m.cantVendidas);
  writeln('Ingrese el monto mensual facturado:');
  readln(m.montoFacturado);
  writeln('Ingrese la cantidad de bicicletas defectuosas:');
  readln(m.cantDevueltas);
  writeln('Ingrese el monto mensual devuelto:');
  readln(m.montoDevuelto);
end;
procedure menorGanancia(s:integer;montoSuc:real;var min:real;var minSuc:integer);
begin
  if(montoSuc<min)then begin
      min:=montoSuc;
      minSuc:=s;
    end;
end;
procedure maxRecaudo(i:integer;montoMes:real;var max:real;var maxMes:integer);
begin
  if(montoMes>max)then begin
    max:=montoMes;
    maxMes:=i;
  end;
end;
procedure Marzo(i:integer;m:mes;var sumaMarzo:real);
begin
  if(i=3)then sumaMarzo:=(sumaMarzo)+(m.montoFacturado)-(m.montoDevuelto);
end;
var
  m:mes;
  s,i,minSuc,maxMes:integer;
  promMarzo,montoMes,min,max,sumaMarzo,montoSuc:real;
BEGIN
  min:=999999;
  sumaMarzo:=0;
  promMarzo:=0;
  for s:=1 to sucursal do begin
    montoSuc:=0;
    max:=-1;
    maxMes:=0;
    for i:=1 to meses do begin
      montoMes:=0;
      leerMes(m);
      montoMes:=(m.montoFacturado)-(m.montoDevuelto);
      maxRecaudo(i,montoMes,max,maxMes);
      Marzo(i,m,sumaMarzo);
      montoSuc:=montoSuc+montoMes;
      end;
      writeln('El mes en que la sucursal n°',s,'vendio mas es el ',maxMes);
      menorGanancia(s,montoSuc,min,minSuc);
    end;
  promMarzo:=sumaMarzo/meses;
  writeln('La sucursal con menor ganancia es la sucursal n°',minSuc);
  writeln('La recaudacion promedio en el mes de Marzo de todas las sucursales es ',promMarzo);	
  readkey;
END.

