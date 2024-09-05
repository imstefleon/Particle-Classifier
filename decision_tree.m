% This function is for some already imported data.
% The data corresponds to Pb-Pb collisions.
tabla_norm = tabla_norm;
ExtraColumns = csvread('vertice_plomo.csv');
Particles = Particles;
if size(Particles, 2) <= 15
  Particles = [Particles, ExtraColumns(:,3:5)];
endif

% A function is created to help filter the data.
function [Filter] = filt(Particles)
  % First, we need to know the filter conditions.
  % For this exercise, it's known that the x, y distance relative to the collision
  % must be less than 2 mm, and the Z distance must be less than 10 cm.
  sizeParticles = size(Particles, 1);
  for n = 1:sizeParticles
    ax = Particles(n, 6); % X origin value of the sub-particle
    ay = Particles(n, 7); % Y origin value of the sub-particle
    az = Particles(n, 8); % Z origin value of the sub-particle
    vX = Particles(n, 14); % X coordinate of the Lead (Pb) collision
    vY = Particles(n, 15); % Y coordinate of the Lead (Pb) collision
    vZ = Particles(n, 16); % Z coordinate of the Lead (Pb) collision

    % Subtract vectors.
    d = [ax - vX, ay - vY];    % Calculate the distance between both vectors.
    dz = az - vZ;              % Calculate the distance on the Z axis.

    % Check if the conditions are met.
    if norm(d) <= 0.2 && abs(dz) <= 10
      Filter(n, 1) = 1;
    else
      Filter(n, 1) = 0;
    endif
    
    % The second filter to consider is the TPC column.
    % When it's equal to zero, it means the data is not good.
    if Particles(n, 10) <= 0
      Filter(n, 1) = 0;  % Override the previous value if the condition is met.
    endif

    % The same applies to the ITS column.
    if Particles(n, 9) <= 0
      Filter(n, 1) = 0;  % Override the previous value if the condition is met.
    endif
  endfor
end

% A function is created to extract the filtered data.
function [Filtered] = reduction(DB, Filter)
  % We need to know the size.
  sizeDB = size(DB, 1);
  % Initialize the loop.
  Filtered = [];
  for n = 1:sizeDB
    map = [];
    map = Filter(n, 1) == 1;
    if map == 1
      Filtered = [Filtered; DB(n, :)];
    endif
  endfor
end

% A function is created to separate positive and negative particles.
function [PositivesPb, NegativesPb, NormP_Pb, NormN_Pb] = separate(DB, normData)
  sizeDB = size(DB, 1);
  PositivesPb = []; NegativesPb = []; NormN_Pb = []; NormP_Pb = [];
  for n = 1:sizeDB
    map = [];
    map = DB(n, 12) == 1;
    if map == 1
      PositivesPb = [PositivesPb; DB(n, :)];
      NormP_Pb = [NormP_Pb; normData(n, :)];
    endif
    if map == 0
      NegativesPb = [NegativesPb; DB(n, :)];
      NormN_Pb = [NormN_Pb; normData(n, :)];
    endif
  endfor
end

% Call the functions.
% Create the filter column.
FilterPb = filt(Particles);

% Now filter the data for both the dataset and the normalized table.
FilteredParticlesPb = reduction(Particles, FilterPb);
Filtered_NormTable = reduction(tabla_norm, FilterPb);

% Separate the data into positive and negative particles.
[PosParticlesPb, NegParticlesPb, NormP_Pb, NormN_Pb] = separate(FilteredParticlesPb, Filtered_NormTable);
