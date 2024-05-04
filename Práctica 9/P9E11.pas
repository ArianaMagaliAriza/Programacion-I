{Un deportólogo está realizando una investigación sobre el rendimiento de los maratonistas. 
Se seleccionan 50 maratonistas para ser estudiados. De cada uno se conoce el nombre, apellido, género, 
y el tiempo (minutos y segundos) registrado en cada maratón que ha corrido. El deportólogo necesita un programa para:
a) Cargar la información de los 50 maratonistas. Para esto puede seleccionar el criterio que desee para cargar el tiempo de las maratones.
b) Informar para cada maratonista, la maratón con el mejor tiempo de desempeño.
c) Calcular el promedio de tiempo de cada maratonista.}

program P9E11;
uses crt;
const
  fin=1;
  corte=999;
type
  tiempo=record
       min:integer;
       seg:0..59;
       end;
  lista=^nodo;
  nodo=record
          info:tiempo;
          sig:lista;
         end;
  texto=string[40];
  maratonista=record
         nombreYapellido:texto;
         genero:texto; 
         tiempos:lista;         
       end;
  vector=array[1..fin]of maratonista;
procedure agregarAdelante(var v:vector;t:tiempo;i:integer);
var
  nue:lista;
begin
  new(nue);
  nue^.info.min:=t.min;
  nue^.info.seg:=t.seg;
  nue^.sig:=v[i].tiempos;
  v[i].tiempos:=nue;
end;
procedure leerMaratonistas(var v:vector);
var
  i:integer;
  t:tiempo;
begin
  for i:=1 to fin do begin
    with v[i] do begin
      writeln('Ingrese el nombre y apellido:');
      readln(nombreYapellido);
      writeln('Ingrese el genero:');
      readln(genero);
      tiempos:=nil;
      writeln('Ingrese minutos:');
      readln(t.min);
      while(t.min<>corte)do begin
        writeln('Ingrese segundos:');
        readln(t.seg);
        agregarAdelante(v,t,i);
        writeln('Ingrese minutos:');
        readln(t.min);
      end;
    end;
  end;
end;
procedure procesarMaratonistas(v:vector);
var
  min_m,min_s,cant_maraton,suma_min,suma_seg,i:integer;
  prom:tiempo;
begin
  for i:=1 to fin do begin
   min_m:=9999;
   min_s:=9999;
   cant_maraton:=0;
   suma_min:=0;
   suma_seg:=0;
   with v[i]do begin
     while(tiempos<>nil)do begin
       if(tiempos^.info.min<min_m)then begin
         min_m:=tiempos^.info.min;
         min_s:=tiempos^.info.seg;
       end
       else if (tiempos^.info.min=min_m)and(tiempos^.info.seg<min_s)then min_s:=tiempos^.info.seg;
       suma_min:=suma_min+tiempos^.info.min;
       suma_seg:=suma_seg+tiempos^.info.seg;
       cant_maraton:=cant_maraton+1;
       tiempos:=tiempos^.sig;
     end;
   end;
    if(cant_maraton<>0)then begin 
      prom.min:=suma_min div cant_maraton;
      prom.seg:=suma_seg div cant_maraton;
      writeln('El promedio de ',v[i].nombreYapellido,' es ',prom.min,':',prom.seg);
    end;
    writeln('El mejor tiempo de ',v[i].nombreYapellido,' es ',min_m,':',min_s);
  end; 
end;
 
var
  v:vector;
BEGIN
  leerMaratonistas(v);
  procesarMaratonistas(v);
  readkey;
END.
