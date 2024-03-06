function roll = diceRoll()
            %rolls dice and stores them as an array, can easily be added to
            %find player score if needed
            persistent rollsArray
            if isempty(rollsArray)
                rollsArray = [];
            end
            roll = randi(6)
            rollsArray = [rollsArray, roll];
            roll = rollsArray
        end