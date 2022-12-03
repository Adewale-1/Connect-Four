



%  Main Scene 
function Game_Demo_2(~,~,mode_selected,P1,P2)


    if strcmpi(mode_selected,'Multiplayer') 

        % Initializing the Multiplayyer scene object
        scene1 = simpleGameEngine('Connect_Dipanjali.png',86,101,5);
        % Creating the board which contain 6 rows and 7 column
        board = ones(6,7);
        player = 3;

        message = "Multiplayer";

        R = 6;
        c = 1:6;

        won = true;
        %  O represents if the block is empty and 1 represent if the block is taken
        %  by a tile.
        value2(1:7) = 0;


        %  loops if the test fuction is not met
        while won 
            drawScene(scene1,board);
            title({message},'FontSize',15,'Fontname','Times new roman');
            [r,c] = getMouseInput(scene1);

        %  check if the block at the player mouse input is filled, if not filled
        %  assign it is zero.
            if value2(c) == 0              
                board(R,c) =  player;
         
        %       assign 1 to that block position to represent a filled
                value2(c) = value2(c) + 1;
        %       This allows for second player's input
                player = 5 - player;
      

     
        %        Check if win condition is met, and also who won
                 win = checkwin(board);
 


        %        Check if player 1 won or Player 2 won, then print the neccessary
        %        information as a Title
                if win == 1

             
                    message = sprintf('Congratulations! %s won',P1);
