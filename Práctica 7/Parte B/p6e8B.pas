{Realice un programa que lea la información de los empleados administrativos de la Facultad,
sabiendo que a lo sumo existen 800 empleados. De cada empleado se conoce: DNI, Apellido,
Nombre, fecha de nacimiento (día, mes, año) y el número de oficina (existen 20 oficinas que se
numeran de 1 a 20) en donde se desempeña sus tareas dentro de la facultad. La lectura de la
información finaliza cuando llega el empleado con DNI 0 el cual no se procesa. Luego de leer la
información de los empleados, se pide:
a) Informar el Apellido y Nombre de los empleados que trabajan en la oficina número 1.
b) Calcular e informar el total de empleados por oficina.
c) Informar los empleados que cumplen años en un mes que se ingresa desde teclado.}

program p6e8B;
uses crt;
const
  DimF_E=800;
  DimF_O=20;
  fin=0;
type
  texto=string[45];
  fecha=record
        dia:1..31;
        mes:1..12;
        anio:integer;
        end;
  empleado=record
           dni:integer;
           NombreyApellido:texto;
           nacimiento:fecha;
           oficina:1..DimF_O;
           end;
   empleados=array[1..DimF_E]of empleado;
   oficinas=array[1..DimF_O]of integer;
procedure LeerEmpleados(var e:empleados;DimL:integer);
var
  i:integer;
begin
  i:=1;
  with e[i] do begin
    writeln('Ingrese un DNI:');
    readln(dni);
    while(dni<>fin)do begin
      writeln('Ingrese el Nombre y Apellido');
      readln(NombreyApellido);
      with nacimiento do begin
        writeln('Ingrese el dia de nacimiento:');
        readln(dia);
        writeln('Ingrese el mes de nacimiento:');
        readln(mes);
        writeln('Ingrese el anio de nacimiento:');
        readln(anio);
      end;
      writeln('Ingrese el nro de oficina:');
      readln(oficina);
      i:=i+1;
      writeln('Ingrese un DNI:');
      readln(dni);
    end;
  end;
end;
procedure InformarEmpleado(e:empleados;i:integer);
begin
  writeln('El siguiente empleado es de la Oficina 1:');
  with e[i] do begin
    writeln(dni);
    writeln(NombreyApellido);
    with nacimiento do begin
      writeln(dia);
      writeln(mes);
      writeln(anio);
    end;
    writeln(oficina);
  end;
end;
var
  e:empleados;
  o:oficinas;
  DimL,i,mes_x:integer;
BEGIN
  for i:=1 to DimF_O do o[i]:=0; 
  LeerEmpleados(e,DimL);
  writeln('Ingrese un mes:');
  readln(mes_x);
  for i:=1 to DimL do begin
    o[e[i].oficina]:=o[e[i].oficina]+1;
    if(e[i].nacimiento.mes=mes_x)then InformarEmpleado(e,i);
  end;
  for i:=1 to DimF_O do writeln('La oficina nro ',i,' tiene ',o[i],' empleados');
  readkey;
END.

