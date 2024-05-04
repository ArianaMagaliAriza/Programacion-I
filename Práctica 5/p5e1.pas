{El municipio requiere procesar la información correspondiente a la recaudación impositiva de los
colectivos de transporte público:
a) Se cuenta con información del número de línea, patente del vehículo y monto recaudado. Se
debe informar el monto recaudado por dicha línea. Asuma que la información se ingresa por
teclado ordenada por número de línea y finaliza cuando se ingresa el número cero.
b) Ahora se cuenta con información del nombre de empresa, número de línea, patente del
vehículo y monto recaudado. Se debe informar el monto recaudado por número de línea y el
monto recaudado por empresa. Asuma que la información se ingresa ordenada primero por
número de empresa y luego por número de línea. El programa finaliza cuando se ingresa
“FIN” como nombre de empresa.}

program p5e1;
uses crt;
const
  emp='FIN';
  line=0;
type
  texto=string[25];
  empresa=record
          nombre:texto;
          linea:integer;
          patente:texto;
          monto:real;
          end;
procedure montoLinea(e:empresa;var montoL:real);
begin
  montoL:=montoL+e.monto;
end;
procedure montoEmpresa(e:empresa;montoL:real;var montoE:real);
begin
  montoE:=montoE+montoL;
end;
var
  e:empresa;
  empresaActual:texto;
  lineaActual:integer;
  montoE,montoL:real;
BEGIN
  with e do begin
    writeln('Ingrese el nombre de la empresa:');
    readln(nombre);
    while(nombre<>emp)do begin
      empresaActual:=nombre;
      while(nombre=empresaActual)do begin;
       writeln('Ingrese el n° de linea:');
       readln(linea);
       while(linea<>line)do begin
        lineaActual:=linea;
        while (linea=lineaActual) do begin
        writeln('Ingrese la patente del vehiculo:');
        readln(patente);
        writeln('Ingrese el monto recaudado:');
        readln(monto);
        montoLinea(e,montoL);
        writeln('Ingrese el n° de linea:');
        readln(linea);
        end;
        writeln('El monto recaudado de la linea n° ',lineaActual,' de la empresa ',empresaActual,' es ',montoL);
       end;
       montoEmpresa(e,montoL,montoE);
       writeln('Ingrese el nombre de la empresa:');
       readln(nombre); 
      end;
      writeln('El monto total recaudado de la empresa ',empresaActual,' es ',montoE);
    end;
    end;
  readkey;	
END.


