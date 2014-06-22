%%      Projeto - Processamento de Imagens - CIn/UFPE
%%      S�rgio Renan Vieira - Engenharia da Computa��o
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function l = lbp(im, res)
% %================================================================
% %================================================================
% 
% Fun��o que computa o c�digo LBP de um bloco 8x8 de uma imagem.
%  
% Entrada: Bloco 8x8 de uma imagem 
% Sa�da: Matriz com os c�digos LBP de cada pixel (onde � poss�ve) 
% 
% Suposi��es: A fun��o assume que o bloco � 8x8, R=1 e B=8
% 
% %================================================================
% %================================================================

l = zeros(6, 6); 

for x = 2:res(1)-1
      dx = x - 1; 
    
      for y = 2:res(2)-1
            dy = y - 1;
        
            sb = im(dx:(dx + 2), dy:(dy + 2));
        
            %   sb = subbloco 3x3 
            %   e.g.
            %         1   2   3
            %         4   5   6
            %         7   8   9
            
            neighbors = [sb(1,1),sb(2,1),sb(3,1),sb(3,2),sb(3,3),sb(2,3),sb(1,3),sb(1,2)];
            
            % neighbors = vizinhos ordenados em sentido anti-hor�rio
            % e.g.  1   4   7   8   9   6   3   2
            
            %lbpval = 0;
            %for b = 1:8
            %      s = ((neighbors(b) - block(x,y)) >= 0);
            %      lbpval += s * (2^b);
            %end;
            
            %l(x-1, y-1) = lbpval;
            
            l(x-1, y-1) = sum(2.^(abs(find((neighbors - im(x, y)) >= 0) - 8)));         
            % neighbors - block(x, y) = vetor vizinhos - valor Pc
      end;
end;
        
