%% INTRODUCTION GUI
% TO-DO 
%     Change the Fontweight of the button
clc
clear
close(allchild(0))

% SOME FUNCTION DEFINATION
% The figure window contains the position, width and height in pixels of
% the window

% Note: Color used is Ohio State Hexadecimal color value of #CE0F3D

% menubar removes to menu function on the window

% NumberTitle detrmines if the number of figure window is displayed or not 

% UserData gets the information of the button clicked by the user

% 200 and 300 are location of the figure window
% 700 is the width and 350 is the height

% This is ohio state color blue hexadecimal color code

Ohio_State_Color = '#0072BD';
Ohio_State_Color_red = '#CE0F3D';

PlayerSelection = figure('Units','normalized','Color',Ohio_State_Color_red, ...
    'Position',[.25,.25,.5,.5],'MenuBar','none','NumberTitle','off', ...
    'Pointer','hand','Visible','on');


% This create a text field to allows user understand what to do
Text = uicontrol('Style','text','Units','normalized','Position', ...
    [.125,.8,.75,.125],'String','Hello!, Select a game mode below', ...
    'BackgroundColor',Ohio_State_Color_red,'FontSize',22,'FontWeight','bold', ...
    'ForegroundColor','k');

%  IMAGE_multiplayer = imread('pvp.png');
% This create a button to allows user Game mode selection

% UserData gets the information of the button clicked by the user
Multiplayer = uicontrol('Style','pushbutton', ...
    'Units','normalized','Position',[.125,.25,.25,.5], ...
    'UserData','Multiplayer','String','Multiplayer','FontWeight','bold');


% This create a button to allows user Game mode selection
% Note:Callback function makes the button perform a specific function once
% clicked
% UserData gets the information of the button clicked by the user
AI = uicontrol('Style','pushbutton','Units','normalized', ...
    'Position',[.625,.25,.25,.5],'UserData','AI', ...
    'String','Player vs Computer','FontWeight','bold');

% Note:Callback function makes the button perform a specific function once
% clicked
% The code below allows both of the button, Multiplayer and AI to be input
% argument for the function

Multiplayer.Callback = {@Gamemode,Multiplayer,AI};
AI.Callback = {@Gamemode,Multiplayer,AI};

function Gamemode(object, ~,Multiplayer,AI)
% This allows me to get which button was clicked by the user
%   mode_selected = object.UserData

    mode_selected = object.UserData;

%   strcmpi is a string compare function , which compares two strings 
   if strcmpi(mode_selected,'Multiplayer')
%   This alows the user to only select one option and then disable the
%   other option
%        Multiplayer.Enable = 'off';
%        AI.Enable ='off';
       Multiplayer.Enable = 'on';
       AI.Enable ='off';

       Player1text = uicontrol("Style",'text','String','PLAYER 1 NAME:', ...
           'Units','normalized','Position',[.0625  .125  .2  .0625], ...
           'FontSize',14,'FontWeight','bold');

%      edit allows for text input
       Player1 = uicontrol("Style",'edit','Units','normalized','Position', ...
           [.2625  .125  .2  .0625],'FontSize',14,'FontWeight','bold');

       Player2text = uicontrol("Style",'text','String','PLAYER 2 NAME:', ...
           'Units','normalized','Position',[.531255 .125  .2  .0625], ...
           'FontSize',14,'FontWeight','bold');
%      edit allows for text input
       Player2 = uicontrol("Style",'edit','Units','normalized','Position', ...
           [.731255  .125  .2  .0625],'FontSize',14,'FontWeight','bold');

%      This allows player1 and player2 names to be saved along with the game mode(multiplayer)     
       Player1.Callback = {@StartButton,'Multiplayer',Player1,Player2};
       Player2.Callback = {@StartButton,'Multiplayer',Player1,Player2};

%      This takes in the Player mode, multiplayer or AI, and name of player
%      1 and player 2 if necessary.
%        Start_Game.Callback = {@Game_Demo_2,'Multiplayer',Player1.String,Player2.String};


   elseif strcmpi(mode_selected,'AI') 
%   This alows the user to only select one option and then disable the
%   other option
       Multiplayer.Enable = 'off';
       AI.Enable ='on';

       Player1text = uicontrol("Style",'text','String','PLAYER''S NAME:', ...
           'Units','normalized','Position',[.531255 .125  .2  .0625],'FontSize',14,'FontWeight','bold');
%      edit allows for text input
       Player1 = uicontrol("Style",'edit','Units','normalized','Position', ...
           [.731255  .125  .2  .0625],'FontSize',14,'FontWeight','bold');

%      This allows player1 name to be saved along with the game mode(AI) 

       Player1.Callback = {@StartButton,'AI',Player1,''};

   else 
       fprintf('There is an error with the AI and Multiplayer selection')

   end

end


% This create a function for the START button, once clicked, it saves the
% value of Player1 as P1 and Player2 as P2 and the game mode selected.

function StartButton(~,~,Mode,Player1,Player2)

%  If game mode is A1, it saves the second player as computer and first
%  player as player 1 name.But if game mode is multiplayer, then Player 1
%  is saved as an input string form user and player 2 is saved as an input
%  string from user.
% Using the strcmpi function, we can test if two strings or character
% arrays are the same, ignoring any differences in letter case.

    if strcmpi(Mode,'AI')
        P2 = 'Computer';
    else
        P2 = Player2.String;
    end

    P1 = Player1.String;




    if ~isempty(P1) && ~isempty(P2)

        Start_Game = uicontrol("Style","pushbutton",'Units','normalized','Position',[.35,.025,.3,.0625], ...
            'String','START','FontSize',20,'FontWeight','bold','BackgroundColor',[0 .5 0]);
        Start_Game.Callback = {@Game_Demo_2,Mode,P1,P2};

    end

end




