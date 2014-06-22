%%      Projeto - Processamento de Imagens - CIn/UFPE
%%      S�rgio Renan Vieira - Engenharia da Computa��o
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function l = lbp(block)
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

for x = 2:7
    dx = x - 1; 
    for y = 2:7
        dy = y - 1;
        roi = block(dx:(dx + 2), dy:(dy + 2));
        
        neighbours = [roi(:, 1)',roi(3, 2:3),roi(2:-1:1, 3)',roi(1,2)];
  
        cod = sum(2.^(abs(find((neighbours - block(x, y)) >= 0) - 8)));         
        l(x - 1, y - 1) = cod;
    end;
end;
        
