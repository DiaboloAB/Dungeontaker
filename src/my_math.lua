function my_abs(i)
    if (i < 0) then
        return i * -1
    end
    return i
end

function my_sign(i)
    if (i < 0) then
        return -1
    end
    if (i > 0) then
        return 1
    end
    return 0
end
