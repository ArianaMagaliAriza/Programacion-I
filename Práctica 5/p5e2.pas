{Se desea procesar información acerca de los sueldos de los empleados de una empresa. De
cada empleado se conoce dni y sueldo, código de departamento y número de sucursal en la que
trabaja. La información se ingresa por teclado, ordenada por sucursal y luego por departamento. El
procesamiento termina al ingresar -1 como sucursal. Se pide:
a) Informar el departamento y sucursal de los dos departamentos con mayor monto de sueldos.
b) Para cada sucursal, informar sucursal y monto total de sueldos.}

program p5e2;
uses crt;
const
  fin=-1;
type
  empleado=record
           dni:integer;
           sueldo:real;
           dpto:integer;
           sucursal:integer;
           end;
procedure MaxDpto(e:empleado;var montoD:real;var max:real;var max2:real;var maxD:integer;var maxD2:integer;var maxS:integer;var maxS2:integer);
begin
  with e do begin
  montoD:=montoD+sueldo;
  if(montoD>max)then begin
    max2:=max;
    maxD2:=maxD;
    maxS2:=maxS;
    max:=montoD;
    maxD:=dpto;
    maxS:=sucursal;
  end
  else if(montoD>max2)then begin
    max2:=max;
    maxD2:=maxD;
    maxS2:=maxS; 
  end;
  end;
end;
procedure montoSucursal(e:empleado;montoD:real;montoSuc:real);
begin
 montoSuc:=montoSuc+montoD;
end;
var
  e:empleado;
  montoD,max,max2,montoSuc:real;
  maxD,maxD2,maxS,maxS2,SucActual,DptoActual:integer;
BEGIN
  with e do begin
    readln(sucursal);
    while(sucursal<>fin)do begin
      montoSuc:=0;
      sucActual:=sucursal;
      while(sucursal=sucActual)do begin
        readln(dpto);
        montoD:=0;
        DptoActual:=dpto;
        while(dpto=DptoActual)do begin
          readln(dni);
          readln(sueldo);
          MaxDpto(e,montoD,max,max2,maxD,maxD2,maxS,maxS2);
          readln(dpto);
        end;
        writeln('Los mayores montos de sueldos son del dpto ',maxD,' de la sucursal',maxS,' y del dpto ',maxD2,' de la sucursal ',maxS2);
        montoSucursal(e,montoD,montoSuc);
        readln(sucursal);
      end;
      writeln('El monto total de la sucursal n° ',sucActual,' es de ',montoSuc);
    end;
  end;
  readkey;
END.
         
