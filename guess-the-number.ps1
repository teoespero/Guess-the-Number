##################################################################################################
# guess-the-number.ps1
# Teo Espero
# Cloud and Systems Administration (BS)
# Western Governors University
#
# create a new Windows PowerShell game called the Guess My Number game. This game will challenge 
# the player to guess a randomly generated number in the range of 1 to 100 in as few tries as 
# possible. 
##################################################################################################

## declare our vars

## Define the variables used in this script to store player answers

$number = 0                              # Keeps track of the game's secret number
$noOfGuesses = 0                         # Keeps track of the number of guesses made
$randomNo = New-Object System.Random     # This variable stores a random object
$playGame = "Yes"                        # Controls when to quit the game
$status = "Play"                         # Controls the current round of play
$guess = 0                               # Stores the player's guess
$reply = ""                              # Stores the player's response when asked to play again
$range = 0                               # Allow the user to put in a range

## Display the game's opening screen

Clear-Host

Write-Host "`n`n`n`n`t W E L C O M E   T O   T H E   G U E S S   M Y"
Write-Host "`n`n`n`t             N U M B E R   G A M E"
Write-Host "`n`n`n`t`t`t by Teo Espero"
Write-Host "`n`n`n`n`n`n`n`n`n`n Press Enter to continue."

## Pause the game until the player presses the Enter key
Read-Host

## get the guessing range

Clear-Host

#################################################################
## Loop until the player decides to quit the game

while ($playGame -ne "No") {
    while($range -eq 0){
        Clear-Host

        $range = Read-Host " Enter the max number"

        ## Generate the game's random number between 1 and 
        ## the max number specified by the user)
    
        $number = $randomNo.Next(1,$range)

        ##Clear the Windows command console screen

        Clear-Host
    
        ## Loop until the player guesses the secret number
        Write-Host $number
        while ($status -ne "Stop") {

            ## Prompt the player to guess a number
            while ($guess -eq "") {
                Clear-Host #Clear the Windows command console screen
                Write-Host
            
                ## Collect the player's guess
                $guess = Read-Host " Enter a number between 1 and $range"
            }

            ## Keep track of the number of guesses made so far

            $noOfGuesses++
            if ($guess -gt $range) {                 ## The player's guess was beyond the range                Clear-Host # Clear the Windows command console screen
        
                Write-Host "`n Sorry. Your guess was way beyond the range. Press Enter to guess again."
                $guess = "" # Reset the player's guess
        
                Read-Host # Pause the game until the player presses the Enter key
            }            elseif($guess -eq 0){                ## The player's guess was 0                Clear-Host # Clear the Windows command console screen
        
                Write-Host "`n Sorry. Your guess was equal to 0. Press Enter to guess again."
                $guess = "" # Reset the player's guess
        
                Read-Host # Pause the game until the player presses the Enter key            }            else{                ## The player's guess was too low                if ($guess -lt $number) {                     Clear-Host # Clear the Windows command console screen
        
                    Write-Host "`n Sorry. Your guess was too low. Press Enter to guess again."
                    $guess = "" # Reset the player's guess
        
                    Read-Host # Pause the game until the player presses the Enter key
                }
                elseif ($guess -gt $number) { 
                    ## The player's guess was too high
                    
                    Clear-Host # Clear the Windows command console screen
        
                    Write-Host "`n Sorry. Your guess was too high. Press Enter to guess again."
                    $guess = "" # Reset the player's guess
        
                    Read-Host # Pause the game until the player presses the Enter key
                }
                else { 
                    ## The player has guessed the game's secret number
                    
                    Clear-Host # Clear the Windows command console screen
        
                    Write-Host "`n Congratulations. You guessed my number! Press Enter to continue."
        
                    $status = "Stop" # Reset the player's guess
        
                    Read-Host # Pause the game until the player presses the Enter key
                }
            }
        }

        ## Clear the Windows command console screen
        Clear-Host
    
        ## Display the game's opening screen
        Write-Host "`n                     Game Statistics"
        Write-Host " -----------------------------------------------------------"
        Write-Host "`n            The secret number was: $number."
        Write-Host "`n        You guessed it in $noOfGuesses guesses.`n"        Write-Host " -----------------------------------------------------------"
        Write-Host "`n`n`n`n`n`n`n`n`n`n`n`n`n`n Press Enter to continue."
    
        ## Pause the game until the player presses the Enter key
        Read-Host
    
        ## Clear the Windows command console screen
        Clear-Host
    
        $reply = "" # Stores the player's response when asked to play again

        ## Prompt the player to play another round
        while ($reply -eq "") {
            Clear-Host # Clear the Windows command console screen
            Write-Host
        
            ## Collect the player’s answer
            $reply = Read-Host " Would you like to play again? (Y/N) "

            ## Validate player input, allowing only Y and N as acceptable responses
            if (($reply -ne "Y") -and ($reply -ne "N")) {
                $reply = "" # Reset the variable to its default value
                }
        }

        
        if ($reply -eq "Y") {
            ## The player has elected to play again
    
            ## Reset variables to their default values

            $number = 0
            $noOfGuesses = 0
            $status = "Play"            $guess = 0
            $range = 0
        }
        else { 
            ## The player has decided to quit playing
            
            $playGame = "No" # Modify variable indicating that it is time to
            ## terminate gameplay
        }
    }
}


## Show credits 

Clear-Host

Write-Host "`n`n`n`n`n`n"
Write-Host "                                     Guess the Number Game`n"
Write-Host "             Copyright 2019 - Teo Espero, Cloud and Systems Administration (BS)`n"
Write-Host "                                   Western Governors University"
Write-Host "`n`n`n`n`n`n`n" 

## create a 3-second delay before returning the player to the command shell

Start-Sleep -Seconds 3

Clear-Host

##################################################################################################
## EOF 