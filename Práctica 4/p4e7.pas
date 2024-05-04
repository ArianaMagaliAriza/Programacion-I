{La ciudad de Bariloche es centro de un Congreso Internacional de Gastronomía, al cual
asisten 7 representantes de cada uno de los 20 países intervinientes. De cada uno de ellos
se conoce su nombre y apellido, país al que representa, plato a presentar, sexo y edad. A la
vez de cada plato se conoce el nombre, si es frío o caliente y su ingrediente principal.
Definir la estructura de datos más adecuada para almacenar la información descripta.
Realizar un programa que procese la información y:
a) Calcule el país con mayor cantidad de participantes femeninos que presentan platos
fríos.
b) Calcule la edad promedio de los participantes.
c) Informe el nombre y apellido y el país de los participantes que presentan plato caliente
con pollo como ingrediente principal.}

program p4e7;
uses crt;
const
  pais=20;
  repre=7;
type
  palabra=string[25];
  plato=record
        nombre:palabra;
        temperatura:palabra;
        ingrediente:palabra;
        end;
  representante=record
                NombreyApellido:palabra;
                pais:palabra;
                p:plato;
                sexo:palabra;
                edad:integer;
                end;
procedure leer(var r:representante);
begin
  writeln('Ingrese el nombre y apellido del representante:');
  readln(r.NombreyApellido);
  writeln('Ingrese el pais que representa:');
  readln(r.pais);
  writeln('Ingrese el nombre del plato que presenta:');
  readln(r.p.nombre);
  writeln('Ingrese la temperatura del plato:');
  readln(r.p.temperatura);
  writeln('Ingrese el ingrediente principal:');
  readln(r.p.ingrediente);
  writeln('Ingrese el sexo del representante:');
  readln(r.sexo);
  writeln('Ingrese la edad del representante:');
  readln(r.edad);
end;
procedure FemePlatoFrio(r:representante;var cantFPF:integer;var max:integer;var maxPais:palabra);
begin
  if(r.sexo='femenino')and(r.p.temperatura='frio')then cantFPF:=cantFPF+1;
  if(cantFPF>max)then begin
      max:=cantFPF;
      maxPais:=r.pais;
    end;
end;
procedure sumaE(r:representante;var sumaEdad:integer);
begin
  sumaEdad:=sumaEdad+r.edad;
end;
procedure PlatoCalientePollo(r:representante); 
begin
  if(r.p.temperatura='caliente')and(r.p.ingrediente='pollo')then
  writeln(r.NombreyApellido,' de ',r.pais,' presenta plato caliente con pollo como ingrediente principal');
end;
var
  r:representante;
  maxPais:palabra;
  p,i,cantFPF,max,sumaEdad:integer;
  promEdad:real;
BEGIN
  sumaEdad:=0;
  for p:=1 to pais do begin
    cantFPF:=0;
    for i:=1 to repre do begin
    leer(r);
    FemePlatoFrio(r,cantFPF,max,maxPais);
    sumaE(r,sumaEdad);
    PlatoCalientePollo(r);
    end;
  end;
  promEdad:=sumaEdad/(pais*repre);
  writeln('El pais con mayor cantidad de participantes femeninos que presentan platos frios es ',maxPais);
  writeln('La edad promedio de los representantes es de ',promEdad,' anios');
  readkey;	
END.

                
