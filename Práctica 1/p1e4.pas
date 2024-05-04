{Realizar un programa que lea información sobre la cantidad de nieve caída en milímetros de unas
10 localidades de la provincia de Neuquén. Informar las 2 localidades con menor cantidad de nieve
caída y las 2 con mayor cantidad nieve caída. Además, se desea saber el promedio de nieve caída
y el porcentaje de localidades cuyo valor superó los 100 milímetros.}

program p1e4;
const
  local=10;
  nieve=100;
var
  cantN,max,max2,min,min2,i,lmax,lmax2,lmin,lmin2:integer;
  promedio,porcentaje:real;
BEGIN
  porcentaje:=0;
  promedio:=0;
  max:=-1;
  max2:=-1;
  min:=9999;
  min2:=9999;
  for i:= 1 to local do
  begin
    writeln('ingrese la cantidad de nieve caida:');
    readln(cantN);
    if(cantN>max)then 
    begin
      max2:=max;
      lmax2:=lmax;
      max:=cantN;
      lmax:=i;
    end
    else if(cantN>max2)then
    begin
      max2:=cantN;
      lmax2:=i;
    end
    else if(cantN<min)then
    begin
      min2:=min;
      lmin2:=lmin;
      min:=cantN;
      lmin:=i;
    end
    else if(cantN<min2)then
    begin
      min2:=cantN;
      lmin2:=i;
    end;
    promedio:=promedio+cantN;
    if(cantN>nieve)then porcentaje:=porcentaje+1;
  end;
  promedio:=promedio/local;
  porcentaje:=(porcentaje*100)/local;
  writeln('Las localidades con mayor cantidad de nieve caida son: ',lmax,' y ',lmax2);
  writeln('Las localidades con menor cantidad de nieve caida son: ',lmin,' y ',lmin2);
  writeln('El promedio de nieva caida es de ',promedio,' ml');
  writeln('El porcentaje de localidades cuya nieve caida supero los 100 ml es de ',porcentaje,' %');
END.
