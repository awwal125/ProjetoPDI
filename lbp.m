%=================================================
%     Local Binary Pattern (LBP)
%     
%     Setup: 
%      circulo     R=1 
%      8 pixels    B=8
%      limiar LTP  T=9
%
%     Entrada:
%      block: bloco 8x8
%      type: "lbp", "rlbp", "llbp" ou "ulbp"     
%      bin: 59 bins dos padr�es bin�rios uniformes
%
%     Sa�da:
%      {lbpval, lbphist} (fixo em 59 bins
%      para imagens de 8bits (0-255))   
%     
%
%=================================================
function lbp_hist = lbp(block, type, bin)

lbp_hist = {zeros(8), zeros([1,59])}; 
T = 9;      % limiar do LTP

for x = 2:7
    dx = x - 1; 
    for y = 2:7
        dy = y - 1;
        
            %   sb = subbloco 3x3 
            %   e.g.
            %         7   8   9
            %         1   2   3
            %         4   5   6
            sb = block(dx:(dx + 2), dy:(dy + 2));
            
            % neighbors = vizinhos ordenados em sentido anti-hor�rio
            % e.g.  1   4   7   8   9   6   3   2
            neighbors = [sb(1,1),sb(2,1),sb(3,1),sb(3,2),sb(3,3),sb(2,3),sb(1,3),sb(1,2)];
            
            % Diferen�a Pb-Pc
            %
            % No caso LBP, temos T = 0.
            % Nos casos LLBP e ULBP:
            %
            %     *--------------*--------------*
            %    -T              0              T
            %  
            % ULBP: s(z) = 1 se z >= T, sen�o 0.
            % LLBP: s(z) = 1 se -z >= T, sen�o 0
            switch (type)
                  case "lbp" 
                        deltaP = (neighbors - block(x, y)) >= 0;
                  case "rlbp" 
                        deltaP = (neighbors - block(x, y)) >= 0;
                  case "ulbp"
                        deltaP = (neighbors - block(x, y)) >= T;
                  case "llbp"
                        deltaP = -(neighbors - block(x, y)) >= T;
            endswitch;
                  

            % find = �ndices dos elementos n�o-nulos do vetor
            % e.g. x = 4 0 5 0 0 --> find(x) = 1 3
            % abs (x-8) = complemento
            s = abs(find(deltaP) - 8);
            
            lbp_val = sum(2.^s);         
            
            switch (type)
                  case "rlbp"
                        lbp_val = min(lbp_val,255-lbp_val);
            endswitch;
            
            % valor final LBP
            lbp_hist{1}(x-1, y-1) = lbp_val;
            
            % atualizar histograma
            if (bin(lbp_val+1)!=0) 
                  lbp_hist{2}(bin(lbp_val+1)) += 1;
            endif;
      end;
end;