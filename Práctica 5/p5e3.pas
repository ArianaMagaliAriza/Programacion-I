{Se requiere procesar la información de algunos países del mundo. Suponga que se cuenta con el
nombre del país, el nombre de la provincia (o estado), ciudad, dinero recaudado y cantidad de
habitantes por ciudad. Realizar un programa que lea dicha información, la procese e informe el
ingreso por habitante de cada ciudad, de cada provincia y de cada país. Asuma que la información
está ordenada por país, luego por provincia y ciudad.
Nota: los datos se ingresan por teclado y el programa finaliza al ingresar ‘zzz’ como país (que no
debe procesarse). Modularice la carga de los datos.}

program p5e3;
uses crt;
const
  fin='zzz';
type
  texto=string[25];
  pais=record
       nombre:texto;
       provincia:texto;
       ciudad:texto;
       Habitantes:integer;
       recaudo:real;
       end;
procedure cantidadProvincia(p:pais;var cantProv:integer);
begin
  with p do begin
  cantProv:=cantProv+Habitantes;
  end;
end;
procedure cantidadPais(cantProv:integer;var cantPais:integer);
begin
  cantPais:=cantPais+cantProv;
end;
var
  p:pais;
  paisActual,provActual:texto;
  cantProv,cantPais:integer;
BEGIN 
  with p do begin
    writeln('Ingrese el pais:');
    readln(nombre);
    while(nombre<>fin)do begin
      paisActual:=nombre;
      cantPais:=0;
      while(nombre=paisActual)do begin
        writeln('Ingrese la provincia:');
        readln(provincia);
        provActual:=provincia;
        cantProv:=0;
        while(provincia=provActual)do begin
          writeln('Ingrese la ciudad:');
          readln(ciudad);
          writeln('Ingrese la ciudad:');
          readln(Habitantes);
          writeln('La cantidad de habitantes de la ciudad ',ciudad,' es de ',Habitantes,' habitantes');
          cantidadProvincia(p,cantProv);
          writeln('Ingrese la ciudad:');
          readln(ciudad);
        end;
        writeln('La cantidad de habitantes de la provincia ',provActual,' es de ',cantProv,' habitantes');
        cantidadPais(cantProv,cantPais);
      end;
      writeln('La cantidad de habitantes del pais ',paisActual,' es de ',cantPais,' habitantes');
    end;
  end; 
  readkey;	
END.


  
