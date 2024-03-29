classdef GameCalc
    %GAMECALC - Contains Functions for Dice Rolling, Score Calculation  
    
    properties
        rollsArrayP1;
        rollsArrayP2;
        dealerScore;
        %dealerVal;
                
    end
    

    methods(Static)
        function roll = diceRoll()
            %DICEROLL Generates and returns a random number between 0 and 7
            %rolls dice and stores them as an array, can easily be added to find player score if needed
            persistent rollsArray
            if isempty(rollsArray)
                rollsArray = [];
            end
            roll = randi(6); 
            rollsArray = [rollsArray, roll];
            %roll = rollsArray;
        end

        function dealerScore = Dealer()
            %DEALER Calculates and returns dealer score
            dealerScore = GameCalc.diceRoll() + GameCalc.diceRoll();
            while dealerScore <= 6
                dealerScore = dealerScore + GameCalc.diceRoll();
            end
            if dealerScore > 12
                dealerScore = 0; 
            end
        end

        function winner = scoreCalc(player1,player2)
            %GAMECALC Determines winner of each round based on game rules
            % Return value of 1 is player1, 2 is player2, 3 is both players, 0 is dealer, and -1 is a draw
            % Sould be called when last player ends turn
            %global dealerVal;
            global dealerScore;
            dealerScore = GameCalc.Dealer();
            %dealerScore = 1;
            switch player2
                case -1                              
                    %If player2 is zero, game is in single player mode
                    switch dealerScore
                        case 0
                            %Dealer Busts, player1 wins
                            winner = 1;
                            if player1 == 0
                                %If player also busts, a draw occurs
                                winner = -1;
                            end
                        otherwise
                            %Dealer Score is valid
                            if player1 > dealerScore 
                                if player1 > 12
                                    %If player busts, dealer wins
                                    winner = 0;
                                else
                                    %Player wins
                                    winner = 1;
                                end
                            else 
                                winner = 0;
                            end
                    end                    
                otherwise
                    %Two Player mode
                    switch dealerScore
                        case 0
                            %Dealer Busts, player1 and 2 win
                            if player1 == 0 && player2 == 0
                                %If both players bust, a draw occurs
                                winner = -1;
                            elseif player1 > 0 && player2 > 0
                                winner = 3;
                            elseif player1 < player2
                                winner = 2;
                            else
                                winner = 1;
                            end
                        otherwise
                            if player1 > player2 && player1 > dealerScore && player1 ~= 0
                                %If player 1 is greater than both other
                                %scores and zero, player1 wins
                                winner = 1;
                            elseif player2 > dealerScore && player2 > player1 && player2 ~= 0
                                winner = 2;
                            elseif player2 > dealerScore && player1 == player2
                                winner = 3;
                            else
                                winner = 0;
                            end
                    end  
            end
        end 

        function dealer = dealerVal()
            global dealerScore; 
            dealer = dealerScore;
        end

        function winnings = gamba(playerBet, winner)
            if winner == 1
                winnings = playerBet * 2;
            else
                winnings = 0;
            end
        end
    end
end

