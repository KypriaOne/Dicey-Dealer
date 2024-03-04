classdef GameCalc
    %GAMECALC - Contains Functions for Dice Rolling, Score Calculation
    %   
    
    properties
        Property1
        diceRoll
        
    end
    
    methods
        function obj = GameCalc(player1,player2)
            %GAMECALC Determines winner of each round based on game rules
            dealerScore = %DEALER FUNCTION CALL
            
            switch player2
                case 0
                    
                otherwise
                
            end
            
            
            
            
            
            obj.Property1 = player1 + player2;
        end
        
       

        %README I would put the dice rolling function in here and set
        %public variables up top under properties
    end

    methods(Static)
         function score = dealer
            %DEALER Calculates dealer score based on established rules
            score = 0;
         end
    end
end

