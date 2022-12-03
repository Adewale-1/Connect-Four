function win = checkwin(board)

  win = 0;
% Checks for 4 maches per row(HORIZONTAL CHECKS)
  for i = 1:1:6
       for k = 1:1:4
           if board(i,k) == 3 && board(i,k+1) == 3 && board(i,k+2) == 3 && board(i,k+3) == 3
%                player1 = 1;
               win = 1;
               break
           elseif board(i,k) == 2 && board(i,k+1) == 2 && board(i,k+2) == 2 && board(i,k+3) == 2
%                player2 = 1;
               win = 2;
               break
           end
       end
   end

% Checks for 4 matches per column(VERTICAL CHECKS)
   for k = 1:1:7
       for i = 1:1:3
           if board(i,k) == 3 && board(i+1,k) == 3 && board(i+2,k) == 3 && board (i+3,k) == 3
%                player1 = 1;
               win = 1;
               break
           elseif board(i,k) == 2 && board(i+1,k) == 2 && board(i+2,k) == 2 && board (i+3,k) == 2
%                player2 = 1;
               win = 2;
               break
           end
       end
   end


% Check for diagonals at bottom left(\)
  for k = 1:1:4
      if board(6,k) == 3 && board(5,k+1) == 3 && board(4,k+2) == 3 && board(3,k+3) == 3
%                player1 = 1;
               win = 1;
               break
      elseif board(6,k) == 2 && board(5,k+1) == 2 && board(4,k+2) == 2 && board(3,k+3) == 2
%                player2 = 1;
               win = 2;
               break
      elseif board(1,k) == 3 && board(2,k+1) == 3 && board(3,k+2) == 3 && board(4,k+3) == 3
%                player1 = 1;
               win = 1;
               break
      elseif board(1,k) == 2 && board(2,k+1) == 2 && board(3,k+2) == 2 && board(4,k+3) == 2
%                player2 = 1;
               win = 2;
               break
      end
  end


% Check for diagonals at bottom right(/)
  for k = 7:-1:4
      if board (6,k) == 3 && board(5,k-1) == 3 && board(4,k-2) == 3 && board(3,k-3)== 3
%           player1 = 1;
          win = 1;

      elseif board (6,k) == 2 && board(5,k-1) == 2 && board(4,k-2) == 2 && board(3,k-3)== 2
%           player2 = 1;
          win = 2;

      elseif board (1,k) == 3 && board(2,k-1) == 3 && board(3,k-2) == 3 && board(4,k-3)== 3
%           player1 = 1;
          win = 1;

      elseif board (1,k) == 2 && board(2,k-1) == 2 && board(3,k-2) == 2 && board(4,k-3)== 2
%           player2 = 1;
          win = 2;

      end
  end

% % TO-DO! Perform a change in the board array indexing here
% %   Account for other diagonals not done above(This are Hardcoded)
  if board(5,2) == 3 && board(4,3) == 3 && board(3,4) == 3 && board(2,5) == 3
%        player1 = 1;
       win = 1;


  elseif board(5,2) == 2 && board(4,3) == 2 && board(3,4) == 2 && board(2,5) == 2
%        player2 = 1;
       win = 1;
  elseif board(5,7) == 3 && board(4,6) == 3 && board(3,5) == 3 && board(2,4) == 3
%        player1 = 1;
       win = 1;
  elseif board(5,7) == 2 && board(4,6) == 2 && board(3,5) == 2 && board(2,4) == 2
%        player2 = 1;
       win = 1;
  elseif board(2,7) == 3 && board(3,6) == 3 && board(4,5) == 3 && board(5,4) == 3
%        player1 = 1;
       win = 1;
  elseif board(2,7) == 2 && board(3,6) == 2 && board(4,5) == 2 && board(5,4) == 2 
%        player2 = 1;
       win = 1;

  elseif board(2,1) == 3 && board(3,2) == 3 && board(4,3) == 3 && board(5,4) == 3 
%        player1 = 1;
       win = 1;

  elseif board(2,1) == 2 && board(3,2) == 2 && board(4,3) == 2 && board(5,4) == 2 
%        player2 = 1;
       win = 1;

 

  end




end