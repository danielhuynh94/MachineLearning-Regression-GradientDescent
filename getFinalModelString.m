function finalModelString = getFinalModelString(cofficients)
    finalModelString = "Final model: y = ";
    for i = 1:size(cofficients,1)
        finalModelString = strcat(finalModelString, num2str(cofficients(i)));
        if i > 1
            finalModelString = strcat(finalModelString, "*x", num2str(i-1));
        end
        if i < size(cofficients,1)
            finalModelString = strcat(finalModelString, " + ");
        end
    end
end