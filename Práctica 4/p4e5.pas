{En un hospital se quiere realizar una estadística sobre los pacientes que han entrado por
guardia el último año. De cada atención se registra paciente atendido, médico que lo atendió
fecha de atención (día, mes y año), hora de llegada (hora y minutos) y hora salida (hora y
minutos). Esta información se lee por teclado y finaliza al ingresar 0 como año de atención.
Se pide:
a) Pensar la representación agrupando la información en estructuras que reflejen
fielmente los datos del problema.
b) Modularice la carga de forma que maximice la reutilización de esta.
c) Calcular e informar el nombre del paciente que más tardó en ser atendido.
d) Informar la cantidad de pacientes que asistieron en agosto.}

program p4e5;
uses crt;
const
  fin=0;
type
  nombre=string[25];
  hora=record
       h:0..23;
       min:-59..59;
       end;
  fecha=record
        anio:integer;
        mes:1..12;
        dia:1..31;
        end;
  atencion=record
          f:fecha;
          paciente:nombre;
          medico:nombre;
          llegada:hora;
          salida:hora;
          end;
          
procedure leerAtencion(var a:atencion);
begin
  with a do begin
    writeln('Ingrese el anio de la atencion:');
    readln(f.anio);
    if(f.anio<>fin)then begin
      writeln('Ingrese el mes de la atencion:');
      readln(f.mes);
      writeln('Ingrese el dia de la atencion:');
      readln(f.dia);
      writeln('Ingrese el nombre del paciente:');
      readln(paciente);
      writeln('Ingrese el nombre del medico:');
      readln(medico);
      writeln('Ingrese la hora de llegada del paciente:');
      readln(llegada.h);
      writeln('Ingrese el minuto de llegada del paciente:');
      readln(llegada.min);
      writeln('Ingrese la hora de salida del paciente:');
      readln(salida.h);
      writeln('Ingrese el minuto de salida del paciente:');
      readln(salida.min);
    end;
  end;
end;

procedure pacienteTarde(a:atencion;var max:hora;var tardeP:nombre);
var
  d:hora;
begin
  d.h:=(a.salida.h)-(a.llegada.h);
  d.min:=(a.salida.min)-(a.llegada.min);
  if(d.min<0)then begin
    d.h:=d.h-1;
    d.min:=d.min+60;
    end;
  if(d.h>max.h)then begin
    max:=d;
    tardeP:=a.paciente;
    end
  else if(d.h=max.h)and(d.min>max.min)then begin
    max:=d;
    tardeP:=a.paciente;
    end;
end;

procedure CantPacientesAgosto(a:atencion;var cantP:integer);
begin
if(a.f.mes=8)then cantP:=cantP+1;
end;

var
  cantP:integer;
  a:atencion;
  max:hora;
  tardeP:nombre;
BEGIN
  cantP:=0;
  leerAtencion(a);
  while(a.f.anio<>fin)do begin
    pacienteTarde(a,max,tardeP);
    CantPacientesAgosto(a,cantP);
    leerAtencion(a);
  end;
  writeln('El paciente que mas tardo en ser atendido es ',tardeP);
  writeln('La cantidad de pacientes antendidos en Agosto es de ',cantP,' pacientes');
  readkey;
END.
 

