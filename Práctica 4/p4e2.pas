{a) Defina un tipo de dato que represente el tiempo en horas y minutos.
b) Implemente un módulo que reciba 2 parámetros de tipo tiempo y devuelva la diferencia
transcurrida en horas y minutos.
c) * Realice 2 implementaciones diferentes de un módulo que reciba 2 parámetros de tipo
tiempo y retorne el menor de los 2.}

program p4e2;
uses crt;
type
tiempo=record
        hora:0..23;
        min:-59..59;
      end;
procedure diferencia(t,t2:tiempo;var d:tiempo);
begin
  d.hora:=t.hora-t2.hora;
  d.min:=t.min-t2.min;
  if(d.min<0)then begin
     d.hora:=d.hora-1;
     d.min:=d.min+60;
  end;
end;
procedure menor(t,t2:tiempo;var min:tiempo);
begin
  if(t.hora<t2.hora)then begin
    min.hora:=t.hora;
    min.min:=t.min;
  end
  else if(t2.hora<t.hora)then begin
    min.hora:=t2.hora;
    min.min:=t2.min;
  end
  else if(t.hora=t2.hora)then begin
    if (t.min<t2.min)then begin
      min.hora:=t.hora;
      min.min:=t.min;
    end
    else begin 
      min.hora:=t2.hora;
      min.min:=t2.min;
    end;
    end;
end;
var
  t,t2,d,min:tiempo;
BEGIN
  writeln('Ingrese la hora del primer tiempo:');
  read(t.hora);
  writeln('Ingrese los minutos del primer tiempo:');
  read(t.min);
  writeln('Ingrese la hora del segundo tiempo:');
  read(t2.hora);
  writeln('Ingrese los minutos del segundo tiempo:');
  read(t2.min);
  diferencia(t,t2,d);
  menor(t,t2,min);
  writeln('La diferencia entre el primer y segundo tiempo es de ',d.hora,' horas y ',d.min,' minutos');
  writeln('El menor tiempo es ',min.hora,':',min.min);
  readkey;
END.
