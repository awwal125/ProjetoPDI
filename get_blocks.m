%=================================================
%
%
%                   PROJETO PDI
%         aluno: Leonardo Mendes Primo Brito
%
%
%
%=================================================
%           Segmentar imagem em blocos
%      
%      Obter lista de blocos 8x8 da imagem.
%
%      Os blocos são deslocados com overlap de 50% em
%      ambas as direções, i.e. as posições dos blocos
%      (considerando o canto superior esquerdo) serão:
%
%      linha 1: (0,0), (4,0), (8,0), ... 
%      linha 2: (0,4), (4,4), (8,4), ...
%
%=================================================
function b = get_blocks(im)
      
      blockdim = 8;

      imres_x = size(im)(2); % res horizontal
      imres_y = size(im)(1); % res vertical

      x_step = y_step = blockdim/2; % 50% overlap

      nblocks_x = (imres_x/x_step)-1;
      nblocks_y = (imres_y/y_step)-1;
      nblocks = nblocks_x*nblocks_y;
      
      b = cell([1,nblocks]); % lista de blocos    
      
      idx = 1;
      for y = 0:nblocks_y-1
            for x = 0:nblocks_x-1
                  bl_x = max(x*x_step,1);
                  bl_y = max(y*y_step,1);
                  b{idx++} = im(bl_y:(bl_y+blockdim-1),bl_x:(bl_x+blockdim-1));
            end;
      end;
      
      %temporário - padding dos blocos
      for idx=idx:numel(b) 
            b{idx} = zeros([8,8]);
      end;
      
endfunction;