classdef GameCalc
    %GAMECALC - Contains Functions for Dice Rolling, Score Calculation  
    
    properties
        Property1
        
        
    end
    
    methods
        function winner = GameCalc(player1,player2)
            %GAMECALC Determines winner of each round based on game rules
            % Return value of 1 is player1, 2 is player2, 0 is dealer, and
            % -1 is a draw
            % Called when last player ends turn

            dealerScore = dealer();
            
            switch player2
                case 0                              
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
                            elseif player1 == 0
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
                            else
                                winner = 0;
                            end
                    end    
            end   
        end
    end

    methods(Static)
        function roll = diceRoll()
            %DICEROLL Generates a random number between 0 and 7

        end

        function score = dealer()
            %DEALER Calculates dealer score
            score = diceRoll + diceRoll;
            while score <= 7
                score = score + diceRoll;
            end
            if score > 12
                score = 0;
            end
        end
    end
end