%                     title({message},'FontSize',15,'Fontname','Times new roman');
                    Main = figure('Position',[200 300 700 350],'Color','#CE0F3D','MenuBar','none','NumberTitle','off','Pointer','hand')
                    Text = uicontrol('Style','text','Units','normalized','Position',[.125,.8,.75,.125],'String',message, ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');
                    
                    Text2 = uicontrol('Style','text','Units','normalized','Position',[.100,.5,.75,.125],'String','Do you want to play again?', ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    % UserData gets the information of the button clicked by the user

                    % This create a button to allows user Game mode selection
                    % Note:Callback function makes the button perform a specific function once
                    % clicked
                    % UserData gets the information of the button clicked by the user
                    
                    NO = uicontrol('Style','pushbutton', ...
                        'Units','normalized','Position',[.250,.25,.25,.15], ...
                        'UserData','NO','String','NO','FontWeight','bold','FontSize',20,'Callback',{@End});
                    
                    
                    YES = uicontrol('Style','pushbutton','Units','normalized','Position',[.540,.25,.25,.15], ...
                        'UserData','YES','String','YES','FontWeight','bold','FontSize',20,'Callback',{@Recall});


                    won = false ;
           
                elseif win == 2

              
                    message = sprintf('Congratulations! %s won',P2);
                    Main = figure('Position',[200 300 700 350],'Color','#CE0F3D','MenuBar','none','NumberTitle','off','Pointer','hand');
                    Text = uicontrol('Style','text','Units','normalized','Position',[.125,.8,.75,.125],'String',message, ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k')
                    Text2 = uicontrol('Style','text','Units','normalized','Position',[.100,.5,.75,.125],'String','Do you want to play again?', ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k')

                    % UserData gets the information of the button clicked by the user

                    % This create a button to allows user Game mode selection
                    % Note:Callback function makes the button perform a specific function once
                    % clicked
                    % UserData gets the information of the button clicked by the user
                    
                    NO = uicontrol('Style','pushbutton', ...
                        'Units','normalized','Position',[.250,.25,.25,.15], ...
                        'UserData','NO','String','NO','FontWeight','bold','FontSize',20,'Callback',{@End});
                    
                    
                    YES = uicontrol('Style','pushbutton','Units','normalized','Position',[.540,.25,.25,.15], ...
                        'UserData','YES','String','YES','FontWeight','bold','FontSize',20,'Callback',{@Recall});

                    won = false ;
                end

        %  check if the block at the player mouse input is filled, if not filled
        %  assign it is zero.If it is 1 ( which mean it is filled), then stack the
        %  tile on the previous played position.
            elseif value2(c) == 1
                board(R-1,c) =  player;
 
                value2(c) = value2(c) + 1;
                % This allows for second player's input
                player = 5 - player;


        %       Check if win condition is met, and also who won
                win = checkwin(board);
 
   
        %       Check if player 1 won or Player 2 won, then print the neccessary
        %       information as a Title
                if win == 1

                
                    message = sprintf('Congratulations! %s won',P1);
                    Main = figure('Position',[200 300 700 350],'Color','#CE0F3D','MenuBar','none','NumberTitle','off','Pointer','hand');
                    Text = uicontrol('Style','text','Units','normalized','Position',[.125,.8,.75,.125],'String',message, ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');
                    Text2 = uicontrol('Style','text','Units','normalized','Position',[.100,.5,.75,.125],'String','Do you want to play again?', ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    % UserData gets the information of the button clicked by the user

                    % This create a button to allows user Game mode selection
                    % Note:Callback function makes the button perform a specific function once
                    % clicked
                    % UserData gets the information of the button clicked by the user
                    
                    NO = uicontrol('Style','pushbutton', ...
                        'Units','normalized','Position',[.250,.25,.25,.15], ...
                        'UserData','NO','String','NO','FontWeight','bold','FontSize',20,'Callback',{@End});
                    
                    
                    YES = uicontrol('Style','pushbutton','Units','normalized','Position',[.540,.25,.25,.15], ...
                        'UserData','YES','String','YES','FontWeight','bold','FontSize',20,'Callback',{@Recall});


                    won = false;
           
                elseif win == 2

            
                    message = sprintf('Congratulations! %s won',P2);
                    Main = figure('Position',[200 300 700 350],'Color','#CE0F3D','MenuBar','none','NumberTitle','off','Pointer','hand');
                    Text = uicontrol('Style','text','Units','normalized','Position',[.125,.8,.75,.125],'String',message, ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');
                    Text2 = uicontrol('Style','text','Units','normalized','Position',[.100,.5,.75,.125],'String','Do you want to play again?', ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k')

                    % UserData gets the information of the button clicked by the user

                    % This create a button to allows user Game mode selection
                    % Note:Callback function makes the button perform a specific function once
                    % clicked
                    % UserData gets the information of the button clicked by the user
                    
                    NO = uicontrol('Style','pushbutton', ...
                        'Units','normalized','Position',[.250,.25,.25,.15], ...
                        'UserData','NO','String','NO','FontWeight','bold','FontSize',20,'Callback',{@End});
                    
                    
                    YES = uicontrol('Style','pushbutton','Units','normalized','Position',[.540,.25,.25,.15], ...
                        'UserData','YES','String','YES','FontWeight','bold','FontSize',20,'Callback',{@Recall});


                    won = false;
                end
    
        %  check if the block at the player mouse input is filled, if not filled
        %  assign it is zero.If it is 1 ( which mean it is filled), then stack the
        %  tile on the previous played position.
            elseif value2(c) == 2
                board(R-2,c) =  player;

                value2(c) = value2(c) + 1;
                % This allows for second player's input
                player = 5 - player;


        %        Check if win condition is met, and also who won
                win = checkwin(board);
 

        %       Check if player 1 won or Player 2 won, then print the neccessary
        %       information as a Title
                if win == 1
      
                    message = sprintf('Congratulations! %s won',P1);
                    Main = figure('Position',[200 300 700 350],'Color','#CE0F3D','MenuBar','none','NumberTitle','off','Pointer','hand');
                    Text = uicontrol('Style','text','Units','normalized','Position',[.125,.8,.75,.125],'String',message, ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');
                    Text2 = uicontrol('Style','text','Units','normalized','Position',[.100,.5,.75,.125],'String','Do you want to play again?', ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    % UserData gets the information of the button clicked by the user

                    % This create a button to allows user Game mode selection
                    % Note:Callback function makes the button perform a specific function once
                    % clicked
                    % UserData gets the information of the button clicked by the user
                    
                    NO = uicontrol('Style','pushbutton', ...
                        'Units','normalized','Position',[.250,.25,.25,.15], ...
                        'UserData','NO','String','NO','FontWeight','bold','FontSize',20,'Callback',{@End});
                    
                    
                    YES = uicontrol('Style','pushbutton','Units','normalized','Position',[.540,.25,.25,.15], ...
                        'UserData','YES','String','YES','FontWeight','bold','FontSize',20,'Callback',{@Recall});

                    won = false;
           
                elseif win == 2

           
                    message = sprintf('Congratulations! %s won',P2);
                    Main = figure('Position',[200 300 700 350],'Color','#CE0F3D','MenuBar','none','NumberTitle','off','Pointer','hand')
                    Text = uicontrol('Style','text','Units','normalized','Position',[.125,.8,.75,.125],'String',message, ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k')

 
                    Text2 = uicontrol('Style','text','Units','normalized','Position',[.100,.5,.75,.125],'String','Do you want to play again?', ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    % UserData gets the information of the button clicked by the user

                    % This create a button to allows user Game mode selection
                    % Note:Callback function makes the button perform a specific function once
                    % clicked
                    % UserData gets the information of the button clicked by the user
                    
                    NO = uicontrol('Style','pushbutton', ...
                        'Units','normalized','Position',[.250,.25,.25,.15], ...
                        'UserData','NO','String','NO','FontWeight','bold','FontSize',20,'Callback',{@End});
                    
                    
                    YES = uicontrol('Style','pushbutton','Units','normalized','Position',[.540,.25,.25,.15], ...
                        'UserData','YES','String','YES','FontWeight','bold','FontSize',20,'Callback',{@Recall});


                    won = false ;
                end


        %  check if the block at the player mouse input is filled, if not filled
        %  assign it is zero.If it is 1 ( which mean it is filled), then stack the
        %  tile on the previous played position.
            elseif value2 (c) == 3
                board(R-3,c) =  player;
         
                value2(c) = value2(c) + 1;
                % This allows for second player's input
                player = 5 - player;
  

        %       Check if win condition is met, and also who won
                win = checkwin(board);


        %       Check if player 1 won or Player 2 won, then print the neccessary
        %       information as a Title
                if win == 1

              
                    message = sprintf('Congratulations! %s won',P1);
                    Main = figure('Position',[200 300 700 350],'Color','#CE0F3D','MenuBar','none','NumberTitle','off','Pointer','hand');
                    Text = uicontrol('Style','text','Units','normalized','Position',[.125,.8,.75,.125],'String',message, ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    Text2 = uicontrol('Style','text','Units','normalized','Position',[.100,.5,.75,.125],'String','Do you want to play again?', ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    % UserData gets the information of the button clicked by the user

                    % This create a button to allows user Game mode selection
                    % Note:Callback function makes the button perform a specific function once
                    % clicked
                    % UserData gets the information of the button clicked by the user
                    
                    NO = uicontrol('Style','pushbutton', ...
                        'Units','normalized','Position',[.250,.25,.25,.15], ...
                        'UserData','NO','String','NO','FontWeight','bold','FontSize',20,'Callback',{@End});
                    
                    
                    YES = uicontrol('Style','pushbutton','Units','normalized','Position',[.540,.25,.25,.15], ...
                        'UserData','YES','String','YES','FontWeight','bold','FontSize',20,'Callback',{@Recall});


                    won = false ;
           
                elseif win == 2

                
                    message = sprintf('Congratulations! %s won',P2);
                    Main = figure('Position',[200 300 700 350],'Color','#CE0F3D','MenuBar','none','NumberTitle','off','Pointer','hand');
                    Text = uicontrol('Style','text','Units','normalized','Position',[.125,.8,.75,.125],'String',message, ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    Text2 = uicontrol('Style','text','Units','normalized','Position',[.100,.5,.75,.125],'String','Do you want to play again?', ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    % UserData gets the information of the button clicked by the user

                    % This create a button to allows user Game mode selection
                    % Note:Callback function makes the button perform a specific function once
                    % clicked
                    % UserData gets the information of the button clicked by the user
                    
                    NO = uicontrol('Style','pushbutton', ...
                        'Units','normalized','Position',[.250,.25,.25,.15], ...
                        'UserData','NO','String','NO','FontWeight','bold','FontSize',20,'Callback',{@End});
                    
                    
                    YES = uicontrol('Style','pushbutton','Units','normalized','Position',[.540,.25,.25,.15], ...
                        'UserData','YES','String','YES','FontWeight','bold','FontSize',20,'Callback',{@Recall});


                    won = false ;
                    
                end
        


        %  check if the block at the player mouse input is filled, if not filled
        %  assign it is zero.If it is 1 ( which mean it is filled), then stack the
        %  tile on the previous played position.
            elseif value2 (c) == 4
                board(R-4,c) =  player;

                value2(c) = value2(c) + 1;
                % This allows for second player's input
                player = 5 - player;
 
 
        %       Check if win condition is met, and also who won
                win = checkwin(board);


      
        %        Check if player 1 won or Player 2 won, then print the neccessary
        %        information as a Title
                if win == 1

                  
                    message = sprintf('Congratulations! %s won',P1);
                    Main = figure('Position',[200 300 700 350],'Color','#CE0F3D','MenuBar','none','NumberTitle','off','Pointer','hand');
                    Text = uicontrol('Style','text','Units','normalized','Position',[.125,.8,.75,.125],'String',message, ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    Text2 = uicontrol('Style','text','Units','normalized','Position',[.100,.5,.75,.125],'String','Do you want to play again?', ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    % UserData gets the information of the button clicked by the user

                    % This create a button to allows user Game mode selection
                    % Note:Callback function makes the button perform a specific function once
                    % clicked
                    % UserData gets the information of the button clicked by the user
                    
                    NO = uicontrol('Style','pushbutton', ...
                        'Units','normalized','Position',[.250,.25,.25,.15], ...
                        'UserData','NO','String','NO','FontWeight','bold','FontSize',20,'Callback',{@End});
                    
                    
                    YES = uicontrol('Style','pushbutton','Units','normalized','Position',[.540,.25,.25,.15], ...
                        'UserData','YES','String','YES','FontWeight','bold','FontSize',20,'Callback',{@Recall});



                    won = false ;

           
                elseif win == 2

                   
                    message = sprintf('Congratulations! %s won',P2);
                    Main = figure('Position',[200 300 700 350],'Color','#CE0F3D','MenuBar','none','NumberTitle','off','Pointer','hand');
                    Text = uicontrol('Style','text','Units','normalized','Position',[.125,.8,.75,.125],'String',message, ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    Text2 = uicontrol('Style','text','Units','normalized','Position',[.100,.5,.75,.125],'String','Do you want to play again?', ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    % UserData gets the information of the button clicked by the user

                    % This create a button to allows user Game mode selection
                    % Note:Callback function makes the button perform a specific function once
                    % clicked
                    % UserData gets the information of the button clicked by the user
                    
                    NO = uicontrol('Style','pushbutton', ...
                        'Units','normalized','Position',[.250,.25,.25,.15], ...
                        'UserData','NO','String','NO','FontWeight','bold','FontSize',20,'Callback',{@End});
                    
                    
                    YES = uicontrol('Style','pushbutton','Units','normalized','Position',[.540,.25,.25,.15], ...
                        'UserData','YES','String','YES','FontWeight','bold','FontSize',20,'Callback',{@Recall});


                    won = false ;
                end
        

        %  check if the block at the player mouse input is filled, if not filled
        %  assign it is zero.If it is 1 ( which mean it is filled), then stack the
        %  tile on the previous played position.
            elseif value2 (c) == 5
                board(R-5,c) =  player;

                value2(c) = value2(c) + 1;
                % This allows for second player's input
                player = 5  - player;
        

        %       Check if win condition is met, and also who won
                win = checkwin(board);

        %       Check if player 1 won or Player 2 won, then print the neccessary
        %       information as a Title
                if win == 1

                   
                    message = sprintf('Congratulations! %s won',P1);
                    Main = figure('Position',[200 300 700 350],'Color','#CE0F3D','MenuBar','none','NumberTitle','off','Pointer','hand');
                    Text = uicontrol('Style','text','Units','normalized','Position',[.125,.8,.75,.125],'String',message, ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');
                    Text2 = uicontrol('Style','text','Units','normalized','Position',[.100,.5,.75,.125],'String','Do you want to play again?', ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    % UserData gets the information of the button clicked by the user

                    % This create a button to allows user Game mode selection
                    % Note:Callback function makes the button perform a specific function once
                    % clicked
                    % UserData gets the information of the button clicked by the user
                    
                    NO = uicontrol('Style','pushbutton', ...
                        'Units','normalized','Position',[.250,.25,.25,.15], ...
                        'UserData','NO','String','NO','FontWeight','bold','FontSize',20,'Callback',{@End});
                    
                    
                    YES = uicontrol('Style','pushbutton','Units','normalized','Position',[.540,.25,.25,.15], ...
                        'UserData','YES','String','YES','FontWeight','bold','FontSize',20,'Callback',{@Recall});


                    won = flase ;
           
                elseif win == 2

                  
                    message = sprintf('Congratulations! %s won',P2);
                    Main = figure('Position',[200 300 700 350],'Color','#CE0F3D','MenuBar','none','NumberTitle','off','Pointer','hand');
                    Text = uicontrol('Style','text','Units','normalized','Position',[.125,.8,.75,.125],'String',message, ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');
                    Text2 = uicontrol('Style','text','Units','normalized','Position',[.100,.5,.75,.125],'String','Do you want to play again?', ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    % UserData gets the information of the button clicked by the user

                    % This create a button to allows user Game mode selection
                    % Note:Callback function makes the button perform a specific function once
                    % clicked
                    % UserData gets the information of the button clicked by the user
                    
                    NO = uicontrol('Style','pushbutton', ...
                        'Units','normalized','Position',[.250,.25,.25,.15], ...
                        'UserData','NO','String','NO','FontWeight','bold','FontSize',20,'Callback',{@End});
                    
                    
                    YES = uicontrol('Style','pushbutton','Units','normalized','Position',[.540,.25,.25,.15], ...
                        'UserData','YES','String','YES','FontWeight','bold','FontSize',20,'Callback',{@Recall});


                    won = false ;
                end

            end

          end



          % Display the final scene
          drawScene(scene1,board)



    elseif strcmpi(mode_selected,'AI') 

        % Initializing the Player vs Computer scene object

        %%    PLEASE NOTE THIS AI IS SO SO SO SO STUPID!!!


        scene1 = simpleGameEngine('Connect_Dipanjali.png',86,101,5);

        % Creating the board which contain 6 rows and 7 column
        board = ones(6,7);
        player = 3;

        message = "Player vs Computer";

        R = 6;
        c = 1:6;

        won = true;
        value2(1:7) = 0;


        %  loops if the test fuction is not met
        while won 
            drawScene(scene1,board);
            title({message},'FontSize',15,'Fontname','Times new roman');

            if player == 2
                c = randi(7);
                pause(1.1)

            else
       
                [r,c] = getMouseInput(scene1);
            end

        %  check if the block at the player mouse input is filled, if not filled
        %  assign it is zero.
            if value2(c) == 0              
                board(R,c) =  player;
         
        %       assign 1 to that block position to represent a filled
                value2(c) = value2(c) + 1;
        %       This allows for second player's input

                player = 5 - player;
      

     
        %        Check if win condition is met, and also who won
                win = checkwin(board);
 


        %       Check if player 1 won or Player 2 won, then print the neccessary
        %       information as a Title
                if win == 1
                    message = sprintf('Congratulations! %s won',P1);
                    Main = figure('Position',[200 300 700 350],'Color','#CE0F3D','MenuBar','none','NumberTitle','off','Pointer','hand');
                    Text = uicontrol('Style','text','Units','normalized','Position',[.125,.8,.75,.125],'String',message, ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');


                     Text2 = uicontrol('Style','text','Units','normalized','Position',[.100,.5,.75,.125],'String','Do you want to play again?', ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    % UserData gets the information of the button clicked by the user
                    % This create a button to allows user Game mode selection
                    % Note:Callback function makes the button perform a specific function once
                    % clicked
                    % UserData gets the information of the button clicked by the user
                    
                    NO = uicontrol('Style','pushbutton', ...
                        'Units','normalized','Position',[.250,.25,.25,.15], ...
                        'UserData','NO','String','NO','FontWeight','bold','FontSize',20,'Callback',{@End});
                    
                    
                    YES = uicontrol('Style','pushbutton','Units','normalized','Position',[.540,.25,.25,.15], ...
                        'UserData','YES','String','YES','FontWeight','bold','FontSize',20,'Callback',{@Recall});



                    won = false ;
           
                elseif win == 2
                    message = sprintf('Sorry! %s won, try harder next time.',P2);
                    Main = figure('Position',[200 300 700 350],'Color','#CE0F3D','MenuBar','none','NumberTitle','off','Pointer','hand');
                    Text = uicontrol('Style','text','Units','normalized','Position',[.125,.8,.75,.125],'String',message, ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    Text2 = uicontrol('Style','text','Units','normalized','Position',[.100,.5,.75,.125],'String','Do you want to play again?', ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    % UserData gets the information of the button clicked by the user
                    % This create a button to allows user Game mode selection
                    % Note:Callback function makes the button perform a specific function once
                    % clicked
                    % UserData gets the information of the button clicked by the user
                    
                    NO = uicontrol('Style','pushbutton', ...
                        'Units','normalized','Position',[.250,.25,.25,.15], ...
                        'UserData','NO','String','NO','FontWeight','bold','FontSize',20,'Callback',{@End});
                    
                    
                    YES = uicontrol('Style','pushbutton','Units','normalized','Position',[.540,.25,.25,.15], ...
                        'UserData','YES','String','YES','FontWeight','bold','FontSize',20,'Callback',{@Recall});



                    won = false ;
                end

        %  check if the block at the player mouse input is filled, if not filled
        %  assign it is zero.If it is 1 ( which mean it is filled), then stack the
        %  tile on the previous played position.
            elseif value2(c) == 1
                board(R-1,c) =  player;
 
                value2(c) = value2(c) + 1;
                % This allows for second player's input

                player = 5 - player;


        %       Check if win condition is met, and also who won
                win = checkwin(board);


        %     Check if player 1 won or Player 2 won, then print the neccessary
        %     information as a Title
                if win == 1
                    message = sprintf('Congratulations! %s won',P1);
                    Main = figure('Position',[200 300 700 350],'Color','#CE0F3D','MenuBar','none','NumberTitle','off','Pointer','hand');
                    Text = uicontrol('Style','text','Units','normalized','Position',[.125,.8,.75,.125],'String',message, ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    Text2 = uicontrol('Style','text','Units','normalized','Position',[.100,.5,.75,.125],'String','Do you want to play again?', ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    % UserData gets the information of the button clicked by the user
                    % This create a button to allows user Game mode selection
                    % Note:Callback function makes the button perform a specific function once
                    % clicked
                    % UserData gets the information of the button clicked by the user
                    
                    NO = uicontrol('Style','pushbutton', ...
                        'Units','normalized','Position',[.250,.25,.25,.15], ...
                        'UserData','NO','String','NO','FontWeight','bold','FontSize',20,'Callback',{@End});
                    
                    
                    YES = uicontrol('Style','pushbutton','Units','normalized','Position',[.540,.25,.25,.15], ...
                        'UserData','YES','String','YES','FontWeight','bold','FontSize',20,'Callback',{@Recall});



                    won = false;
            
                elseif win == 2
                    message = sprintf('Sorry! %s won, try harder next time.',P2);
                    Main = figure('Position',[200 300 700 350],'Color','#CE0F3D','MenuBar','none','NumberTitle','off','Pointer','hand');
                    Text = uicontrol('Style','text','Units','normalized','Position',[.125,.8,.75,.125],'String',message, ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    Text2 = uicontrol('Style','text','Units','normalized','Position',[.100,.5,.75,.125],'String','Do you want to play again?', ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    % UserData gets the information of the button clicked by the user
                    % This create a button to allows user Game mode selection
                    % Note:Callback function makes the button perform a specific function once
                    % clicked
                    % UserData gets the information of the button clicked by the user
                    
                    NO = uicontrol('Style','pushbutton', ...
                        'Units','normalized','Position',[.250,.25,.25,.15], ...
                        'UserData','NO','String','NO','FontWeight','bold','FontSize',20,'Callback',{@End});
                    
                    
                    YES = uicontrol('Style','pushbutton','Units','normalized','Position',[.540,.25,.25,.15], ...
                        'UserData','YES','String','YES','FontWeight','bold','FontSize',20,'Callback',{@Recall});



                    won = false;
                end
    
        %  check if the block at the player mouse input is filled, if not filled
        %  assign it is zero.If it is 1 ( which mean it is filled), then stack the
        %  tile on the previous played position.
            elseif value2(c) == 2
                board(R-2,c) =  player;

                value2(c) = value2(c) + 1;
                % This allows for second player's input

                player = 5 - player;


        %       Check if win condition is met, and also who won
                win = checkwin(board);
 
          
        %       Check if player 1 won or Player 2 won, then print the neccessary
        %       information as a Title
                if win == 1
                    message = sprintf('Congratulations! %s won',P1);
                    Main = figure('Position',[200 300 700 350],'Color','#CE0F3D','MenuBar','none','NumberTitle','off','Pointer','hand');
                    Text = uicontrol('Style','text','Units','normalized','Position',[.125,.8,.75,.125],'String',message, ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    Text2 = uicontrol('Style','text','Units','normalized','Position',[.100,.5,.75,.125],'String','Do you want to play again?', ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    % UserData gets the information of the button clicked by the user
                    % This create a button to allows user Game mode selection
                    % Note:Callback function makes the button perform a specific function once
                    % clicked
                    % UserData gets the information of the button clicked by the user
                    
                    NO = uicontrol('Style','pushbutton', ...
                        'Units','normalized','Position',[.250,.25,.25,.15], ...
                        'UserData','NO','String','NO','FontWeight','bold','FontSize',20,'Callback',{@End});
                    
                    
                    YES = uicontrol('Style','pushbutton','Units','normalized','Position',[.540,.25,.25,.15], ...
                        'UserData','YES','String','YES','FontWeight','bold','FontSize',20,'Callback',{@Recall});



                    won = false;
           
                elseif win == 2
                    message =  sprintf('Sorry! %s won, try harder next time.',P2);
                    Main = figure('Position',[200 300 700 350],'Color','#CE0F3D','MenuBar','none','NumberTitle','off','Pointer','hand');
                    Text = uicontrol('Style','text','Units','normalized','Position',[.125,.8,.75,.125],'String',message, ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k')

                    Text2 = uicontrol('Style','text','Units','normalized','Position',[.100,.5,.75,.125],'String','Do you want to play again?', ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k')

                    % UserData gets the information of the button clicked by the user
                    % This create a button to allows user Game mode selection
                    % Note:Callback function makes the button perform a specific function once
                    % clicked
                    % UserData gets the information of the button clicked by the user
                    
                    NO = uicontrol('Style','pushbutton', ...
                        'Units','normalized','Position',[.250,.25,.25,.15], ...
                        'UserData','NO','String','NO','FontWeight','bold','FontSize',20,'Callback',{@End});
                    
                    
                    YES = uicontrol('Style','pushbutton','Units','normalized','Position',[.540,.25,.25,.15], ...
                        'UserData','YES','String','YES','FontWeight','bold','FontSize',20,'Callback',{@Recall});



                    won = false ;
                end


        %  check if the block at the player mouse input is filled, if not filled
        %  assign it is zero.If it is 1 ( which mean it is filled), then stack the
        %  tile on the previous played position.
            elseif value2 (c) == 3
                board(R-3,c) =  player;
         
                value2(c) = value2(c) + 1;
                % This allows for second player's input

                player = 5 - player;
  

        %       Check if win condition is met, and also who won
                win = checkwin(board);

         
        %        Check if player 1 won or Player 2 won, then print the neccessary
        %        information as a Title
                if win == 1
                    message = sprintf('Congratulations! %s won',P1);
                    Main = figure('Position',[200 300 700 350],'Color','#CE0F3D','MenuBar','none','NumberTitle','off','Pointer','hand');
                    Text = uicontrol('Style','text','Units','normalized','Position',[.125,.8,.75,.125],'String',message, ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    Text2 = uicontrol('Style','text','Units','normalized','Position',[.100,.5,.75,.125],'String','Do you want to play again?', ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    % UserData gets the information of the button clicked by the user
                    % This create a button to allows user Game mode selection
                    % Note:Callback function makes the button perform a specific function once
                    % clicked
                    % UserData gets the information of the button clicked by the user
                    
                    NO = uicontrol('Style','pushbutton', ...
                        'Units','normalized','Position',[.250,.25,.25,.15], ...
                        'UserData','NO','String','NO','FontWeight','bold','FontSize',20,'Callback',{@End});
                    
                    
                    YES = uicontrol('Style','pushbutton','Units','normalized','Position',[.540,.25,.25,.15], ...
                        'UserData','YES','String','YES','FontWeight','bold','FontSize',20,'Callback',{@Recall});



                    won = false ;
           
                elseif win == 2
                    message =  sprintf('Sorry! %s won, try harder next time.',P2);
                    Main = figure('Position',[200 300 700 350],'Color','#CE0F3D','MenuBar','none','NumberTitle','off','Pointer','hand');
                    Text = uicontrol('Style','text','Units','normalized','Position',[.125,.8,.75,.125],'String',message, ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    Text2 = uicontrol('Style','text','Units','normalized','Position',[.100,.5,.75,.125],'String','Do you want to play again?', ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    % UserData gets the information of the button clicked by the user
                    % This create a button to allows user Game mode selection
                    % Note:Callback function makes the button perform a specific function once
                    % clicked
                    % UserData gets the information of the button clicked by the user
                    
                    NO = uicontrol('Style','pushbutton', ...
                        'Units','normalized','Position',[.250,.25,.25,.15], ...
                        'UserData','NO','String','NO','FontWeight','bold','FontSize',20,'Callback',{@End});
                    
                    
                    YES = uicontrol('Style','pushbutton','Units','normalized','Position',[.540,.25,.25,.15], ...
                        'UserData','YES','String','YES','FontWeight','bold','FontSize',20,'Callback',{@Recall});



                    won = false ;
                end
        


        %  check if the block at the player mouse input is filled, if not filled
        %  assign it is zero.If it is 1 ( which mean it is filled), then stack the
        %  tile on the previous played position.
            elseif value2 (c) == 4
                board(R-4,c) =  player;

                value2(c) = value2(c) + 1;
                % This allows for second player's input

                player = 5 - player;
 
 
        %       Check if win condition is met, and also who won
                win = checkwin(board);



        %       Check if player 1 won or Player 2 won, then print the neccessary
        %       information as a Title
                if win == 1
                    message = sprintf('Congratulations! %s won',P1);
                    Main = figure('Position',[200 300 700 350],'Color','#CE0F3D','MenuBar','none','NumberTitle','off','Pointer','hand');
                    Text = uicontrol('Style','text','Units','normalized','Position',[.125,.8,.75,.125],'String',message, ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    Text2 = uicontrol('Style','text','Units','normalized','Position',[.100,.5,.75,.125],'String','Do you want to play again?', ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    % UserData gets the information of the button clicked by the user
                    % This create a button to allows user Game mode selection
                    % Note:Callback function makes the button perform a specific function once
                    % clicked
                    % UserData gets the information of the button clicked by the user
                    
                    NO = uicontrol('Style','pushbutton', ...
                        'Units','normalized','Position',[.250,.25,.25,.15], ...
                        'UserData','NO','String','NO','FontWeight','bold','FontSize',20,'Callback',{@End});
                    
                    
                    YES = uicontrol('Style','pushbutton','Units','normalized','Position',[.540,.25,.25,.15], ...
                        'UserData','YES','String','YES','FontWeight','bold','FontSize',20,'Callback',{@Recall});



                    won = false ;
           
                elseif win == 2
                    message = sprintf('Sorry! %s won, try harder next time.',P2);
                    Main = figure('Position',[200 300 700 350],'Color','#CE0F3D','MenuBar','none','NumberTitle','off','Pointer','hand');
                    Text = uicontrol('Style','text','Units','normalized','Position',[.125,.8,.75,.125],'String',message, ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    Text2 = uicontrol('Style','text','Units','normalized','Position',[.100,.5,.75,.125],'String','Do you want to play again?', ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    % UserData gets the information of the button clicked by the user
                    % This create a button to allows user Game mode selection
                    % Note:Callback function makes the button perform a specific function once
                    % clicked
                    % UserData gets the information of the button clicked by the user
                    
                    NO = uicontrol('Style','pushbutton', ...
                        'Units','normalized','Position',[.250,.25,.25,.15], ...
                        'UserData','NO','String','NO','FontWeight','bold','FontSize',20,'Callback',{@End});
                    
                    
                    YES = uicontrol('Style','pushbutton','Units','normalized','Position',[.540,.25,.25,.15], ...
                        'UserData','YES','String','YES','FontWeight','bold','FontSize',20,'Callback',{@Recall});



                    won = false ;
                end
        

        %  check if the block at the player mouse input is filled, if not filled
        %  assign it is zero.If it is 1 ( which mean it is filled), then stack the
        %  tile on the previous played position.
            elseif value2 (c) == 5
                board(R-5,c) =  player;

                value2(c) = value2(c) + 1;
                % This allows for second player's input

                player = 5  - player;
        

        %       Check if win condition is met, and also who won
                win = checkwin(board);
 
        %       Check if player 1 won or Player 2 won, then print the neccessary
        %       information as a Title
                if win == 1
                    message = sprintf('Congratulations! %s won',P1);
                    Main = figure('Position',[200 300 700 350],'Color','#CE0F3D','MenuBar','none','NumberTitle','off','Pointer','hand');
                    Text = uicontrol('Style','text','Units','normalized','Position',[.125,.8,.75,.125],'String',message, ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    Text2 = uicontrol('Style','text','Units','normalized','Position',[.100,.5,.75,.125],'String','Do you want to play again?', ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    % UserData gets the information of the button clicked by the user
                    % This create a button to allows user Game mode selection
                    % Note:Callback function makes the button perform a specific function once
                    % clicked
                    % UserData gets the information of the button clicked by the user
                    
                    NO = uicontrol('Style','pushbutton', ...
                        'Units','normalized','Position',[.250,.25,.25,.15], ...
                        'UserData','NO','String','NO','FontWeight','bold','FontSize',20,'Callback',{@End});
                    
                    
                    YES = uicontrol('Style','pushbutton','Units','normalized','Position',[.540,.25,.25,.15], ...
                        'UserData','YES','String','YES','FontWeight','bold','FontSize',20,'Callback',{@Recall});



                    won = flase ;
           
                elseif win == 2
                    message = sprintf('Sorry! %s won, try harder next time.',P2);
                    Main = figure('Position',[200 300 700 350],'Color','#CE0F3D','MenuBar','none','NumberTitle','off','Pointer','hand');
                    Text = uicontrol('Style','text','Units','normalized','Position',[.125,.8,.75,.125],'String',message, ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    Text2 = uicontrol('Style','text','Units','normalized','Position',[.100,.5,.75,.125],'String','Do you want to play again?', ...
                                     'BackgroundColor','#CE0F3D','FontSize',22,'FontWeight','bold','ForegroundColor','k');

                    % UserData gets the information of the button clicked by the user
                    % This create a button to allows user Game mode selection
                    % Note:Callback function makes the button perform a specific function once
                    % clicked
                    % UserData gets the information of the button clicked by the user
                    
                    NO = uicontrol('Style','pushbutton', ...
                        'Units','normalized','Position',[.250,.25,.25,.15], ...
                        'UserData','NO','String','NO','FontWeight','bold','FontSize',20,'Callback',{@End});
                    
                    
                    YES = uicontrol('Style','pushbutton','Units','normalized','Position',[.540,.25,.25,.15], ...
                        'UserData','YES','String','YES','FontWeight','bold','FontSize',20,'Callback',{@Recall});



                    won = false ;
                end

            end

        end




        % Display the final scene
        drawScene(scene1,board);



    end

end



