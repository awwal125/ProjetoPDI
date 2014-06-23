%%      Projeto - Processamento de Imagens - CIn/UFPE
%%      S�rgio Renan Vieira - Engenharia da Computa��o
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function W = compute_gradient(im, block)
% %================================================================
% %================================================================
% 
% Fun��o que computa a magnitude do gradiente de um pixel de um bloco 8x8
% de uma imagem.
%  
% Entrada: Imagem e bloco (x,y,dim)
% Sa�da: BLoco com magnitude do gradiente de cada pixel (onde � poss�vel). 
% 
% A fun��o realiza o c�lculo atrav�s das m�scaras derivativas 1-D centra-
% das no ponto.
% 
% %================================================================
% %================================================================

h1 = [-1 0 1];
h2 = [1 0 -1]';
W = zeros(8, 8);

for x = block(1)+2:block(3)
      dx = x - 1; 
      for y = block(2)+2:block(3)
            dy = y - 1;
                  
            ROIx = im(x, dy:(dy + 2));
            ROIy = im(dx:(dx + 2), y);

            Ix= sum(h1.*ROIx);
            Iy= sum(h2.*ROIy);

            W(dx, dy) = sqrt(Ix^2 + Iy^2);
      end;
end;







