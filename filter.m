%Esta función es para unos datos ya importados.
%los datos corresponden a las colisiones de PB con PB
tabla_norm=tabla_norm;
ColumnasExtra=csvread('vertice_plomo.csv');
Particulas=Particulas;
if size(Particulas)(2)<=15
  Particulas=[Particulas,ColumnasExtra(:,3:5)];
endif

%Se crea una función que ayude a filtrar datos.
function [Filtro] = filt(Particulas)
  %Primero necesitamos conocer las condiciones del filtro
  %Para este ejercicio se sabe que la distancia x,y respecto a la colisión debe
  %ser menor a 2 mm y la distancia en Z debe ser menor a 10cm.
  tama = size(Particulas)(1);
  for n=1:tama
    ax=Particulas(n,6); %Valor de origen de la subparticula en X
    ay=Particulas(n,7); %Valor de origen de la subparticula en Y
    az=Particulas(n,8); %Valor de origen de la subparticula en Z
    vX=Particulas(n,14);%Coordenada en X de la colisión del Plomo.
    vY=Particulas(n,15);%Coordenada en Y de la colisión del Plomo.
    vZ=Particulas(n,16);%Coordenada en Z de la colisión del Plomo.

    %Se hace una resta de vectores.
    d=[ax-vX,ay-vY];    %Calcula la distancia entre ambos vectores.
    dz=az-vZ;           %Calcula la distancia en el eje Z.

    %Verifica que se cumpla las condiciones.
    if norm(d)<=0.2 && abs(dz)<=10
      Filtro(n,1)=1;
    else
      Filtro(n,1)=0;
    endif
    %El segundo filtro a tener en cuenta es la columna TPC,
    %Cuando es igual a cero, significa que los datos no son buenos.
    if Particulas(n,10)<=0
      Filtro(n,1)=0;    %Reemplaza el valor anterior si se cumple la condicion.
    endif
    %Lo mismo ocurre para la columna ITS
    if Particulas(n,9)<=0
      Filtro(n,1)=0;    %Reemplaza el valor anterior si se cumple la condicion.
    endif
  endfor
end
%Se crea una función que permita sacar los datos filtrados.
function [Filtrado] = reduccion(BD,Filtro)
  %Se necesita conocer el tamaño.
  tam=size(BD)(1);
  %Se inicializa el ciclo.
  Filtrado=[];
  for n=1:tam
    map=[];
    map= Filtro(n,1)==1;
    if map == 1
      Filtrado=[Filtrado;BD(n,:)];
    endif
  endfor
end
%Se crea una función para separar las partículas positivas de las negativas.
function [PositivosPb,NegativosPb,NormP_Pb,NormN_Pb] = separar(BD,normal)
  tama=size(BD)(1);
  PositivosPb=[]; NegativosPb=[]; NormN_Pb=[]; NormP_Pb=[];
  for n=1:tama
    map=[];
    map= BD(n,12)==1;
    if map == 1
      PositivosPb = [PositivosPb;BD(n,:)];
      NormP_Pb    = [NormP_Pb;normal(n,:)];
    endif
    if map == 0
      NegativosPb = [NegativosPb;BD(n,:)];
      NormN_Pb    = [NormN_Pb;normal(n,:)];
    endif
  endfor
end
%Llamar las funciones.
%Se crea la columna del filtro
FiltroPb          = filt(Particulas);

%Ahora se filtran los datos para el dataset y para la tabla normalizada.
ParticulasPbFilt  = reduccion(Particulas,FiltroPb);
Tabla_Norm_PnFilt = reduccion(tabla_norm,FiltroPb);

%Se separan los datos en positivos y negaticos.
[PartiPb_pos,PartiPb_neg,NormP_Pb,NormN_Pb]=separar(ParticulasPbFilt,Tabla_Norm_PnFilt);
