classdef app1_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure            matlab.ui.Figure
        SeeScoreButton      matlab.ui.control.Button
        Player2Button       matlab.ui.control.Button
        Player1Button       matlab.ui.control.Button
        balanceField        matlab.ui.control.TextArea
        betField            matlab.ui.control.EditField
        DiceRoll6           matlab.ui.control.Image
        DiceRoll5           matlab.ui.control.Image
        DiceRoll4           matlab.ui.control.Image
        DiceRoll3           matlab.ui.control.Image
        DiceRoll2           matlab.ui.control.Image
        DiceRoll1           matlab.ui.control.Image
        PlayerButton_2      matlab.ui.control.Button
        PlayerButton        matlab.ui.control.Button
        ExitGameButton      matlab.ui.control.Button
        NewGameButton       matlab.ui.control.Button
        HitMeButton         matlab.ui.control.Button
        IllPassButton       matlab.ui.control.Button
        DealerScoreText     matlab.ui.control.TextArea
        PlayerScoreText     matlab.ui.control.TextArea
        TitleArt            matlab.ui.control.Image
        Image2_2            matlab.ui.control.Image
        Image_2             matlab.ui.control.Image
        Image2              matlab.ui.control.Image
        Image               matlab.ui.control.Image
        ChoosePlayerButton  matlab.ui.control.Button
        playerRollsTable    matlab.ui.control.TextArea
        WinnerText          matlab.ui.control.TextArea
    end

    
    properties (Access = private)
        p1Points
        p2Points
        twoPlayer
        winner
        p1PointsText
        p2PointsText
        playerBet
        playerBalance
        myPlayerNum
        channelIDp1
        channelIDp2
        writeKeyp1
        writeKeyp2
        readKeyp1
        readKeyp2
        buttonPushCount
        p1Rolls
        p2Rolls

        % Description
    end
    
    methods (Access = private)
        
        function results = WinScreen(app,winner)
            % WINSCREEN
             app.IllPassButton.Visible = false;
             app.HitMeButton.Visible = false;   
             app.DiceRoll1.Visible = false;
             app.DiceRoll2.Visible = false;
             app.DiceRoll3.Visible = false;
             app.DiceRoll4.Visible = false;
             app.DiceRoll5.Visible = false;
             app.DiceRoll6.Visible = false;
             app.Player1Button.Visible = false;
             app.Player2Button.Visible = false;
             app.ChoosePlayerButton.Visible = false;
             app.SeeScoreButton.Visible = false;

            app.WinnerText.Visible = true;
            app.DealerScoreText.Visible = true;

            app.DealerScoreText.Value = "Dealer Score: " + num2str(GameCalc.dealerVal());
            switch winner
                case -1
                    app.WinnerText.Value = "Tie Game!";
                case 0
                    app.WinnerText.Value = "Winner:" + newline + "Dealer!";
                    [y,Fs] = audioread('lose.mp3');
                      sound(y,Fs);
                case 1
                    app.WinnerText.Value = "Winner: " + newline + "Player 1";
                    [y,Fs] = audioread('win.mp3');
                      sound(y,Fs);
                case 2
                    app.WinnerText.Value = "Winner: " + newline + "Player 2";
                    [y,Fs] = audioread('win.mp3');
                      sound(y,Fs);
                case 3
                    app.WinnerText.Value = "Winner: " + newline + "Players 1 and 2!";
                    [y,Fs] = audioread('win.mp3');
                      sound(y,Fs);
            end
            results = 0; 
        end
        
        function results = diceAni(app)
            %DICEANI Animates dice roll
               app.DiceRoll1.Visible = true;
               app.DiceRoll2.Visible = false;
               app.DiceRoll3.Visible = false;
               app.DiceRoll4.Visible = false;
               app.DiceRoll5.Visible = false;
               app.DiceRoll6.Visible = false;
               pause(0.1)

               app.DiceRoll1.Visible = false;
               app.DiceRoll2.Visible = true;
               app.DiceRoll3.Visible = false;
               app.DiceRoll4.Visible = false;
               app.DiceRoll5.Visible = false;
               app.DiceRoll6.Visible = false;
               pause(0.1)
        
               app.DiceRoll1.Visible = false;
               app.DiceRoll2.Visible = false;
               app.DiceRoll3.Visible = true;
               app.DiceRoll4.Visible = false;
               app.DiceRoll5.Visible = false;
               app.DiceRoll6.Visible = false;
               pause(0.1)
        
               app.DiceRoll1.Visible = false;
               app.DiceRoll2.Visible = false;
               app.DiceRoll3.Visible = false;
               app.DiceRoll4.Visible = true;
               app.DiceRoll5.Visible = false;
               app.DiceRoll6.Visible = false;
               pause(0.1)
             
               app.DiceRoll1.Visible = false;
               app.DiceRoll2.Visible = false;
               app.DiceRoll3.Visible = false;
               app.DiceRoll4.Visible = false;
               app.DiceRoll5.Visible = true;
               app.DiceRoll6.Visible = false;
               pause(0.1)
             
               app.DiceRoll1.Visible = false;
               app.DiceRoll2.Visible = false;
               app.DiceRoll3.Visible = false;
               app.DiceRoll4.Visible = false;
               app.DiceRoll5.Visible = false;
               app.DiceRoll6.Visible = true;
               pause(0.1)
            results = 0;
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
      [y,Fs] = audioread('intro.mp3');
                      sound(y,Fs);
      app.IllPassButton.Visible = false;
      app.HitMeButton.Visible = false;   
      app.NewGameButton.Visible = false;
      app.DiceRoll1.Visible = false;
      app.DiceRoll2.Visible = false;
      app.DiceRoll3.Visible = false;
      app.DiceRoll4.Visible = false;
      app.DiceRoll5.Visible = false;
      app.DiceRoll6.Visible = false;
      app.DealerScoreText.Visible = false;
      app.PlayerScoreText.Visible = false;
      app.WinnerText.Visible = false;
      app.betField.Visible = false;
      app.balanceField.Visible = false;
      app.Player1Button.Visible = false;
      app.Player2Button.Visible = false;
      app.SeeScoreButton.Visible = false;
      app.playerRollsTable.Visible = false;
      app.ChoosePlayerButton.Visible = false;

      app.p1Points = 0;
      app.p2Points = -1;
      app.twoPlayer = 0;
      app.playerBalance = 100;
      app.playerBet = 0;
      app.p1Rolls = "Player 1 Rolls: ";
      app.p2Rolls = "Player 2 Rolls: ";

      %ThingSpeak read and write codes
            app.channelIDp1 = 2470771;
            app.channelIDp2 = 2470817;
            app.writeKeyp1 = 'BH6CQYQ71MS04304';
            app.writeKeyp2 = 'CO9BIXOPC9AAG5CT';
            app.readKeyp1 = '878SWC69GC56X4GE';
            app.readKeyp2 = 'OJIBAWHZT5TEBBVY';
        end

        % Button pushed function: PlayerButton
        function SinglePlayer(app, event)
            app.PlayerButton.Visible = 'off';
            app.PlayerButton_2.Visible = 'off';
            app.Image.Visible = 'off';
            app.Image_2.Visible = 'off';
            app.Image2.Visible = 'off';
            app.Image2_2.Visible = 'off';
            app.TitleArt.Visible = 'off';
            app.ExitGameButton.Visible = 'off';
            app.NewGameButton.Visible = 'on';
            app.IllPassButton.Visible = 'on';
            app.HitMeButton.Visible = 'on';
            app.PlayerScoreText.Visible = 'on';
            app.betField.Visible = 'on';
            app.balanceField.Visible = 'on';
            app.Player2Button.Visible = 'off';
            app.Player1Button.Visible = 'off';
            %app.UITable.Visible = 'off';
            app.SeeScoreButton.Visible = 'off';


            app.PlayerScoreText.Value = "Player 1 Score: 0";
            app.twoPlayer = 0;
           
            app.myPlayerNum = 0;
            app.balanceField.Value = "Player Balance:" + newline + "$" + num2str(app.playerBalance);
        end

        % Button pushed function: PlayerButton_2
        function Multiplayer(app, event)
            app.PlayerButton.Visible = 'off';
            app.PlayerButton_2.Visible = 'off';
            app.Image.Visible = 'off';
            app.Image_2.Visible = 'off';
            app.Image2.Visible = 'off';
            app.Image2_2.Visible = 'off';
            app.TitleArt.Visible = 'off';
            app.ExitGameButton.Visible = 'off';
            app.NewGameButton.Visible = 'off';
            app.IllPassButton.Visible = 'off';
            app.HitMeButton.Visible = 'off';
            app.PlayerScoreText.Visible = 'off';
            app.Player1Button.Visible = 'on';
            app.Player2Button.Visible = 'on';
            %app.UITable.Visible = 'on';
            app.SeeScoreButton.Visible = 'off';
            app.ChoosePlayerButton.Visible = 'on';
            
            app.twoPlayer = 1;
            app.p2Points = 0;
        end

        % Button pushed function: ExitGameButton
        function ExitGameButtonPushed(app, event)
            delete(app);
        end

        % Button pushed function: NewGameButton
        function NewGameButtonPushed(app, event)
          [y,Fs] = audioread('intro.mp3');
                      sound(y,Fs);
            app.IllPassButton.Visible = false;
            app.HitMeButton.Visible = false;   
            app.NewGameButton.Visible = false;
            app.DiceRoll1.Visible = false;
            app.DiceRoll2.Visible = false;
            app.DiceRoll3.Visible = false;
            app.DiceRoll4.Visible = false;
            app.DiceRoll5.Visible = false;
            app.DiceRoll6.Visible = false;

            app.PlayerButton.Visible = 'on';
            app.PlayerButton_2.Visible = 'on';
            app.Image.Visible = 'on';
            app.Image_2.Visible = 'on';
            app.Image2.Visible = 'on';
            app.Image2_2.Visible = 'on';
            app.TitleArt.Visible = 'on';
            app.ExitGameButton.Visible = 'on';

            app.PlayerScoreText.Visible = 'off';
            app.WinnerText.Visible = 'off';
            app.DealerScoreText.Visible = 'off';
            app.betField.Visible = 'off';
            app.balanceField.Visible = 'off';
            app.SeeScoreButton.Visible = 'off';
            app.playerRollsTable.Visible = 'off';
            app.ChoosePlayerButton.Visible = false;

            app.playerRollsTable.Value = "";
            app.PlayerScoreText.Value = num2str(0);
            app.p1Points = 0;
            app.p2Points = 0;
            app.twoPlayer = 0;
            app.p1Rolls = "Player 1 Rolls: ";
            app.p2Rolls = "Player 2 Rolls: ";
        end

        % Button pushed function: HitMeButton
        function HitMeButtonPushed(app, event)
         app.SeeScoreButton.Visible = 'off';
           [y,Fs] = audioread('dice-142528.mp3');
           sound(y,Fs);
            
            randomDie = GameCalc.diceRoll();
         
         app.playerBet = str2num(app.betField.Value);
         app.betField.Visible = false;
         app.balanceField.Visible = false;
         
         points = 0;
         count = 0;   
         while (count < 3)
            app.diceAni();
            count = count + 1;
         end
         app.DiceRoll1.Visible = true;
         app.DiceRoll2.Visible = false;
         app.DiceRoll3.Visible = false;
         app.DiceRoll4.Visible = false;
         app.DiceRoll5.Visible = false;
         app.DiceRoll6.Visible = false;

            switch randomDie
               case 1
               app.DiceRoll1.Visible = true;
               app.DiceRoll2.Visible = false;
               app.DiceRoll3.Visible = false;
               app.DiceRoll4.Visible = false;
               app.DiceRoll5.Visible = false;
               app.DiceRoll6.Visible = false;

               points = points + 1;

               case 2
               app.DiceRoll1.Visible = false;
               app.DiceRoll2.Visible = true;
               app.DiceRoll3.Visible = false;
               app.DiceRoll4.Visible = false;
               app.DiceRoll5.Visible = false;
               app.DiceRoll6.Visible = false;

               points = points + 2;
               case 3
               app.DiceRoll1.Visible = false;
               app.DiceRoll2.Visible = false;
               app.DiceRoll3.Visible = true;
               app.DiceRoll4.Visible = false;
               app.DiceRoll5.Visible = false;
               app.DiceRoll6.Visible = false;

               points = points + 3;
               case 4
               app.DiceRoll1.Visible = false;
               app.DiceRoll2.Visible = false;
               app.DiceRoll3.Visible = false;
               app.DiceRoll4.Visible = true;
               app.DiceRoll5.Visible = false;
               app.DiceRoll6.Visible = false;

               points = points + 4;
               case 5
               app.DiceRoll1.Visible = false;
               app.DiceRoll2.Visible = false;
               app.DiceRoll3.Visible = false;
               app.DiceRoll4.Visible = false;
               app.DiceRoll5.Visible = true;
               app.DiceRoll6.Visible = false;

               points = points + 5;
               case 6
               app.DiceRoll1.Visible = false;
               app.DiceRoll2.Visible = false;
               app.DiceRoll3.Visible = false;
               app.DiceRoll4.Visible = false;
               app.DiceRoll5.Visible = false;
               app.DiceRoll6.Visible = true;

               points = points + 6;

            end


            if app.myPlayerNum == 1 || app.myPlayerNum == 0 
                 app.p1Points = app.p1Points + points;
                 app.p1PointsText = "Player 1 Score: " + num2str(app.p1Points);
                 app.PlayerScoreText.Value = app.p1PointsText;
                 app.p1Rolls = app.p1Rolls + randomDie + " | ";

                 if app.p1Points > 12
                     app.p1Points = 0;
                     app.winner = GameCalc.scoreCalc(app.p1Points, app.p2Points);
                     app.p1PointsText = "Player 1: Bust!";
                     app.IllPassButtonPushed;
                      [y,Fs] = audioread('lose.mp3');
                      sound(y,Fs);

                     if app.twoPlayer == 0
                        app.PlayerScoreText.Value = app.p1PointsText;
                        WinScreen(app, app.winner);
                        app.playerBalance = app.playerBalance + GameCalc.gamba(app.playerBet, 0);
                        app.balanceField.Visible = true;
                        app.balanceField.Value = "Player Balance:" + newline + "$" + num2str(app.playerBalance);
                        [y,Fs] = audioread('win.mp3');
                      sound(y,Fs);
                     end  

                 elseif app.p1Points == 12 && app.twoPlayer == 0
                     app.winner = GameCalc.scoreCalc(app.p1Points, app.p2Points);
                     WinScreen(app, app.winner);
                     app.playerBalance = app.playerBalance + GameCalc.gamba(app.playerBet, 1);
                     app.balanceField.Visible = true;
                     app.balanceField.Value = "Player Balance:" + newline + "$" + num2str(app.playerBalance);
                      [y,Fs] = audioread('win.mp3');
                      sound(y,Fs);
                 end
                 
                 
               else
                 app.p2Points = app.p2Points + points;
                 app.p2PointsText = "Player 2 Score: " + num2str(app.p2Points);
                 app.PlayerScoreText.Value = app.p2PointsText;
                 app.p2Rolls = app.p2Rolls + randomDie + " | ";
                
                 if app.p2Points > 12
                     app.p2Points = 0;
                     app.winner = GameCalc.scoreCalc(app.p1Points, app.p2Points);
                     app.PlayerScoreText.Value = app.p1PointsText + newline + "Player 2: Bust!";
                     WinScreen(app, app.winner);
                     [y,Fs] = audioread('lose.mp3');
                      sound(y,Fs);
                     
                 elseif app.p2Points == 12
                     app.winner = GameCalc.scoreCalc(app.p1Points, app.p2Points);
                     WinScreen(app, app.winner);
                     [y,Fs] = audioread('win.mp3');
                      sound(y,Fs);
                 end
            
            end
            app.playerRollsTable.Visible = true;
            app.playerRollsTable.Value = app.p1Rolls + newline + app.p2Rolls;
        end

        % Button pushed function: IllPassButton
        function IllPassButtonPushed(app, event)
            app.SeeScoreButton.Visible = 'on';
            app.HitMeButton.Visible = 'off';
            app.IllPassButton.Visible = 'off';
            %ThingSpeak read and write codes
            app.channelIDp1 = 2470771;
            app.channelIDp2 = 2470817;
            app.writeKeyp1 = '3EPERFM8OG1YLYF5';
            app.writeKeyp2 = 'CO9BIXOPC9AAG5CT';
            app.readKeyp1 = '878SWC69GC56X4GE';
            app.readKeyp2 = 'OJIBAWHZT5TEBBVY';
            
            if app.myPlayerNum == 1
                thingSpeakWrite(app.channelIDp1, 'WriteKey', app.writeKeyp1, 'Fields', 1, 'Values', app.p1Points);
            elseif app.myPlayerNum == 2
                thingSpeakWrite(app.channelIDp2, 'WriteKey', app.writeKeyp2, 'Fields', 1, 'Values', app.p2Points);
            end

            app.twoPlayer = 2;
        
        end

        % Button pushed function: Player1Button
        function Player1ButtonPushed(app, event)
            app.myPlayerNum = 1;
            
            app.Player2Button.Visible = false;
            app.PlayerButton.Visible = 'off';
            app.PlayerButton_2.Visible = 'off';
            app.Image.Visible = 'off';
            app.Image_2.Visible = 'off';
            app.Image2.Visible = 'off';
            app.Image2_2.Visible = 'off';
            app.TitleArt.Visible = 'off';
            app.ExitGameButton.Visible = 'off';
            app.NewGameButton.Visible = 'on';
            app.IllPassButton.Visible = 'on';
            app.HitMeButton.Visible = 'on';
            app.PlayerScoreText.Visible = 'on';
            app.Player1Button.Visible = 'off';
            app.Player2Button.Visible = 'off';
            app.SeeScoreButton.Visible = 'off';

            app.PlayerScoreText.Value = "Player 1 Score: 0";
        end

        % Button pushed function: Player2Button
        function Player2ButtonPushed(app, event)
            app.myPlayerNum = 2;
            

            app.Player2Button.Visible = false;
            app.PlayerButton.Visible = 'off';
            app.PlayerButton_2.Visible = 'off';
            app.Image.Visible = 'off';
            app.Image_2.Visible = 'off';
            app.Image2.Visible = 'off';
            app.Image2_2.Visible = 'off';
            app.TitleArt.Visible = 'off';
            app.ExitGameButton.Visible = 'off';
            app.NewGameButton.Visible = 'on';
            app.IllPassButton.Visible = 'on';
            app.HitMeButton.Visible = 'on';
            app.PlayerScoreText.Visible = 'on';
            app.Player1Button.Visible = 'off';
            app.Player2Button.Visible = 'off';
            app.SeeScoreButton.Visible = 'off';

            app.PlayerScoreText.Value = "Player 2 Score: 0";
        end

        % Callback function
        function UITableCellEdit(app, event)
            %{
            indices = event.Indices;
            newData = event.NewData;
            app.UITable.Data{indices(1),indices(2)} = newData;
            indices(1) = thingSpeakRead(app.channelIDp1, 'ReadKey', app.readKeyp1, 'Fields', 2);
            indices(2) = thingSpeakRead(app.channelIDp2, 'ReadKey', app.readKeyp2, 'Fields', 2);
            %}
        end

        % Button pushed function: SeeScoreButton
        function SeeScoreButtonPushed(app, event)
          
            if app.myPlayerNum == 1 %reads other player score from thingspeak
                app.p2Points = thingSpeakRead(app.channelIDp2, 'ReadKey', app.readKeyp2, 'Fields', 1);
            elseif app.myPlayerNum == 2
                app.p1Points = thingSpeakRead(app.channelIDp1, 'ReadKey', app.readKeyp1, 'Fields', 1);
            end

            if app.twoPlayer == 2 || app.twoPlayer == 0
                app.winner = GameCalc.scoreCalc(app.p1Points, app.p2Points);
                WinScreen(app, app.winner);
                app.PlayerScoreText.Value = "Player 1 Score: " + num2str(app.p1Points) + newline + "Player 2 Score: " ...
                    + num2str(app.p2Points);
                
                if app.myPlayerNum == 0 %only if 1 player gamemode
                    app.playerBalance = app.playerBalance - app.playerBet;
                    app.playerBalance = app.playerBalance + GameCalc.gamba(app.playerBet, app.winner);
                    app.balanceField.Visible = true;
                    app.balanceField.Value = "Player Balance:" + newline + "$" + num2str(app.playerBalance);
                    app.PlayerScoreText.Value = "Player 1 Score: " + num2str(app.p1Points);
                    if app.playerBalance <= 0
                        app.WinnerText.Value = "Out of Money!";
                        pause(3);
                        app.ExitGameButtonPushed;
                    end
                
                end
            
            else
               app.DiceRoll1.Visible = false;
               app.DiceRoll2.Visible = false;
               app.DiceRoll3.Visible = false;
               app.DiceRoll4.Visible = false;
               app.DiceRoll5.Visible = false;
               app.DiceRoll6.Visible = false;
            end
        end

        % Button pushed function: ChoosePlayerButton
        function ChoosePlayerButtonPushed(app, event)
            app.Multiplayer;
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [0.6353 0.0784 0.1843];
            app.UIFigure.Position = [200 100 736 736];
            app.UIFigure.Name = 'MATLAB App';

            % Create WinnerText
            app.WinnerText = uitextarea(app.UIFigure);
            app.WinnerText.FontName = 'Bahnschrift';
            app.WinnerText.FontSize = 48;
            app.WinnerText.FontColor = [1 1 1];
            app.WinnerText.BackgroundColor = [0.6353 0.0784 0.1843];
            app.WinnerText.Position = [187 542 366 125];

            % Create playerRollsTable
            app.playerRollsTable = uitextarea(app.UIFigure);
            app.playerRollsTable.Position = [484 44 225 48];

            % Create ChoosePlayerButton
            app.ChoosePlayerButton = uibutton(app.UIFigure, 'push');
            app.ChoosePlayerButton.ButtonPushedFcn = createCallbackFcn(app, @ChoosePlayerButtonPushed, true);
            app.ChoosePlayerButton.BackgroundColor = [0.8471 0.949 0.0745];
            app.ChoosePlayerButton.FontName = 'Bahnschrift';
            app.ChoosePlayerButton.FontSize = 24;
            app.ChoosePlayerButton.Position = [67 52 170 52];
            app.ChoosePlayerButton.Text = 'Choose Player';

            % Create Image
            app.Image = uiimage(app.UIFigure);
            app.Image.Position = [30 231 221 188];
            app.Image.ImageSource = '1187eb9cfb72e78e84d87f283efc2f30.png';

            % Create Image2
            app.Image2 = uiimage(app.UIFigure);
            app.Image2.Position = [208 208 266 231];
            app.Image2.ImageSource = 'flip.png';

            % Create Image_2
            app.Image_2 = uiimage(app.UIFigure);
            app.Image_2.Position = [362 231 221 188];
            app.Image_2.ImageSource = '1187eb9cfb72e78e84d87f283efc2f30.png';

            % Create Image2_2
            app.Image2_2 = uiimage(app.UIFigure);
            app.Image2_2.Position = [530 208 266 231];
            app.Image2_2.ImageSource = 'flip.png';

            % Create TitleArt
            app.TitleArt = uiimage(app.UIFigure);
            app.TitleArt.Position = [93 282 551 478];
            app.TitleArt.ImageSource = 'Untitled drawing.png';

            % Create PlayerScoreText
            app.PlayerScoreText = uitextarea(app.UIFigure);
            app.PlayerScoreText.FontName = 'Bahnschrift';
            app.PlayerScoreText.FontSize = 48;
            app.PlayerScoreText.FontColor = [1 1 1];
            app.PlayerScoreText.BackgroundColor = [0.6353 0.0784 0.1843];
            app.PlayerScoreText.Position = [168 338 407 140];

            % Create DealerScoreText
            app.DealerScoreText = uitextarea(app.UIFigure);
            app.DealerScoreText.FontName = 'Bahnschrift';
            app.DealerScoreText.FontSize = 48;
            app.DealerScoreText.FontColor = [1 1 1];
            app.DealerScoreText.BackgroundColor = [0.6353 0.0784 0.1843];
            app.DealerScoreText.Position = [187 477 366 66];

            % Create IllPassButton
            app.IllPassButton = uibutton(app.UIFigure, 'push');
            app.IllPassButton.ButtonPushedFcn = createCallbackFcn(app, @IllPassButtonPushed, true);
            app.IllPassButton.BackgroundColor = [0.0745 0.949 0.7451];
            app.IllPassButton.FontName = 'Bahnschrift';
            app.IllPassButton.FontSize = 24;
            app.IllPassButton.Position = [442 172 186 148];
            app.IllPassButton.Text = 'I''ll Pass! ';

            % Create HitMeButton
            app.HitMeButton = uibutton(app.UIFigure, 'push');
            app.HitMeButton.ButtonPushedFcn = createCallbackFcn(app, @HitMeButtonPushed, true);
            app.HitMeButton.BackgroundColor = [0.8392 0.2392 0.8588];
            app.HitMeButton.FontName = 'Bahnschrift';
            app.HitMeButton.FontSize = 24;
            app.HitMeButton.Position = [115 172 186 148];
            app.HitMeButton.Text = 'Hit Me!';

            % Create NewGameButton
            app.NewGameButton = uibutton(app.UIFigure, 'push');
            app.NewGameButton.ButtonPushedFcn = createCallbackFcn(app, @NewGameButtonPushed, true);
            app.NewGameButton.BackgroundColor = [0.8471 0.949 0.0745];
            app.NewGameButton.FontName = 'Bahnschrift';
            app.NewGameButton.FontSize = 24;
            app.NewGameButton.Position = [286 28 166 52];
            app.NewGameButton.Text = 'New Game';

            % Create ExitGameButton
            app.ExitGameButton = uibutton(app.UIFigure, 'push');
            app.ExitGameButton.ButtonPushedFcn = createCallbackFcn(app, @ExitGameButtonPushed, true);
            app.ExitGameButton.BackgroundColor = [0.8471 0.949 0.0745];
            app.ExitGameButton.FontName = 'Bahnschrift';
            app.ExitGameButton.FontSize = 24;
            app.ExitGameButton.Position = [287 91 166 52];
            app.ExitGameButton.Text = 'Exit Game';

            % Create PlayerButton
            app.PlayerButton = uibutton(app.UIFigure, 'push');
            app.PlayerButton.ButtonPushedFcn = createCallbackFcn(app, @SinglePlayer, true);
            app.PlayerButton.BackgroundColor = [0.8392 0.2392 0.8588];
            app.PlayerButton.FontName = 'Bahnschrift';
            app.PlayerButton.FontSize = 24;
            app.PlayerButton.Position = [115 271 186 148];
            app.PlayerButton.Text = '1 Player';

            % Create PlayerButton_2
            app.PlayerButton_2 = uibutton(app.UIFigure, 'push');
            app.PlayerButton_2.ButtonPushedFcn = createCallbackFcn(app, @Multiplayer, true);
            app.PlayerButton_2.BackgroundColor = [0.0745 0.949 0.7451];
            app.PlayerButton_2.FontName = 'Bahnschrift';
            app.PlayerButton_2.FontSize = 24;
            app.PlayerButton_2.Position = [442 271 186 148];
            app.PlayerButton_2.Text = '2 Player';

            % Create DiceRoll1
            app.DiceRoll1 = uiimage(app.UIFigure);
            app.DiceRoll1.Position = [254 477 231 247];
            app.DiceRoll1.ImageSource = '220834 (1) (1).png';

            % Create DiceRoll2
            app.DiceRoll2 = uiimage(app.UIFigure);
            app.DiceRoll2.Position = [220 484 298 233];
            app.DiceRoll2.ImageSource = '220835 (1).png';

            % Create DiceRoll3
            app.DiceRoll3 = uiimage(app.UIFigure);
            app.DiceRoll3.Position = [226 482 286 235];
            app.DiceRoll3.ImageSource = '220836 (1).png';

            % Create DiceRoll4
            app.DiceRoll4 = uiimage(app.UIFigure);
            app.DiceRoll4.Position = [254 484 231 233];
            app.DiceRoll4.ImageSource = '220837 (1).png';

            % Create DiceRoll5
            app.DiceRoll5 = uiimage(app.UIFigure);
            app.DiceRoll5.Position = [237 484 264 233];
            app.DiceRoll5.ImageSource = '220838 (1).png';

            % Create DiceRoll6
            app.DiceRoll6 = uiimage(app.UIFigure);
            app.DiceRoll6.Position = [250 484 240 233];
            app.DiceRoll6.ImageSource = '220839 (1).png';

            % Create betField
            app.betField = uieditfield(app.UIFigure, 'text');
            app.betField.InputType = 'digits';
            app.betField.FontName = 'Calibri';
            app.betField.FontSize = 24;
            app.betField.FontColor = [1 1 1];
            app.betField.BackgroundColor = [0.9882 0.4157 0.5216];
            app.betField.Placeholder = 'Enter Bet ($)';
            app.betField.Position = [74 43 154 61];

            % Create balanceField
            app.balanceField = uitextarea(app.UIFigure);
            app.balanceField.FontName = 'Bahnschrift';
            app.balanceField.FontSize = 18;
            app.balanceField.FontColor = [1 1 1];
            app.balanceField.BackgroundColor = [0.6353 0.0784 0.1843];
            app.balanceField.Position = [75 111 153 51];

            % Create Player1Button
            app.Player1Button = uibutton(app.UIFigure, 'push');
            app.Player1Button.ButtonPushedFcn = createCallbackFcn(app, @Player1ButtonPushed, true);
            app.Player1Button.BackgroundColor = [0 0 0];
            app.Player1Button.FontColor = [1 1 1];
            app.Player1Button.Position = [317 402 109 76];
            app.Player1Button.Text = 'Player 1';

            % Create Player2Button
            app.Player2Button = uibutton(app.UIFigure, 'push');
            app.Player2Button.ButtonPushedFcn = createCallbackFcn(app, @Player2ButtonPushed, true);
            app.Player2Button.BackgroundColor = [0.149 0.149 0.149];
            app.Player2Button.FontColor = [1 1 1];
            app.Player2Button.Position = [317 327 109 76];
            app.Player2Button.Text = 'Player 2';

            % Create SeeScoreButton
            app.SeeScoreButton = uibutton(app.UIFigure, 'push');
            app.SeeScoreButton.ButtonPushedFcn = createCallbackFcn(app, @SeeScoreButtonPushed, true);
            app.SeeScoreButton.BackgroundColor = [0.0745 0.6235 1];
            app.SeeScoreButton.FontName = 'Bahnschrift';
            app.SeeScoreButton.FontSize = 24;
            app.SeeScoreButton.Position = [312 172 119 148];
            app.SeeScoreButton.Text = {'See'; 'Score'};

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app1_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end