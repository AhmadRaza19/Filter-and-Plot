% Project 6 - Filter and Plot
% Ahmad Raza
% CS 109, Koehler, Fall 2020


% INPUTS
%   opt - a value of 1-5 or -1. If the user enters any other value of opt 
%       other than -1 or 1-5, then return an empty array ([]), do not plot, 
%       and provide a useful error message (any message is fine).
%
%     Each option changes the grid array in a specific way:
%       -opt 1 - First, find the maximum value in the gridIn array. Then,
%             all elements in gridIn, that are either 2 or 4, should be 
%             set to the maximum value found. Assign this new updated 
%             gridIn to the output, gridOut.
%       -opt 2 - First, find the minimum value in the gridIn array. Then,
%             set all values in all odd rows equal to the minimum value 
%             found. Assign this new updated gridIn to the output, gridOut.
%       -opt 3 - First, find the minimum value in the gridIn array. Then, 
%             set the diagonal and off diagonal values of the array equal 
%             the minimum value found. Assign this new updated gridIn to 
%             the output, gridOut.
%       -opt 4 - First, find the minimum value in the gridIn array. Then,
%             set all elements in all four boundaries of the grid to the 
%             minimum value. Assign this new updated gridIn to the 
%             output, gridOut.
%       -opt 5 - First, find the maximum value in the gridIn array. Then, 
%             find the middle row and middle column of gridIn and set all 
%             values in the middle row and middle column to the maximum 
%             value found. If there is an odd number of rows/columns, 
%             there will be one middle. If there is an even number of 
%             rows/columns, there will be two middles. Assign this new 
%             updated gridIn to the output, gridOut. 
% 
%     Functions that might be useful include: floor, ceil, rem, etc.
%
%       -opt -1 - assign gridOut to gridIn unchanged.
%    
%   gridIn - the 2D array that will be filtered. It is required that this
%          array is square (number of columns equals number of rows). 
%          If the grid is not square, return an empty array, do not plot
%          anything, and display a userful error message.
%
% OUTPUTS
%   gridOut - The changed or (unchanged) inputted array based on the opt 
%           value.
%
%   In addition to outputting gridOut, this function should also plot it
%   using the imagesc function. See project description for sample plots 
%   (the plots use the colormap hot, and set axis to equal and tight). 
%   The plot should also have the proper title.  
% Here are two possible test grids, a big and normal one.
% The normal sized one is shown in the project instructions.
gridBig = randi([1,6], [10, 10]);  
gridNorm=[1,2,2,3,1;3,3,4,4,1;2,1,1,5,2;4,5,4,5,6;6,4,4,3,2];

% Assign the test grid here, change to change which test is run
grid1 = gridNorm;

% Test the function
n = 5;
opts = 1:n;
figure
subplot(2, (n+1)/2, 1)
filterAndPlot(-1, grid1);
for i = opts
    subplot(2, (n+1)/2, i+1)
    filterAndPlot(i, grid1);
end
function [gridOut] = filterAndPlot(opt, gridIn)
    % you will need to update this gridOut variable, 
    % this is here so the basic starter code runs without errors 
    
    %defines some basic variables that will be used in later conditional
    %statements
    opt = input("Enter a value from 1-5 or -1");
    sz = size(gridIn);
    j = 1;
    mx0 = max(gridIn);
    mx = max(mx0);
    mn0 = min(gridIn);
    mn = min(mn0);
    vldinp = [-1,1,2,3,4,5];
    if (opt == 1) %opt 1 if statement
        ind = find(gridIn == 2 | gridIn == 4);
        gridIn(ind) = mx;
        gridOut = gridIn;
        ttl = "filtered, opt = 1";
        vl = 1;
    
    elseif (opt == 2) %opt 2 elseif statement
        while (j <= sz(1))
            if (rem(j,2) == 1) %case for odd numbers
                gridIn(j,:) = mn;
                gridOut(j,:) = gridIn(j,:);
            else %case for even numbers
                gridOut(j,:) = gridIn(j,:);
            end
            j = j + 1;
            ttl = "filtered, opt = 2";
        end
        vl = 1;
    elseif (opt == 3) %opt 3 elseif statement
        gridIn(1:(sz+1):end) = mn;
        gridIn = fliplr(gridIn);
        gridIn(1:(sz+1):end) = mn;
        gridIn = fliplr(gridIn);
        gridOut = gridIn;
        ttl ="filtered, opt = 3";
        vl = 1;
    elseif (opt == 4) %opt 4 elseif statement
        gridIn(1,:) = mn;
        gridIn(:, 1) = mn;
        gridIn(sz(1), :) = mn;
        gridIn(:, sz(2)) = mn;
        gridOut = gridIn;
        ttl = "filtered, opt = 4";
        vl = 1;
    elseif (opt == 5) %opt 5 elseif statement
        rownum = sz(1);
        colnum = sz(2);
        if (rem(rownum, 2) == 1) %row = odd condition
            midrow = (rownum + 1) / 2;
        else %row = even condition
            midrow = [rownum / 2, (rownum /2) + 1]; 
        end
        if (rem(colnum, 2) == 1) %col = odd condition
            midcol = (colnum + 1) / 2;
        else %col = even condition
            midcol = [colnum / 2, (colnum /2) + 1];
        end
        gridIn(midrow,:) = mx;
        gridIn(:,midcol) = mx;
        gridOut = gridIn;
        ttl = "filtered, opt = 5";
        vl = 1;
    elseif (opt == -1) %opt = -1 elseif statement
        gridOut = [];
        gridOut = gridIn;
        ttl = "original";
        vl = 1;
    else %invalid opt value else statement
        gridOut = [];
        disp("Invalid value, please try again")
        opt = input("Enter a value from 1-5 or -1");
    end
    if (vl == 1)   %conditional statement for graphing only when valid input is entered 
        imagesc(gridOut);
        colorbar;
        colormap hot;
        axis equal;
        axis tight;
        title(ttl);
    end
    if (sz(1) ~= sz(2))
        gridOut = [];
    end

    %TODO:  write this function
    
end