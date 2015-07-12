%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           MEMBRI GRUPPO PROGETTO                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
%    NOME/COG:  Matteo Codogno       (730620)                                  %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               TESTO PROGETTO                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
% Il calcolo delle chiglie convesse (convex hulls) è uno degli algoritmi      %
% fondamentali della geometria computazionale. L’algoritmo ha numerosissime    %
% applicazioni e, una volta implementate correttamente alcune primitive        %
% geometriche, è di una semplicità sorprendente.							   %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
% Il progetto Convex Hulls si compone delle seguente sezioni:                  %
%   1. test esistenza predicati                                                %
%   2. funzioni manipolazione lista                                            %
%   3. funzioni manipolazione stack                                            %
%   4. funzioni lettura csv                                                    %
%   5. funzioni primitive geometriche                                          %
%   6. algoritmo Graham’s Scan                                                 %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               TEST PREDICATI                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
% Questa sezione permette di verificare la presenza di un determinato          %
% predicato all'interno della base di dati prolog                              %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            MANIPOLAZIONE LISTA                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
% - rem/2         -> rimuove gli elementi duplicati da una lista               %
% - printlist/1   -> stampa a console gli elementi di una lista andando su una %
%					 nuova riga per ogni elemento                              %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             MANIPOLAZIONE STACK                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
% - pop/3         -> rimuove un elemento dalla testa dello stack               %
% - push/3        -> aggiunge un elemento in testa allo stack                  %
% - peek/2        -> legge l'elemento in cima allo stack senza eliminarlo      %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                 LETTURA CSV                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
% - read_points/2 -> legge il file csv dei punti (con le coordinate separate   %
%					 da una tabulazione), li inserisce in un lista da cui      %
%					 rimuove i doppioni e che salva nella base di dati prolog  %
% - remove_all_points -> rimuove tutti punti presenti nella base dati prolog   %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             PRIMITIVE GEOMETRICHE                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
% - new_point/1       -> aggiunge alla base dati un nuovo punto                %
% - new_point/2       -> aggiunge alla base dati un nuovo punto                %
% - get_coordinate/3  -> estrae le coordinate di un punto                      %
% - get_min_point/2   -> recupera il punto con ordinata minore                 %
% - area2/4           -> datio 4 punti calcola il doppio dell'area di un       %
%						 triangolo                                             %
% - left/3            -> vero quando l'angolo formato dai 3 punti è un angolo  %
%                        a sinistra                                            %
% - left_on/3         -> vero quando l'angolo formato dai 3 punti è un angolo  %
%                        a destra                                              %
% - collinear/3       -> vero quando i 3 punti sono collineari                 %
% - angle2d/3         -> calcola l'angolo in radianti tra i 2 punti            %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           ALGORITMO GRAHAM'S SCAN                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
% Questa sezione contiene l'implementazione dell'algoritmo Graham's Scan       %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
