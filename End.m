function [] = End(object,~)


    option_selected = object.UserData;

    close all

    message = 'Thanks for playing';

    if strcmpi(option_selected,'NO')

        execute = figure('Position',[200 300 700 350],'Color','#CE0F3D','MenuBar','none','NumberTitle','off','Pointer','hand');

        Text = uicontrol('Style','text','Units','normalized','Position',[.125,.50,.75,.125],'String',message, ...
                           'BackgroundColor','#CE0F3D','FontSize',30,'FontWeight','bold','ForegroundColor','k');
        
    end

end
